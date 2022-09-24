////
////  main.swift
////  22_Protocols
////
////  Created by Hamo on 2022/09/12.
////
//
//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//struct Person: FullyNamed {
//    var name: String = "hi"
//    var fullName: String {
//        get {
//            return name
//        }
//
//        set {
//            name += newValue
//        }
//    }
//}
//
//var hamo = Person()
//
//print(hamo.fullName)
//// Hamo Lee
//
//hamo.fullName = "hi"
//print(hamo.fullName)
//
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//
//class LinearCongruentialGenerator: RandomNumberGenerator {
//    var lastRandom = 42.0
//    let m = 139968.0
//    let a = 3877.0
//    let c = 29573.0
//    func random() -> Double {
//        lastRandom = ((lastRandom * a + c)
//            .truncatingRemainder(dividingBy:m))
//        return lastRandom / m
//    }
//}
//
//let generator = LinearCongruentialGenerator()
//print("Here's a random number: \(generator.random())")
//// Prints "Here's a random number: 0.3746499199817101"
//print("And another one: \(generator.random())")
//// Prints "And another one: 0.729023776863283"
//
//class Dice {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//    func roll() -> Int {
//        return Int(generator.random() * Double(sides)) + 1
//    }
//}
//
//
//var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("\(generator.random())")
//    print("Random dice roll is \(d6.roll())")
//}
//
//protocol TextRepresentable {
//    var textualDescription: String { get }
//}
//
//extension Dice: TextRepresentable {
//    var textualDescription: String {
//        return "A \(sides)-sided dice"
//    }
//}
//
//struct Hamster {
//    var name: String
//    var textualDescription: String {
//        return "A hamster named \(name)"
//    }
//}
//
//extension Hamster: TextRepresentable {}

//enum Equal {
//    case a
//    case b
//}

class Equal: Equatable {
    static func == (lhs: Equal, rhs: Equal) -> Bool {
        return lhs.a == rhs.a
    }
    
    var a: Int
    
    init(a: Int) {
        self.a = a
    }
}

let someA = Equal(a: 1)
let someB = Equal(a: 1)

if someA == someB {
    print("Equatable")
}

protocol Cryable {
    var cry: String { get }
    func 울음뚝()
}

class Lion: Cryable {
    var cry = "어흥"
}

class Horse: Cryable {
    var cry = "히잉"
}

class Chicken: Cryable {
    var cry = "꼬끼오"
}

let lion = Lion()
let horse = Horse()
let chicken = Chicken()

let array: [Cryable] = [lion, horse, chicken]

for animal in array {
    print(animal.cry)
}

protocol TwiceCryable: Cryable {
    var cryTwoTime: String { get }
}

class Monkey: TwiceCryable {
    var cry: String = "우끼끼"
    var cryTwoTime: String = "우끼끼우끼끼"
}

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
}

let birthdayPerson = Person(name: "Hamo", age: 123)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}
func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)
// Prints "Hello, Seattle!"

import Foundation

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

extension Cryable {
    func 울음뚝() {
        print("뚝")
    }
}

class Baby: Cryable {
    var cry: String = "응애"
}

let bigBaby = Baby()
print(bigBaby.cry)
bigBaby.울음뚝()
