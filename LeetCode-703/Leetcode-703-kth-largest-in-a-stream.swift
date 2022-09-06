
class KthLargest {

    var item: [Int] = []
    var kth:Int = 0
    var pos:Int = 0
    init(_ k: Int, _ nums: [Int]) {
        
        item = nums
        kth = k
        item.sort(by: <)
    }
    
    func add(_ val: Int) -> Int {
        
        // If array is empty then simply add the element at 0th index and return the val
        if item.count == 0 {
            item.insert(val, at: 0)
            return val
        }
        
        setInsertionIndex(val, 0, item.count-1)
        
        /// when value is bigger than the index calculated, it will inserted at the next index.
        if item[pos] < val {
            pos += 1
        }
        item.insert(val, at: pos)
        
        return item[item.count-kth]
    }
    
    func setInsertionIndex ( _ number: Int, _ left:Int, _ right: Int) {
        
        var pivot = (left+right)/2
        
        if left > right || left == right {
            pos = left
            return
        }
                
        if item[pivot] > number {
            setInsertionIndex(number, left, pivot - 1)
        }
        else {
            setInsertionIndex(number, pivot + 1, right)
        }
        
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
