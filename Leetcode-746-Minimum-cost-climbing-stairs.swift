//
//  Leetcode-746-Minimum-cost-climbing-stairs.swift
//  Programs
//
//  Created by saket.kumar on 02/09/22.
//

import Foundation

class Solution {
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        var next = 0
        var next2 = 0
        
        var counter = cost.count-1
        
        while counter >= 0 {
            let sum1 = cost[counter] + next
            let sum2 = cost[counter] + next2
            let current = min (sum1, sum2)
            next2 = next
            next = current
            counter -= 1
        }
        return min(next, next2)
        
    }
    
    func minCostWithMemo(_ cost: [Int], _ index: Int, _ dp: inout [Int]) -> Int {
        
        if dp[index] != 0 {
            return dp[index]
        }
        if index == cost.count || index == cost.count+1 {
            return 0
        }
        
        let left = cost[index] + minCost(cost, index+1, &dp)
        let right = cost[index] + minCost(cost, index+2, &dp)
        dp[index] = min (left, right)
        return dp[index]
    }
    
    func minCostClimbingStairsWithTabulation(_ cost: [Int]) -> Int {
        
        var dp:[Int] = Array(repeating: 0, count: cost.count+2)
        var counter = cost.count-1
        
        while counter >= 0 {
            let sum1 = cost[counter] + dp[counter+1]
            let sum2 = cost[counter] + dp[counter+2]
            dp[counter] = min (sum1, sum2)
            print(dp[counter])
            counter -= 1
            
        }
        return min(dp[0], dp[1])
        
    }
}
