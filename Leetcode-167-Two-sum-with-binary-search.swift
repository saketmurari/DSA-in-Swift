   func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        
        var nums = nums.sorted(by: <)
        
      
        for i in 0...nums.count-1 {
            
            let otherPart = target - nums[i]
            print(otherPart,i)
            let otherPos = findPos(nums, otherPart, i+1, nums.count-1)
            
            if otherPos < nums.count && nums[otherPos] == otherPart {
                return [i+1, otherPos+1]
            }
        }
        return []
    }
    
    func findPos( _ nums:[Int], _ val:Int, _ left: Int, _ right: Int) -> Int {
        
        if left > right {
            return left
        }
        
        let pivot = left + (right-left)/2
        
        if nums[pivot] == val {
            return pivot
        }
        else if val > nums[pivot] {
            return findPos(nums, val, pivot+1, right)
        }
        else {
            return findPos(nums, val, left, pivot-1)
        }
    }
