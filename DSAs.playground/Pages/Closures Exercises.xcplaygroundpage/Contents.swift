//: [Previous](@previous)

import Foundation

//Question One
//Write a function named applyKTimes that takes an integer K and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.

// input: applyKTimes(5)
// output: 5
// Your function here

func applyKTimes(_ intK: Int, closure: () -> ()) {
    for _ in 1...intK {
        closure()
    }
}

var myVal = 0
applyKTimes(5) {
  myVal += 1
}

print(myVal) // 5

//Question Two
//Write a function called multiples(of:in) that takes in an array of Ints and returns all of the Ints that are a multiple of a given number n. Use filter in your function.

// input: [1, 2, 3, 4, 6, 8, 9, 3, 12, 11], n = 3
// output: [3, 6, 9, 3, 12]
// Your function here

func multiples(of num: Int, in arr: [Int]) -> [Int] {
    arr.filter{$0 % num == 0}
}

let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]

print(multiples(of: 3, in: numbers))

//Question Three
//Write a function called largestValue(in:) that finds the largest Int in an array of Ints. Use reduce to solve this exercise.

// input: [4, 7, 1, 9, 6, 5, 6, 9]
// output: 9
// Your function here

func largestValue(in arr: [Int]) -> Int{
    let result = arr.reduce(Int.min) { value1, value2 in
        if value1 > value2 {
            return value1
        } else {
            return value2
        }
    }
    return result
}

let moreNumbers = [4, 7, 1, 9, 6, 5, 6, 9]
largestValue(in: moreNumbers)

//Question Four
//Write a function called sortedNamesByLastName(in:) that takes in an array of tuples of type (String, String) and returns an array of tuples sorted ascending by last name.

// input:
//let firstAndLastTuples = [
//    ("Johann S.", "Bach"),
//    ("Claudio", "Monteverdi"),
//    ("Duke", "Ellington"),
//    ("W. A.", "Mozart"),
//    ("Nicolai","Rimsky-Korsakov"),
//    ("Scott","Joplin"),
//    ("Josquin","Des Prez")
//]

// output:
/*
 (firstName: "Johann S.", lastName: "Bach")
 (firstName: "Josquin", lastName: "Des Prez")
 (firstName: "Duke", lastName: "Ellington")
 (firstName: "Scott", lastName: "Joplin")
 (firstName: "Claudio", lastName: "Monteverdi")
 (firstName: "W. A.", lastName: "Mozart")
 (firstName: "Nicolai", lastName: "Rimsky-Korsakov")
*/
// Your function here

func sortedNamesByLastName(in arr: [(firstName:String, lastName:String)]) -> [(firstName:String, lastName:String)] {
    return arr.sorted{$0.lastName < $1.lastName}
}

let firstAndLastTuples = [
    ("Johann S.", "Bach"),
    ("Claudio", "Monteverdi"),
    ("Duke", "Ellington"),
    ("W. A.", "Mozart"),
    ("Nicolai","Rimsky-Korsakov"),
    ("Scott","Joplin"),
    ("Josquin","Des Prez")
]

print(sortedNamesByLastName(in: firstAndLastTuples))

//Question Five
//Write a function called sumOfSquaresOfOddNumbers(in:) that returns the sum of the squares of all the odd numbers from an array of Ints. Use filter, map and reduce in your function.

// input: [1, 2, 3, 4, 5, 6]

// output: 35
// Your function here

let evenMoreNumbers = [1, 2, 3, 4, 5, 6]

func sumOfSquaresOfOddNumbers(in arr: [Int]) -> Int {
    let oddNum = arr.filter{$0 % 2 != 0}
    let squared = oddNum.map{$0 * $0}
    let sum = squared.reduce(0,+)
    print(oddNum, squared, sum)
    return sum
}

print(sumOfSquaresOfOddNumbers(in: evenMoreNumbers))


//Quesiton 6
//Rewrite the built-in implementation of the map function.
//Review: map takes in an array of elements and performs a transformation on each element and returns a resulting array.
//
//Make it generic so it can works with any type.

// input: [1, 2, 3, 4] , square each element

// output: [1, 4, 9, 16]
// input: ["ALEX", "KIM", "SAM", "TOM", "RACHEL"], lowercase each String

// output: ["alex", "kim", "sam", "tom", "rachel"]

func newMap<T>(_ arr: [T], closure: (T) -> (T)) -> [T] {
    var newArray = [T]()
    for element in arr {
        newArray.append(closure(element))
    }
    return newArray
}

let x = newMap([1,2,3,4]) {$0 * $0}
print(x)
