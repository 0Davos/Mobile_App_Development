/*
 Owen Davis
 Mobile App Development
 Homework 2
 */

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
//This will apply the supplied function (or closure) to each value in the input set. Values for which the function (or closure) returns true will go into the yes set; and values for which the function or closure returns false will go into the no set.
func categorize(_ numbers: Set<Int>, using check: (Int) -> Bool) -> (yes: Set<Int>, no: Set<Int>) {
    var yesSet: Set<Int> = []
    var noSet: Set<Int> = []
    for num in numbers {
        if check(num) {
            yesSet.insert(num)
        }
        else {
            noSet.insert(num)
        }
    }
    return (yes: yesSet, no: noSet)
}


print("Testing - Categorizing Integers II")
print(categorize(Set([-5, 0, 1, 5, 6]), using: { i in i > 0}))
print("-----------------------------------")


// Categorizing Strings
//This function will take a set of words and sort them into two sets. Words that are a palindrome (without regard to case) will go into the first set; words that are not a palindrome will go into the second set. Ignore case when checking.

func checkForPalindromes(_ wordSet: Set<String>) -> (yes: Set<String>, no: Set<String>) {
    var yesSet: Set<String> = []
    var noSet: Set<String> = []
    for word in wordSet {
        var word = word.lowercased()
        var reversedWord = String(word.reversed())
        if reversedWord == word {
            yesSet.insert(word)
        }
        else {
            noSet.insert(word)
        }
    }
    
    return (yes: yesSet, no: noSet)
}


print("Testing - Categorizing Strings")
print(checkForPalindromes(Set(["morning", "maam", "Bananab", "tomato", "Aoxomoxoa"])))
print("-----------------------------------")



// Performing a Sequence of Checks
// This will take an array of functions (or closures) and apply each in sequence to the value passed to the function and put the result, a boolean, in an array that is returned.
func doChecks<T>(_ val: T, checks: [(T) -> Bool]) -> [Bool] {
    var returnArray: Set<Bool> = []
    for function in T.Type {
        if function(val) {
            
        }
    }
    
    return [true]
}

func isEven(num:Int) -> Bool {
    if num % 2 == 0 {
        return true
    }
    return false
}

func isPrime(num:Int) -> Bool{
    var sqrtNumDub: Double = Double(num).squareRoot()
    var sqrtNumInt: Int = Int(sqrtNumDub)
    
    
    for i in 2...Int(sqrtNumInt) {
        //var isPrime: Bool = true
        
        if i > 3 {
            if num % i == 0 {
                return false
            }
        }
    }
    return true
}
