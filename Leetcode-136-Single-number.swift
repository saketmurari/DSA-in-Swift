class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        //Xoring the nums pops the odd man out, because when you xor two similar number it becomes zero, zero + anything non zero is the answer
        
        var ans = 0
        for item in nums {
        
            ans ^= item
            
        }
        return ans
    }
    
    // This is normal way, where we sort the number and put two pointers and keep comparing to find the odd man out
//     func singleNumber(_ nums: [Int]) -> Int {
        
//         var nums = nums.sorted(by: <)
        
//         var counter = 0
        
//         var i = 0
//         var j = 1
        
//         while j <= nums.count-1{
//             if nums[i] == nums[j] {
//                 i += 2
//                 j += 2
//             }
//             else {
//                 break
//             }
//             counter += 1
//         }
//         return nums[i]
//     }    
}
