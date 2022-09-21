class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        
        var rows = grid.count
        var visit = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)

        var maxi = Int.min
        
        for i in 0...rows-1 {
            for j in 0...grid[i].count-1 {
                
                let area = dfs(grid, &visit, i, j)
                maxi = max(maxi, area)
            }
        }
        
        return maxi
    }
    
    func dfs(_ grid: [[Int]], _ visit: inout [[Bool]], _ i: Int, _ j: Int) -> Int {
        
        if i < 0 ||
        i > grid.count-1 ||
        j < 0 ||
        j > grid[0].count-1 ||
        visit[i][j] == true ||
        grid[i][j] == 0 {
            return 0
        }
        
        visit[i][j] = true
        
        let area = grid[i][j] + dfs(grid, &visit, i+1, j) + dfs(grid, &visit, i-1, j) + dfs(grid, &visit, i, j+1) + dfs(grid, &visit, i, j-1)
        
        return area
    }
}
