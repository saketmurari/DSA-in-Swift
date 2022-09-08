
class SmallestInfiniteSet {

    var input: [Int] = []
    init() {
        for i in 1...1001 {
            input.append(i)
        }
    }
    
    func popSmallest() -> Int {
        return input.removeFirst()
    }
    
    func addBack(_ num: Int) {
        let pos = findPos(num, 0, input.count-1)
        if pos.0 == false {
             input.insert(num, at: pos.1)
        }
    }
    
    
    func findPos( _ val: Int, _ left: Int, _ right:Int) -> (Bool, Int) {
        
        if left > right {
            return (false, left)
        }
        
        let pivot = (left+right)/2

        if input[pivot] == val {
            return (true, pivot)
        }
        else if input[pivot] > val {
            return findPos(val, left, pivot-1)
        }
        else {
            return findPos(val, pivot+1, right)
        }
        
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */
