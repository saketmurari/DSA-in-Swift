class Solution {
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var rows = triangle.count
        var columns = triangle.last!.count
        
        
        return spaceOptimised(rows, columns, triangle)
        
    }
    
    func findMinimum( _ triangle: [[Int]], _ i:Int, _ j: Int, _ dp: inout [[Int]]) -> Int {
        
        if i == triangle.count-1 {
            return triangle[i][j]
        }
        if dp[i][j] != -100001 {
            return dp[i][j]
        }
        
        var path1Sum = triangle[i][j] + findMinimum(triangle, i+1, j, &dp)
        var path2Sum = triangle[i][j] + findMinimum(triangle, i+1, j+1, &dp)
        
        
        dp[i][j] = min(path1Sum, path2Sum)
        return dp[i][j]
    }
    
    
    func tabulation( _ rows:Int, _ columns:Int, _ triangle: [[Int]]) -> Int {
        
      var dp = Array(repeating: Array(repeating: 0, count: columns), count: rows)
      dp[rows-1] = triangle[rows-1]
        var i = rows-2
        
        while i >= 0 {
            var j = 0
            while j <= i {
                var left = triangle[i][j] + dp[i+1][j]
                var right = triangle[i][j] + dp[i+1][j+1]
                dp[i][j] = min(left, right)
                j += 1
            }
            i -= 1
        }
        return dp[0][0]
    }
    
    
    func spaceOptimised( _ rows:Int, _ columns:Int, _ triangle: [[Int]]) -> Int {
        
      var prev = triangle[rows-1]
      var i = rows-2
        while i >= 0 {
            var j = 0
            
            var current = Array(repeating: 0, count: i+1)
            
            while j <= i {
                var left = triangle[i][j] + prev[j]
                var right = triangle[i][j] + prev[j+1]
                current[j] = min(left, right)
                j += 1
            }
            prev = current
            i -= 1
        }
        return prev[0]
    }
}
