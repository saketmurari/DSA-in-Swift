class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        
       /* below code is for recursion solution to work
        var rows = matrix.count
        var columns = matrix[0].count
        var minimum = Int.max
        var dp = Array(repeating: Array(repeating: -101, count: columns), count: rows)
        
        for i in 0...columns-1 {
             let maxi = findMinimumPathSum(0, i, matrix, &dp)
             minimum = min(minimum, maxi)
        }
        */
        
        /* this is for tabulation solution
              return tabulation(matrix)
        */
        
        // This is for best possible case where Time complexity if O(n*m) and space complexity O(1)
        
        return optimised(matrix)
        // return minimum
    }
    
    func findMinimumPathSum ( _ i: Int, _ j: Int, _ mat: [[Int]], _ dp: inout [[Int]]) -> Int {
        
        if j < 0 || j > mat[0].count-1 {
            return Int.max
        }
        
        if i == mat.count-1 {
            return mat[mat.count-1][j]
        }
        
        if dp[i][j] != -101 {
            return dp[i][j]
        }
        
        var left = Int.max
        var down = Int.max
        var right = Int.max
        
        if j - 1 >= 0 {
            left = mat[i][j] + findMinimumPathSum(i+1, j-1, mat, &dp)
        }
        
        down = mat[i][j] + findMinimumPathSum(i+1, j, mat, &dp)
        
        if j + 1 < mat[0].count {
            right = mat[i][j] + findMinimumPathSum(i+1, j+1, mat, &dp)
        }
        
        dp[i][j] =  min(left, down, right)
        return dp[i][j]
    }
    
    func tabulation(_ matrix: [[Int]] ) -> Int {
        
        var rows = matrix.count
        var columns = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: columns), count: rows)

        dp[rows-1] = matrix[rows-1]
        
        var i = rows-2
        
        while i >= 0 {
            
            var j = 0
            while j < columns {
                
                var left = Int.max
                var down = Int.max
                var right = Int.max
                
                if j - 1 >= 0 {
                    left = matrix[i][j] + dp[i+1][j-1]
                }
                
                down = matrix[i][j] + dp[i+1][j]
                
                if j + 1 < columns {
                    right = matrix[i][j] + dp[i+1][j+1]
                }
                dp[i][j] =  min(left, down, right)
                j += 1
            }
            i -= 1
        }
        
        var result = Int.max
        
        for item in dp.first! {
            result = min(result, item)
        }
        
        return result
        
    }
    
    func optimised(_ matrix: [[Int]]) -> Int {
        
        var rows = matrix.count
        var columns = matrix[0].count
        var dp = Array(repeating: 0, count: columns)

        dp = matrix[rows-1]
        
        var i = rows-2
        
        while i >= 0 {
            
            var j = 0
            var current = Array(repeating: 0, count: columns)
            while j < columns {
                
                var left = Int.max
                var down = Int.max
                var right = Int.max
                
                if j - 1 >= 0 {
                    left = matrix[i][j] + dp[j-1]
                }
                
                down = matrix[i][j] + dp[j]
                
                if j + 1 < columns {
                    right = matrix[i][j] + dp[j+1]
                }
                current[j] =  min(left, down, right)
                j += 1
            }
            dp = current
            i -= 1
        }
        
        var result = Int.max
        
        for item in dp {
            result = min(result, item)
        }
        
        return result
        
    }
    
}
