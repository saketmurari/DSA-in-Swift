class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        
        var input = Array(s2)
        var pat = Array(s1)
        
        var map = [Character:Int]()
        
        for (i,item) in pat.enumerated() {
            map[item] = map[item] == nil ? 1 : (map[item]!+1)
        }
        var count = map.count
        
        var left = 0
        
        for right in 0...input.count-1 {
            if map[input[right]] != nil {
                map[input[right]] =  map[input[right]]!-1
                
                if map[input[right]] == 0 {
                    count -= 1
                }
            }
            
            if right-left+1 == pat.count{
                
                if count == 0 {
                    return true
                }
                
                if map[input[left]] != nil {
                    if map[input[left]] == 0 {
                       count += 1
                    }
                    map[input[left]] =  map[input[left]]!+1 
                }
                left += 1
            }
            
        }
        
        return false
        
    }
}
