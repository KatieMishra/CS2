/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import Foundation

let numberOfPlanets: Int = 8
let diamterOfEarth = 24859.82

print("There are \(numberOfPlanets) planets to explore.")
print("You are currently on earth which has a circumference of \(diamterOfEarth) miles.")

print("What is your name?")
let name = getln()
print("Nice to meet you, \(name)!")

print("Shall I choose a planet for you? (Y or N)")
let planetChoice = getln()
if planetChoice == "Y" {
    print("OK, traveling...")
} else {
    print("Name the planet")
}

