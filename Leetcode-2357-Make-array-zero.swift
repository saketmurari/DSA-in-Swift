class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        
        // Solution here is just count distinct elements.
        
        
        var res: Set<Int> = []
        var nums = nums
        
        for item in nums {
            if item == 0 {
                continue
            }
            res.insert(item)
        }
        
        
        return res.count
    }
}
