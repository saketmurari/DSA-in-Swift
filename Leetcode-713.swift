class Solution {
  func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k == 0 || k == 1 {
      return 0 
    } 
    var i = 0 
    var product = 1
    var result = 0 
    for j in 0...nums.count-1 {
      product = product*nums[j] 
      while product >= k {
        product = product/nums[i] i += 1 
      }
      // remember this formula to count number of subarrays while you slide down the window by going ahead with left 
      result = result + j - i + 1
    }
    return result 
  } 
}
