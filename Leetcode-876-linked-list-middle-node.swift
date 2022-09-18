/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        guard let head = head else {
            return head
        }
        
        var slow:ListNode? = head
        var fast:ListNode? = head 
       
        
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        
        return slow
    }
    
    // Natural intuition approach
    
//     func middleNode(_ head: ListNode?) -> ListNode? {
        
//         guard let head = head else {
//             return head
//         }
        
//         var ptr1:ListNode? = head
//         var ptr2:ListNode? = head 
//         var count = 1
        
//         while ptr2?.next != nil {
//             count += 1
//             ptr2 = ptr2?.next
//         }
        
//         var mid = count/2
        
//         while mid > 0 {
//             ptr1 = ptr1?.next
//             mid -= 1
//         }
        
//         return ptr1
//     }
}
