class MinimumFalling {
    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        
       return optimal(grid)
    }
    
    
    func optimal( _ grid: [[Int]]) -> Int {
        
        let rows = grid.count
        let columns = grid[0].count
        
        
        var prev = grid.last!
     
        
        var i = rows-2
        
        while i >= 0 {
            
            var current = Array(repeating: 0, count: columns)
            
            var j = 0
            
            while j < columns {
                
                var minimum = Int.max
                
                for k in 0...columns-1 {

                    if k != j {
                       minimum = min(minimum, (grid[i][j] + prev[k]))
                    }
                }
                
                current[j] = minimum
                j += 1
            }
            prev = current
            
            i -= 1
        }
        
        var minimum = Int.max
        for item in prev {
            minimum = min(minimum, item)
        }
        return minimum
    }
}
