class Solution {
    func minimumCardPickup(_ cards: [Int]) -> Int {
        
     // map to track the index of previously found card
     //   card val is the key, and it's index is the value
        var map:[Int:Int] = [:]
        
        var ans = Int.max
        
        for i in 0...cards.count-1 {
            
            if let prev = map[cards[i]] {
                let difference = i - prev
                ans = min (ans, difference)
            }
            map[cards[i]] = i
        }
        
        return ans == Int.max ? -1: ans+1
        
    }
}
