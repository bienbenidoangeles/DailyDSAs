//: [Previous](@previous)

import Foundation

//Question 1
//Take a look at this struct that represents an alien:

struct Alien {
 var name: String
 var height: Double
 var homePlanet: String
}
var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")
//Will these three lines of code run? If so, why not?

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"
//Solution

// - No, as the instance of bilbo is immutable

//Change the declaration of bilbo so that the above three lines of code do work:
//
//Solution

// var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

//Question 2
//Given this bit of code that uses the Alien struct:

var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"

//What will the value of charles.homePlanet be after the above code run? What about the value of charlesFromJupiter.homePlanet? Why?
//
//Solution

// - The value will be "Jupiter" as charlesFromJupiter is a seperate value instance from charles

//Question 3
//Here's a struct that represents a bank account:

struct BankAccount {
  var owner: String
  var balance: Double
  
  mutating func deposit(_ amount: Double) {
    balance += amount
  }
  
  mutating func withdraw(_ amount: Double) {
    balance -= amount
  }
}

//Does this code work? Why or why not?
//Solution
// - No, as both functions change the value of balance outside of the functions scope in the same instance
//Fix the BankAccount struct so it does work.

//
//Solution
//mutating func deposit(_ amount: Double) {
//  balance += amount
//}
//
//mutating func withdraw(_ amount: Double) {
//  balance -= amount
//}
//Given the code below (which should incorporate any fixes you made):

var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
//What will the value of joeAccount.balance be after the above code runs? What about the value of joeOtherAccount.balance? Why?
//
//Solution

// - joeAccount balance - 50, joeOtherAcc balance - 100, since both acc. are seperate value instances and the withdraw func was only called on the joeAccount instance

//Question 4
//a. Write a struct called Person that has 3 properties of type String: a first name, a last name and a middle name. Have the middle name be optional. Create 2 instances of a Person, one with a middle name and one without. Print one of their first names.
//

struct Person{
    let firstName: String
    let lastName: String
    let middleName: String?
    
    var fullName: String{
        return firstName + " " + lastName
    }
}

let person1 = Person(firstName: "Ben", lastName: "Ken", middleName: nil)
let person2 = Person(firstName: "Jen", lastName: "Men", middleName: "Len")

print(person1.firstName)


//Solution
//b. Write a computed property in Person called fullName that will return a formatted string of an instance's full name. Call this property on both the instances you created in part a.
//
//Solution

person1.fullName
person2.fullName

//Question 5
//a. Create a struct called Book that has properties title, author and rating, of type String, String, and Double respectively. Create some instances of Book.
//

//Solution

struct Book {
    let title,author: String
    let rating: Double
    var isGood: Bool {
        return rating > 7
    }
}

let book1 = Book(title: "BB", author: "Ben", rating: 5.0)
let book2 = Book(title: "JJ", author: "HH", rating: 4.0)

//b. Add a computed property to Book called isGood that returns true if its rating is greater than or equal to 7 and test this new functionality with one of the created instances above.
//
//Solution
book1.isGood

//Question 6
//There are three common scales that are used to measure temperature: Celsius, Fahrenheit, and Kelvin:
//
//C = (F - 32) / 1.8 F = 1.8 * C + 32 K = C + 273
//
//a. Make a struct called FreezingPoint that has three static properties: celsius, fahrenheit, and kelvin. Give them all values equal to the freezing point of water.
//
//Solution

struct FreezingPoint{
    static var celsius: Double = 0
    static let fahrenheit: Double = 1.8 * celsius + 32
    static let kelvin: Double = celsius + 273
}

//b. Make a struct called Celsius that has one property: celsius, and two methods getFahrenheitTemp, and getKelvinTemp. Make the values of fahrenheit and kelvin correct values, converted from the celsius property.

var tenDegreesCelsius = Celsius(celsius: 10.0)
tenDegreesCelsius.celsius //returns 10.0
tenDegreesCelsius.getKelvinTemp() //returns 283.0
tenDegreesCelsius.getFahrenheitTemp() //returns 50.0
//Solution

struct Celsius {
    let celsius: Double
    
    var isBelowFreezing: Bool {
        return celsius < 0
    }
    
    func getKelvinTemp() -> Double{
        return FreezingPoint.kelvin + celsius
    }
    
    func getFahrenheitTemp() -> Double {
        return 1.8 * celsius + 32
    }
}
//c. Give the Celsius struct a computed property called isBelowFreezing that returns a Bool (true if the temperature is below freezing) and test your new property on the tenDegreesCelsius instance.
//
//Solution

tenDegreesCelsius.isBelowFreezing

//Create a struct called RGBColor that has 3 properties, red, green, blue that are all of type Double.
//
//Given the below array of color dictionaries, create an array of RGBColor.

let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
 ["red": 0.0, "green": 1.0, "blue": 0.0],
 ["red": 0.0, "green": 0.0, "blue": 1.0],
 ["red": 0.6, "green": 0.9, "blue": 0.0],
 ["red": 0.2, "green": 0.2, "blue": 0.5],
 ["red": 0.5, "green": 0.1, "blue": 0.9],]
// Test cases


//Solution

struct RGBColor {
    let red, green, blue: Double
    
    static func createRGBArr(colorDictArr: [[String: Double]]) -> [RGBColor] {
        var tempColorArr = [RGBColor]()
        for ele in colorDictArr {
            if let red = ele["red"], let green = ele["green"], let blue = ele["blue"] {
                let color = RGBColor(red: red, green: green, blue: blue)
                tempColorArr.append(color)
            }
        }
        return tempColorArr
    }
}

let colors = RGBColor.createRGBArr(colorDictArr: colorDictArray)

print(colors.count) // 6

print(colors.first?.red ?? 0.0) // 1.0
print(colors.last?.blue ?? 0.0) // 0.9

//Question 8
//Create a struct called Movie that has properties for name (String), year (Int), genre (String), cast ([String]), and description (String) which is a property of the CustomStringConvertible protocol. Create an instance of your Movie class.

// Sample Input:
let theBanker = Movie(name: "The Banker", year: 2020, genre: "Drama", cast: ["Anthony Markie", "Samuel L. Jackson", "Nicholas Hoult", "Nia Long"])

// Output:
print(theBanker)
//The Banker is a Drama released in 2020 with the following cast members: Anthony Markie, Samuel L. Jackson, Nicholas Hoult and Nia Long
//Solution

struct Movie: CustomStringConvertible{
    let name: String
    let year: Int
    let genre: String
    let cast: [String]
    var description: String {
        return "\(name) is a \(genre) released in \(year) with the following cast members"
    }
}

//Question 9
//Create a function outside of your Movie struct called makeMovie that takes in a dictionary of type [String: Any], like dieHardDict below, and returns an optional Movie. Use dieHardDict to create an instance of a Movie.

let dieHardDict: [String: Any] = ["name": "Die Hard",
 "year" : 1987,
 "genre": "action",
 "cast": ["Bruce Willis", "Alan Rickman"],
 "description": "John Mclain saves the day!"]
// Input 1:
makeMovie(dict: dieHardDict)

// Output:
// Die Hard is a action released in 1987 with the following cast members: Bruce Willis and Alan Rickman.

// Input 2:
makeMovie(dict: [:])

// Output:
// Movie was not able to be created.
//Solution

func makeMovie(dict: [String: Any]) -> Movie?{
    guard let name = dict["name"] as? String, let year = dict["year"] as? Int, let genre = dict["genre"] as? String, let cast = dict["cast"] as? [String] else {
        return nil
    }
    
    return Movie(name: name, year: year, genre: genre, cast: cast)
}

if let movie = makeMovie(dict: dieHardDict) {
    print(movie)
} else {
    print("Movie was not able to be created.")
}

//Question 10
//Given the below array of movie dictionaries, use your function from the last question to create a Array of Movie 's.

// movies is an Array of Dictionaries
// each element of movies is a Dictionary with the keys
// 'name','year', 'genre', 'cast' and 'description'
var moviesArray: [[String:Any]] = [
 [
 "name": "Minions",
 "year": 2015,
 "genre": "animation",
 "cast": ["Sandra Bullock", "Jon Hamm", "Michael Keaton"],
 "description": "Evolving from single-celled yellow organisms at the dawn of time, Minions live to serve, but find themselves working for a continual series of unsuccessful masters, from T. Rex to Napoleon. Without a master to grovel for, the Minions fall into a deep depression. But one minion, Kevin, has a plan."
 ],
 [
 "name": "Shrek",
 "year": 2001,
 "genre": "animation",
 "cast": ["Mike Myers", "Eddie Murphy", "Cameron Diaz"],
 "description": "Once upon a time, in a far away swamp, there lived an ogre named Shrek whose precious solitude is suddenly shattered by an invasion of annoying fairy tale characters. They were all banished from their kingdom by the evil Lord Farquaad. Determined to save their home -- not to mention his -- Shrek cuts a deal with Farquaad and sets out to rescue Princess Fiona to be Farquaad\"s bride. Rescuing the Princess may be small compared to her deep, dark secret."
 ],
 [
 "name": "Zootopia",
 "year": 2016,
 "genre": "animation",
 "cast": ["Ginnifer Goodwin", "Jason Bateman", "Idris Elba"],
 "description": "From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law."
 ],
 [
 "name": "Avatar",
 "year": 2009,
 "genre": "action",
 "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver"],
 "description": "On the lush alien world of Pandora live the Na\"vi, beings who appear primitive but are highly evolved. Because the planet\"s environment is poisonous, human/Na\"vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na\"vi woman. As a bond with her grows, he is drawn into a battle for the survival of her world."
 ],
 [
 "name": "The Dark Knight",
 "year": 2008,
 "genre": "action",
 "cast": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
 "description": "With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism."
 ],
 [
 "name": "Transformers",
 "year": 2007,
 "genre": "action",
 "cast": ["Shia LaBeouf", "Megan Fox", "Josh Duhamel"],
 "description": "The fate of humanity is at stake when two races of robots, the good Autobots and the villainous Decepticons, bring their war to Earth. The robots have the ability to change into different mechanical objects as they seek the key to ultimate power. Only a human youth, Sam Witwicky can save the world from total destruction."
 ],
 [
 "name": "Titanic",
 "year": 1997,
 "genre": "drama",
 "cast": ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"],
 "description": "The ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912."
 ],
 [
 "name": "The Hunger Games",
 "year": 2012,
 "genre": "drama",
 "cast": ["Jennifer Lawrence", "Josh Hutcherson", "Liam Hemsworth"],
 "description": "Katniss Everdeen voluntarily takes her younger sister\"s place in the Hunger Games, a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death."
 ],
 [
 "name": "American Sniper",
 "year": 2014,
 "genre": "drama",
 "cast": ["Bradley Cooper", "Sienna Miller", "Kyle Gallner"],
 "description": "Navy S.E.A.L. sniper Chris Kyle\"s pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home to his wife and kids after four tours of duty, however, Chris finds that it is the war he can\"t leave behind."
 ]
]

//Solution

let movies = moviesArray.compactMap{makeMovie(dict: $0)}
// Test cases:

print(movies.count) // 9

print(movies.first?.name ?? "") // Minions
print(movies.last?.name ?? "") // American Sniper

//Question 11
//Using the Room struct below, write code that demonstrates that it is a value type.

struct Room {
  var maxOccupancy: Int
  var length: Double
  var width: Double
}

var room1 = Room(maxOccupancy: 0, length: 0, width: 0)
let room2 = room1
room1.length = 1
print(room2.length)

//Question 12
//a. Given the Point object below, complete the distance method so that it returns the distance between a given point.
//
//The equation for the distance formula can be found here and is give by:

//let horizontalDistance = pointOneXValue - pointTwoXValue
//let verticalDistance = pointOneYValue - pointTwoYValue
//let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
//sqrt is a method in Swift that gives the square root. import Foundation to use this method.

struct Point {
  let x: Double
  let y: Double
  func distance(to point: Point) -> Double {
    //Code in your answer here
    let horizontalDistance = x - point.x
    let verticalDistance = y - point.y
    let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
    return distanceBetweenTwoPoints
  }
}

//let pointOne = Point(x: 0, y: 0)
//let pointTwo = Point(x: 10, y: 10)
//
//print(pointOne.distance(to: pointTwo)) //Prints 14.142135623730951
//Solution



//b. Given the above Point object above, and Circle object below, add a contains method that returns whether or not a given point is on the circle

struct Circle {
  let radius: Double
  let center: Point
    
    func contains(_ point: Point) -> Bool {
        let distance = center.distance(to: point)
        return distance <= radius
    }
    
    func getRandomPoint()-> Point{
        let randomX = Double.random(in: -radius...radius)
        let y = sqrt((radius*radius)-(randomX*randomX))
        return Point(x: randomX, y: y)
    }
}

let pointOne = Point(x: 0, y: 0)
let circleOne = Circle(radius: 5, center: pointOne)
let pointTwo = Point(x: 5, y: 0)
let pointThree = Point(x: 4, y: 0)
let pointFour = Point(x: sqrt(12.5), y: sqrt(12.5))
circleOne.contains(pointTwo) //true
circleOne.contains(pointThree) // false
circleOne.contains(pointFour) //true
//Solution
//c. Add another method to Circle that returns a random point on the circle
//
//Hint: Given the radius of a circle and the x value of a point on the circle, the y value of the point is defined by:
//
//√(r^2) - (x^2)
circleOne.contains(circleOne.getRandomPoint()) // should always be true
//Solution
