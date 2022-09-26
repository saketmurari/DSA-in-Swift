class Solution {
    var mat = [[Int]]()
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if target < matrix[0][0] || target > matrix.last!.last! {
            return false
        }
        
        mat = matrix
        
        let row = findRowPos(target, 0, matrix.count-1)
        
        let column = findColPos(matrix[row], target, 0, matrix[0].count-1)
        
        return matrix[row][column] == target ? true : false
    }
    
    func findRowPos( _ target: Int, _ left: Int, _ right: Int) -> Int {
        
        if left > right {
            return left
        }
        
        let pivot = left + (right-left)/2
        
        if target == mat[pivot][mat[0].count-1] {
            return pivot
        }
        else if target > mat[pivot][mat[0].count-1] {
            return findRowPos(target, pivot+1, right)
        }
        else {
             return findRowPos(target, left, pivot-1)
        }
    }
    func findColPos( _ row:[Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
        
        if left > right {
            return left
        }
        
        let pivot = left + (right-left)/2
        
        if target == row[pivot] {
            return pivot
        }
        else if target > row[pivot] {
            return findColPos(row, target, pivot+1, right)
        }
        else {
             return findColPos(row, target, left, pivot-1)
        }
    }
    
}
