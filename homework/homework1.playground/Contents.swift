// Swift Assignment #1: Loops
// Owen Davis
// 9/9/25

import UIKit

// 1 - Multiples
var start: Int = 1
var end: Int = 50


print("THREE/FIVE from \(start) to \(end)")
for i in start...end {
    if i == 0 {
        print(i, terminator: "")
    }
    else if (i % 3 == 0) && (i % 5 == 0) {
        print("THREE and FIVE", terminator: "")
    }
    else if i % 3 == 0 {
        print("THREE", terminator: "")
    }
    else if i % 5 == 0 {
        print("FIVE", terminator: "")
    }
    else {
        print(i, terminator: "")
    }
    
    if i != end {
        print(", ", terminator: "")
    }
    else {
        print("\nDone.")
    }
}


print("-------------------------")

// 2 - Geometric pattern
var height: Int = 9
print("Printing Geometric pattern of length \(height)")
for i in 1...height {
    
    // Top and bottom
    if i == 1 || i == height {
        for j in 1...height {
            if j == 1 || j == height {
                print("+", terminator:"")
            }
            else {
                print("-", terminator:"")
            }
        }
    }
    
    // All other rows (other than center)
    else if height % 2 == 0 || (height % 2 == 1 && height != i){
        var x_spot1: Int = i
        var x_spot2: Int = height - i + 1
        for j in 1...height {
            if j == x_spot1 || j == x_spot2 {
                print("+", terminator:"")
            }
            else if j == 1 || j == height {
                print("|", terminator:"")
            }
            else {
                print(" ", terminator:"")
            }
        }
            
    }
    // Check for middle row
    else if height % 2 == 1 && height == i {
        for j in 1...height {
            if j == i {
                print("+", terminator:"")
            }
            else if j == 1 || j == height {
                print("|", terminator:"")
            }
            else {
                print(" ", terminator:"")
            }
        }
    }
    
    
    
    print("")
}



print("-------------------------")
// 3 - Prime check
var limit: Int = 100
for i in 2...limit {
    var isPrime: true
    
    for j in 1...i.squareRoot() {
        if i / j = 1 {
            isPrime = false
        }
    }
    if isPrime {
        print("\(i) ", terminator:"")
    }
}

print("Done.")





