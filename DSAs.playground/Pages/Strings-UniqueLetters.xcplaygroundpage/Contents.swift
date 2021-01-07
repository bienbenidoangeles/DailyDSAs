import Foundation

// Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
func challenge1(input: String) -> Bool {
    let lowerCasedInput = input.lowercased()
    
    var uniqueInput = Set(lowerCasedInput)
    for char in lowerCasedInput {
        if uniqueInput.contains(char) {
            uniqueInput.remove(char)
        }
    }
    if uniqueInput.isEmpty {
        return true
    } else {
        return false
    }
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")
