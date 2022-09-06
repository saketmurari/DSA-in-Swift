class Solution {
    
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones
        stones.sort(by: >)
        
        while stones.count > 1 {
                let diff =  abs(stones[0] - stones[1])
                stones.removeFirst()
                stones.removeFirst()
            
            if diff != 0 {
                if stones.count == 0 {
                    return diff
                }
                let pos = findIndex(&stones, diff, 0, stones.count-1 )
                stones.insert(diff, at: pos)
            }
    }
      
        if stones.count == 0 {
            return 0
        }
        else {
            return stones[0]
        }
        
    }
    
    func findIndex(_ stones: inout[Int], _ val: Int, _ left: Int, _ right: Int) -> Int {
        
        let pivot = (left+right)/2
        
        if stones[pivot] == val {
            return pivot
        }
        
        if left > right {
            return left
        }
        
        if stones[pivot] > val {
            return findIndex(&stones, val, pivot+1, right)
        }
        else {
            return findIndex(&stones, val, left, pivot - 1)
        }
        
    }
}
