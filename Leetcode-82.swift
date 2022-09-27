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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var head = head
        var result:ListNode? = ListNode()
        var final = result
        
        while head != nil {
            
            if head?.val == head?.next?.val {
                 while head?.val == head?.next?.val {
                     head = head?.next
                 }
                 head = head?.next
            }
            else {
                result?.next = head
                result = result?.next
                head = head?.next
            }
           
            
        }
        result?.next = nil
        return final?.next
        
    }
}
