class Solution {
    func mostFrequentEven(_ nums: [Int]) -> Int {
        
        var map: [Int:Int] = [:]
        var freq = 0
        var value = 0
        
        for item in nums {
            if item % 2 == 0 {
                 map[item] =  map[item] == nil ? 1 : (map[item]!+1)
                
                 if (map[item]! > freq) || (map[item]! == freq && item < value) {
                     value = item
                     freq = map[item]!
                 }
            }
        }
        return freq == 0 ? -1 : value
    }
}
