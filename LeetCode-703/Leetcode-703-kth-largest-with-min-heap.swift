class KthLargest {
    
    var kthIndex: Int = 0
    var inputStream: [Int] = []

    init(_ k: Int, _ nums: [Int]) {
        kthIndex = k
        inputStream = nums
        heapifyInput()
        
        while inputStream.count > k {
            removeFromTop()
        }
    }
    
    func removeFromTop() {
        
        inputStream[0] = inputStream[inputStream.count-1]
        inputStream.removeLast()
        heapify(&inputStream, 0)
        
    }
    
    func heapifyInput() {
        
        var lastLeafIndex = (inputStream.count/2) - 1
        var counter = lastLeafIndex
        while counter >= 0 {
            heapify(&inputStream, counter)
            counter -= 1
        }
    }
    
    
    func heapifyUp(_ index: Int) {
        let parent = (index-1)/2
        guard parent >= 0 else { return }
        
        if inputStream[index] < inputStream[parent] {
            inputStream.swapAt(index, parent)
            heapifyUp(parent)
        }
    }
    
    func add(_ val: Int) -> Int {
        
        inputStream.append(val)
        heapifyUp(inputStream.count-1)
        
        if inputStream.count > kthIndex {
            removeFromTop()
        }
        return inputStream[0]
        
    }
    
    func heapify( _ inputStream: inout [Int], _ index: Int) {
        
        let left = 2*index+1
        let right = 2*index+2
        var smallestIndex = index
        
        if left < inputStream.count {
            if inputStream[left] < inputStream[smallestIndex] {
                smallestIndex = left
            }
        }
         if right < inputStream.count {
            if inputStream[right] < inputStream[smallestIndex] {
                smallestIndex = right
            }
        }
        
        if smallestIndex != index {
            inputStream.swapAt(index, smallestIndex)
            heapify(&inputStream, smallestIndex)
        }
    }
}
