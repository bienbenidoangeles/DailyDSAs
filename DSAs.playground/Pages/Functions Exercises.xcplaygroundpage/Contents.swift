//: [Previous](@previous)

import Foundation

//Question 1.
//Write a function named doubleNumber(_:) that takes in a Double and returns that number times two

//Your function here

func doubleNumber(_ num: Double) -> Double {
    return num * 2
}

// input: 99
// output: 198

// input: 3.0
// output: 6.0

//Question 2.
//Write a function named smallest(of:and:) that takes in two Doubles and returns the smaller number. Don't use the built-in max() function.

// input: 2.3, 2.03
// output: 2.03

// input: 8.0, 3.0
// output: 3.0
// Your function here

func smallest(of: Double, and: Double) -> Double {
    return of > and ? and : of
}

//Question 3.
//Write a function named smallestValue(in:) that takes in an array of Doubles and returns the smallest Double

// input: [1.0,2,3,4,5,5]
// output: 1.0

// input: [-4,-59,-348,-34,-4]
// output: -348

func smallestValue(in arr: [Double]) -> Double {
    
    guard var currentSmallestVal = arr.first else {
        return 0.0
    }
    
    for num in arr {
        if num < currentSmallestVal {
            currentSmallestVal = num
        }
    }
    return currentSmallestVal
}

let input:[Double] = [-4,-59,-348,-34,-4]
smallestValue(in: input)

//Question 4.
//Write a function named occurrences(of:in:) that counts how many Characters in a String match a specific character.

// input: "hello", "l"
// output: 2

// input: "Now with some spaces", " "
// output: 3

func occurrences(of char: Character, in str: String) -> Int {
    
    var occ = 0
    for letter in str where char == letter {
        occ += 1
    }
    return occ
}

occurrences(of: "l", in: "hello")

//Question 5.
//Write a function called removeNils(from:) that takes an array of optional Ints and returns an array with them unwrapped with any nil values removed.

// input: [1, nil, 9, nil, 10, nil]
// output: [1, 9, 10]

// input: [1, 2, 3]
// output: [1, 2, 3]

// input: [nil]
// output: []

// input: []
// output: []
// Your function here

func removeNils(from arr: [Int?]) -> [Int] {
    var arr1 = [Int]()
    for ele in arr where ele != nil {
        arr1.append(ele ?? 0)
    }
    return arr1
}

//Question 6.
//Write a function named average(of:) that returns the average of an array of Doubles.

// input: [1,2,3,4,5]
// output: 3

// input: [1.5, 2.25, 4.5, -1.5]
// output: 1.6875

func average(of arr: [Double]) -> Double {
    var count:Double = 0
    var sum:Double = 0
    for num in arr {
        count+=1
        sum+=num
    }
    return sum/count
}

average(of: [1.5, 2.25, 4.5, -1.5])

//Question 7.
//Write a function named frequencyDictionary(of:) that takes a String as input and returns a dictionary that maps each Character to its number of occurrances.

// input: "hello"
// output: ["h": 1, "e": 1, "l": 2, "o": 1]

// input: "aaaaaAAA"
// output: ["a": 5, "A":3]

// input: "More words"
// output: ["M": 1, "o": 2, "r": 2, "e": 1, " ": 1, "w": 1, "d": 1, "s": 1]

func frequencyDictionary(of str: String) -> [Character: Int] {
    var dict = [Character: Int]()
    for char in str {
        if let count = dict[char] {
            dict[char] = count + 1
        } else {
            dict[char] = 1
        }
    }
    return dict
}
let input1 = "aaaaaAAA"
frequencyDictionary(of: input1)

//Question 8.
//Write a function named value(_:isGreaterThanAverageOf:) that takes in an array of Doubles and a Double and returns whether the Double is greater than the average.

// input: 4.0, [1.0,2,3,4,5]
// output: true

// input: 3, [1,2,3,4,5]
// output: false

// input: 100.8, [1,42,1,541,42,5]
// output: false
// Your function here

func value(_ double: Double,isGreaterThanAverageOf arr: [Double]) -> Bool {
    return double > average(of: arr)
}

value(4.0, isGreaterThanAverageOf: [1.0,2,3,4,5])

//Question 9.
//Write a function that finds the second smallest Int an an array of Ints

// input: [1, 2, 3, 4]
// output: 2

// input: [2, 1, 3, 4]
// output: 2
// Your function here

func secondSmallestInt(_ arr: [Int]) -> Int {
    guard var smallestInt = arr.first else {
        return 0
    }
    var secondSmallestInt = Int.max
    
    var pair = (smallestInt,secondSmallestInt)
    
    for num in arr {
        print(pair, "be")
        if num < pair.0 {
            pair.1 = pair.0
            pair.0 = num
            print("t")
        } else if num < pair.1{
            pair.1 = num
            print("f")
        }
        print(pair, "af")
    }
    return pair.1
}

secondSmallestInt([4,3,2,1])



//Question 10.
//Write a program that outputs the string representation of numbers from 1 to n.

//But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

//LeetCode - 412. Fizz Buzz

// Example

/*
n = 15,

Return:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
*/

func fizzBuzz(_ n: Int){
    for num in 1...n{
        if (num % 3 == 0) && (num % 5 == 0){
            print("fizzbuzz")
        }
        else if num % 3 == 0 {
            print("fizz")
        } else if num % 5 == 0 {
            print("buzz")
        } else {
            print(num)
        }
    }
}

fizzBuzz(15)

//: [Next](@next)
