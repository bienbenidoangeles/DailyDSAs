//: [Previous](@previous)

import Foundation

//Question One
//a. Define an enumeration called iOSDeviceType with member values iPhone, iPad, appleWatch. Create a variable called myiPad and initialize it to .iPad.
//
//Solution
enum iOSDeviceType{
    case iPhone(String)
    case iPad(String)
    case appleWatch(String)
}

let myiPad: iOSDeviceType = .iPad("11")

//b. Adjust your code above so that iPhone and iPad have associated values of type String which represents the model number. Create an instance of a .iPhone("12") and assign it to a variable called myPhone
//
//Solution

let myPhone: iOSDeviceType = .iPhone("12")

//Question Two
//Write a function named getPosition(startingAt:afterSteps:) that takes an array of Steps, and a starting location of (Int, Int) and returns an (Int, Int) tuple representing the final position.
//
//A step .up will increase the y coordinate by 1. A step .down will decrease the y coordinate by 1. A step .right will increase the x coordinate by 1. A step .left will decrease the x coordinate by 1.
//
enum Step {
    case up
    case down
    case left
    case right
}
//
let startingLocation = (x: 0, y: 0)
let steps: [Step] = [.up, .up, .left, .down, .left]
//
//// expected output: (x: -2, y: 1)
//Solution

func getPosition(startingAt: (Int, Int), afterSteps: [Step]) -> (Int, Int) {
    var stepPos = startingAt
    for step in afterSteps {
        switch step {
        case .up:
            stepPos.1 += 1
        case .down:
            stepPos.1 -= 1
        case .left:
            stepPos.0 -= 1
        case .right:
            stepPos.0 += 1
        default:
            break
        }
    }
    
     return stepPos
}

getPosition(startingAt: startingLocation, afterSteps: steps)

//Question Three
//You are given a Coin enumeration which describes different coin values. Write a function called getTotalValue(from:) that takes in an array of tuples of type (number: Int, coin: Coin), and returns the total value of all coins in cents.
//
enum Coin: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

let coinArr: [(Int, Coin)] = [(10, .penny),
                              (15, .nickle),
                              (3, .quarter),
                              (20, .penny),
                              (3, .dime),
                              (7, .quarter)]
let total = getTotalValue(from: coinArr)
//
//// expected total: 385
//Solution

func getTotalValue(from bags: [(Int,Coin)]) -> Int {
    var total = 0
    for bag in bags {
        total += (bag.0 * bag.1.rawValue)
    }
    return total
}

//Question Four
//Write an enum called Day to represent the days of the week with a raw value of type String. Write a method inside Day that returns whether or not it is a weekday (Monday - Friday).
//
//// Sample expected outputs
//
enum Day: String{
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    func isWeekday() -> Bool {
        switch self {
        case .sunday, .saturday:
            return false
        default:
            return true
        }
    }
}

let day = Day.saturday
day.isWeekday() // false

let anotherDay = Day.wednesday
anotherDay.isWeekday() // true
//Solution

//Question Five
//Define an enumeration named HandShape with three members: .rock, .paper, .scissors. Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//
//Write a function called matchResult(fromPlayerOneShape:andPlayerTwoShape:) that takes two HandShapes and returns a MatchResult. It should return the outcome for the first player (the one with the first hand shape).
//
//Rock beats scissors, paper beats rock, scissor beats paper
//
let games: [(playerOne: HandShape, playerTwo: HandShape)] = [(.rock, .paper),
                                           (.paper, .paper),
                                           (.scissors, .rock),
                                           (.rock, .scissors)]
                                           
// expected output:
/*
 lose
 draw
 lose
 win
*/

//Solution

enum HandShape:Int {
    case rock = 0
    case paper = 1
    case scissors = 2
}

enum MatchResult{
    case win
    case draw
    case lose
}

func matchResult(fromPlayerOneShape: HandShape, andPlayerTwoShape: HandShape) -> MatchResult{
    
    if fromPlayerOneShape == andPlayerTwoShape {
        return .draw
    } else if fromPlayerOneShape.rawValue > andPlayerTwoShape.rawValue {
        if fromPlayerOneShape == .scissors && andPlayerTwoShape == .rock {
            return .lose
        }
        return .win
    } else if fromPlayerOneShape == .rock && andPlayerTwoShape == .scissors{
        return .win
    }
    return .lose
}

for game in games {
    print(matchResult(fromPlayerOneShape:game.0, andPlayerTwoShape:game.1))
}
