class Solution {
    func largestInteger(_ num: Int) -> Int {
     
        var oddArr:[Int] = []
        var evenArr:[Int] = []
        var input:[Int] = []
        var num = num
        
        while num > 0 {
            
            let digit = num%10
            
            if digit % 2 == 0 {
                evenArr.append(digit)
            }
            else {
                oddArr.append(digit)
            }
            input.insert(digit, at: 0)
            num = num/10
            
        }
        
        evenArr.sort(by: >)
        oddArr.sort(by: >)
        

        var result = ""

        for item in input {
            
            if item % 2 == 0 {
                result = result + "\(evenArr.removeFirst())"
            }
            else {
                result = result + "\(oddArr.removeFirst())"
            }
            
        }
        
        return Int(result)!
        
        
    }
}
