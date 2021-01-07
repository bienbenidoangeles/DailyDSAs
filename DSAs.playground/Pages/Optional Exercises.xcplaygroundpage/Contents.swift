//: [Previous](@previous)

import Foundation

//Question 1

//a. Given the variable userNameOne below, print "The username is Test User". Use Optional Binding (if let) to print the name.

var userNameOne: String? = "Test User"

if let printUserName = userNameOne {
    print("The username is \(printUserName)")
}

//b. Given the variable userNameTwo below, print "The username is undefined". Use the nil coalescing operator (??).

var userNameTwo: String? = nil

print("\(userNameTwo ?? "The username is undefined")")

//Question 2

//a. Given the variables rectOneWidth and rectOneHeight below, print "The area of rectOne is 50". Use Optional Binding (if let) to print the area.

var rectOneWidth: Double? = 5
var rectOneHeight: Double? = 10

if let validRectOneWidth = rectOneWidth, let validRectOneHeight = rectOneHeight {
    print("The area of rectOne is",Int(validRectOneWidth * validRectOneHeight))
}


//b. Given the variables rectTwoWidth and rectTwoHeight below, print "The are of rectTwo is not able to be calculated". Use Optional Binding (if let) to print this message.

var rectTwoWidth: Double? = nil
var rectTwoHeight: Double? = nil

if let validRectTwoWidth = rectTwoWidth, let validRectTwoHeight = rectTwoHeight {
    print("The area of rectTwo is", validRectTwoWidth * validRectTwoHeight)
} else {
    print("The are of rectTwo is not able to be calculated")
}

//Question 3
//a. Given the variables userOneName, userOneAge, and userOneHeight below, write code that prints "Hello Anne! You are 15 years old and 5.8 feet tall" (1 foot = 12 inches). Use optional binding.

var userOneName: String? = "Anne"
var userOneAge: Int? = 15
var userOneHeight: Double? = 70

if let valUser1Name = userOneName, let valUser1Age = userOneAge, let valUser1Height = userOneHeight{
    print("Hello \(valUser1Name)! You are \(valUser1Age) years old and \(round(valUser1Height/12*10)/10) feet tall")
}

//b. Given the variables userTwoName, userTwoAge and userTwoHeight below, write code that prints "Hello user! You are 15 years old and I don't know how tall you are". Use optional binding

var userTwoName: String? = nil
var userTwoAge: Int? = 15
var userTwoHeight: Double? = nil

if let valUserTwoName = userTwoName, let valUserTwoAge = userTwoAge, let valUserTwoHeight = userTwoHeight {
    let roundedHeight = round(valUserTwoHeight/12*10)/10
    print("Hello \(valUserTwoName)! You are \(valUserTwoAge) years old and \(roundedHeight) feet tall")
} else {
    let roundedHeight = round(userTwoHeight ?? 0/12*10)/10
    let heightStatement = userTwoHeight == nil ? "I don't know how tall you are" : "\(roundedHeight) feet tall"
    print("Hello \(userTwoName ?? "user")! You are \(userTwoAge ?? 0) years old and \(heightStatement)")
}

//Question 4
//Given the variable favoriteNumber, write code that either prints "Your favorite number is " followed by the number, or "I don't know what your favorite number is"

//favoriteNumber is of type Int? and will either be nil or a random number between 0 and 10. It will change each time you run your Playground.

var favoriteNumber = Bool.random() ? Int.random(in: 0...10) : nil

let statement = favoriteNumber == nil ? "I don't know what your favorite number is" : "Your favorite number is \(favoriteNumber!)"
print(statement)

if let valFavoriteNumber = favoriteNumber {
    print("Your favorite number is \(valFavoriteNumber)")
} else {
    print("I don't know what your favorite number is")
}


//Question 5
//Given the variables numOne, numTwo and numThree, write code that prints "The sum of all the numbers is " followed by their sum. If a number is nil, don't add it to the sum. If all numbers are nil, the sum is zero.

var numOne = Bool.random() ? Int.random(in: 0...10) : nil
var numTwo = Bool.random() ? Int.random(in: 0...10) : nil
var numThree = Bool.random() ? Int.random(in: 0...10) : nil

print("The sum of all numbers is \((numOne ?? 0) + (numTwo ?? 0) + (numThree ?? 0))")

//Question 6
//a. Given the variable numbers below, write code that prints "The sum of all the numbers is " followed by their sum. If a number is nil, don't add it to the sum. If all numbers are nil, the sum is zero.

var numbers = [Int?]()

for _ in 0..<10 {
    numbers.append(Bool.random() ? Int.random(in: 0...100) : nil)
}

var sum = 0
for number in numbers where number != nil{
    sum += number!
}
print("The sum of all numbers is \(sum)")

//b. Using the same variable, find the average of all non-nil values.

var count = 0
for number in numbers where number != nil {
    count += 1
}

print("The average of all numbers is \(sum/count)")
