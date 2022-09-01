//
//  Leetcode-78-Climbing-stairs.swift
//  Programs
//
//  Created by saket.kumar on 01/09/22.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    
  var dp:[Int] = Array(repeating: -1, count: n+1)
    
    func countWays(_ index: Int) -> Int {
        
        if index == n {
            return 1
        }
        if index > n {
            return 0
        }
        
         if dp[index] != -1 {
            return dp[index]
        }
        
    let left = countWays( index+1)
    let right = countWays( index+2)
    let sum = left+right
    dp[index] = sum
    return sum
        
    }
   return countWays(0)
    
}
