import UIKit




// Categorizing Integers I
// This will take two parameters: a set of integers, and a second set of “trial” integers. It will then classify the integers in the second set by whether or not each is even multiple of all of the integers in the first set and return a named tuple containing two sets
func isMultiple(of testValues: Set<Int>, in numbers: Set<Int>) -> (yes: Set<Int>, no: Set<Int>) {
    var yesSet: Set<Int> = []
    var noSet: Set<Int> = []
    let testArr = Array(testValues)
    
    for num in numbers {
        var isMultipleOfAll = true
        for divisor in testArr {
            if divisor == 0 {
                if num == 0 {
                    continue
                }
                else {
                    isMultipleOfAll = false
                    break
                }
            }
            else if num % divisor != 0 {
                isMultipleOfAll = false
                break
            }
        }
        
        if isMultipleOfAll {
            yesSet.insert(num)
        }
        else {
            noSet.insert(num)
        }
    }
    return (yes: yesSet, no: noSet)
    //return (yes: Set([-42, 105, 0]), no: Set([-12, -7, 2, 3, 7, 19]))
    
}

print("Testing - Categorizing Integers I")
print(isMultiple(of: Set([3, 7]), in: Set([-12, -7, -42, 0, 2, 3, 7, 105, 19])))
print(isMultiple(of: Set([0, 5]), in: Set([0, 1, 3, 5, -5])))
print("-----------------------------------")

// Categorizing Integers II
