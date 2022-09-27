class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        /// count zero means, all keys has values zero, count will increase by 1 for every key that has at least 1 or above value
        var plen = p.count
        var slen = s.count
        var input = Array(s)
        
        var pmap:[Character:Int] = [:]
        
        for item in p {
            pmap[item] = pmap[item] == nil ? 1 : pmap[item]echo /bin/zsh
            
        }
        
        var left = 0
        var right = 0
        var count = pmap.count
        
        var output:[Int] = []
        
        while right < slen {
            
            if pmap[input[right]] != nil {
                
                pmap[input[right]] =  pmap[input[right]]! - 1 
                if pmap[input[right]]! == 0 {
                    count -= 1
                }
            }
            if (right - left + 1) == plen {
                
                 if count == 0 {
                     output.append(left)
                 }
                
                if pmap[input[left]] != nil {
                    if pmap[input[left]] == 0 {
                        count += 1
                    }
                    pmap[input[left]] = pmap[input[left]]! + 1
                }
                 left += 1
               
             }
              right += 1
        }
        return output
    }
}