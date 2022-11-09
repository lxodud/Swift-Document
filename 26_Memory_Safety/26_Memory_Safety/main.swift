//
//  main.swift
//  26_Memory_Safety
//
//  Created by Hamo on 2022/06/20.
//

//// A write access to the memory where one is stored.
//var one = 1
//
//// A read access from the memory where one is stored.
//print("We're number \(one)!")
//
//
//func oneMore(than number: Int) -> Int {
//    return number + 1
//}
//
//var myNumber = 1
//myNumber = oneMore(than: myNumber)
//print(myNumber)

//var stepSize = 1
//
//func increment(_ number: inout Int) {
//    number += stepSize
//}

//increment(&stepSize)
//// Error: conflicting accesses to stepSize

//// Make an explicit copy.
//var copyOfStepSize = stepSize
//increment(&copyOfStepSize)
//
//// Update the original.
//stepSize = copyOfStepSize
//// stepSize is now 2

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
//var playerOneScore = 42
//var playerTwoScore = 30
//balance(&playerOneScore, &playerTwoScore)  // OK
//balance(&playerOneScore, &playerOneScore)
//// Error: conflicting accesses to playerOneScore

struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}


//var playerInformation = (health: 10, energy: 20)
//balance(&playerInformation.health, &playerInformation.energy)
//// Error: conflicting access to properties of playerInformation

//var holly = Player(name: "Holly", health: 10, energy: 10)
//balance(&holly.health, &holly.energy)  // Error

func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)  // OK
}
