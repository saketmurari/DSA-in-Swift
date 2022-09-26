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
        
        
        return pos
    }
    
    func checkPos (_ nums:[Int], _ left:Int, _ right:Int) -> Int {
        
        let p = (left+right)/2
        
        if nums[p] > nums[p+1] {
            return nums[p+1]
        }
        if nums[p-1] > nums[p] {
           return nums[p] 
        }
        
        if nums[p] > nums[0] {
            return checkPos(nums, p+1, right)
        }
        else {
             return checkPos(nums, left, p-1)
        }
        
    }
    
    
    
    
}
