/// Max heap implementation
class Solution {
    
    var map:[Int:String] = [:]
    
    func findRelativeRanks(_ score: [Int]) -> [String] {
        
        var score = score
        var refArray = score
        
        var len = 0
        var refCount = score.count
        
        var lastLeafIndex = refCount/2 - 1
        
        while lastLeafIndex >= 0 {
            heapify(&score, lastLeafIndex, score.count)
            lastLeafIndex -= 1
        }
       
        while len < refCount {
            
            let top = extractElementFromTop(&score)
            
            if len+1 == 1  {
                map[top] = "Gold Medal"
            }
            else if len+1  == 2 {
                map[top] = "Silver Medal"
            }
            else if len+1 == 3 {
                map[top] = "Bronze Medal"
            }
            else {
                 map[top] = "\(len+1)"
            }
             len += 1
        }
        
        
        var result:[String] = []
        
        for item in refArray {
            
            if let val = map[item] {
                result.append(val)
            }
            
        }
        return result
        
    }
    
     func heapify(_ score: inout [Int], _ i:Int, _ n: Int) {
            
            let left = 2*i+1
            let right = 2*i+2
            var largest = i
            
            
            if left < n && score[left] > score[largest] {
                largest = left
            }
            if right < n && score[right] > score[largest] {
                largest = right
            }
            
         if largest != i {
             
             score.swapAt(largest, i)
             heapify(&score, largest, n)
             
         }
    }
    
    func extractElementFromTop(_ score: inout [Int]) -> Int {
        
        if score.count != 1 {
        let first = score.removeFirst()
        let last = score.removeLast()
        
        score.insert(last, at: 0)
        heapify(&score, 0, score.count)
        
        return first
        }
        else {
            return score.removeFirst()
        }
       
    }
    
    
}
