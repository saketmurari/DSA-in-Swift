class Solution {
    var map:[Int:String] = [:]
    var sortedArray:[Int] = []
    func findRelativeRanks(_ score: [Int]) -> [String] {
        
        sortedArray = score.sorted(by: >)
        
        var count = 0
        
        while count < score.count {
            
            if count + 1 == 1 {
                map[sortedArray[count]] = "Gold Medal"
            }
            else if count + 1 == 2 {
                map[sortedArray[count]] = "Silver Medal"
            }
            else if count + 1 == 3 {
                map[sortedArray[count]] = "Bronze Medal"
            }
            else {
                 map[sortedArray[count]] = "\(count+1)"
            }
            
            count += 1
        }
        var result:[String] = []
        
        for item in score {
            result.append(map[item]!)
        }
        
        return result
    }
}
