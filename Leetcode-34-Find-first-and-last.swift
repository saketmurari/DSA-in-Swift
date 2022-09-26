class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        guard !nums.isEmpty else {
            return [-1,-1]
        }
       
        let start = 0
        let end = nums.count-1
        
        var rLeft = -1
        var rRight = -1
        
        var haveFoundOnceAtleastOnce = false
        
        rLeft = pos(nums, target, start, end, false, &haveFoundOnceAtleastOnce)
        rRight = pos(nums, target, start, end, true, &haveFoundOnceAtleastOnce)
        
        if haveFoundOnceAtleastOnce {
             return [rLeft, rRight-1]
        }
        else {
            return [-1,-1]
        }
        
    }
    
    func pos(_ nums:[Int], _ target:Int, _ left:Int, _ right:Int, _ inRightDirection: Bool, _ haveFoundOnceAtleastOnce: inout Bool) -> Int {
        
        if left > right {
            return left
        }
        
        let pivot = left + ( right - left) / 2
        
        if target == nums[pivot] {
            
            haveFoundOnceAtleastOnce = true
            
            if inRightDirection {
                 return pos(nums, target, pivot+1, right, inRightDirection, &haveFoundOnceAtleastOnce)
            }
            else {
                 return pos(nums, target, left, pivot-1, inRightDirection, &haveFoundOnceAtleastOnce)
            }
        }
        
        else if target > nums[pivot] {
            return pos(nums, target, pivot+1, right, inRightDirection, &haveFoundOnceAtleastOnce)
        }
        else {
            return pos(nums, target, left, pivot-1, inRightDirection, &haveFoundOnceAtleastOnce)
        }
    }
    
}
