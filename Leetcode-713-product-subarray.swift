class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        
        var i = 0
        var product = 1
        var result = 0
        
        for j in 0...nums.count-1 {
            
            product = product*nums[j]
            
            while product >= 100 {
                
                 product = product/nums[i]
                 i += 1
            }
          
            // remember this formula to count number of subarrays while you slide down the window by going ahead with left
            result = result + j - i + 1
          
            }
            return result
        
    }
}
