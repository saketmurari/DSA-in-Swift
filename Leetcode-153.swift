class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.last! > nums.first! {
            return nums.first!
        }
        if nums.last!  == nums.first! {
            return nums.first!
        }
        
        var left = 0
        var right = nums.count - 1
        
        var pos = checkPos(nums, 0, right)
        
        return nums[pos]
    }
    
    func checkPos (_ nums:[Int], _ left:Int, _ right:Int) -> Int {
        
        if left > right {
            return left
        }
        let p = (left+right)/2
        
        if nums[p] >= nums[0] {
            return checkPos(nums, p+1, right)
        }
        else {
             return checkPos(nums, left, p-1)
        }
        
    }
