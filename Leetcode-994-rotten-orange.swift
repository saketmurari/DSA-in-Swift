//
//  RottenOrangeBFS.swift
//  Programs
//
//  Created by saket.kumar on 23/09/22.
//

import Foundation
class RottenOrangeBFS {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        // This is queue, FIFO - append, and removeFirst
        var queue = [[Int]]()
        var myGrid = grid
        var nonEmptyCells = 0
        
        for (i, rowItem) in grid.enumerated() {
            
            for (j, columnItem) in rowItem.enumerated() {
                
                if columnItem == 2 {
                    queue.append([i,j])
                }
                if columnItem != 0 {
                    nonEmptyCells += 1
                }
            }
        }
        var totalQueueProcessed = 0
        var finalCount = 0
        
        while queue.count > 0 {
            
            var queueCount = queue.count
            totalQueueProcessed += queueCount
            
            while queueCount > 0 {
                queueCount -= 1
                let queueItem = queue.first!
                queue.removeFirst()
                let directions = [[1,0], [-1,0], [0,1], [0,-1]]
                
                for direction in directions {
                    
                    let i = queueItem[0] + direction[0]
                    let j = queueItem[1] + direction[1]
                    
                    if i < 0 || i >= myGrid.count || j < 0 || j >= myGrid[0].count || myGrid[i][j] == 0 || myGrid[i][j] == 2 {
                        continue
                    }
                    myGrid[i][j] = 2
                    queue.append([i,j])
                }
            }
            /// in last operation all queue gets empty that is not supposed to be counted hence the check
            if !queue.isEmpty {
                finalCount += 1
            }
            
        }
        return totalQueueProcessed == nonEmptyCells ? finalCount : -1
    }
}

