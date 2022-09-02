class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        
        /// This dp array will help us know, if at a particular index, with this jump, we had a path - if yes, it would contain true, or false
        var dp:[String:Bool] = [:]
        return canCross (stones, 0, 0, stones.count, &dp)
    }
    
    
    func canCross(_ stones: [Int], _ index: Int, _ jump: Int, _ count: Int, _ dp: inout [String:Bool]) -> Bool {
        
        let key = "\(index)\(jump)"
        if let val = dp[key] {
            return val
        }
        if index == count-1 {
            return true
        }
        
        if index > count {
            return false
        }
        
        /// k-1, k, k+1
        for step in (jump-1)...(jump+1) {
            
            /// We are not interested in going back, only forward only positive jump is considered
            if step > 0 {
                
                /// This should be the value of the stone we are trying to jump to, but does it exist?
                let newVal = stones[index] + step
                
                // if it exist then what is it's index?
                
                if let newIndex = stones.firstIndex(of: newVal) {
                    
                    /// Now that we know that index exist, let move to that index, with last jump taken
                    if newIndex < count {
                        if canCross(stones, newIndex, step, count, &dp) {
                            dp[key] = true
                            return true
                        }
                    }
                }
                
            }
        }
        dp[key] = false
        return false
    }
}
