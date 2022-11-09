import Foundation
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

//class Equal: Equatable {
//    static func == (lhs: Equal, rhs: Equal) -> Bool {
//        return lhs.a == rhs.a
//    }
//
//    var a: Int
//
//    init(a: Int) {
//        self.a = a
//    }
//}
//
//let someA = Equal(a: 1)
//let someB = Equal(a: 1)
//
//if someA == someB {
//    print("Equatable")
//}
//
//protocol Cryable {
//    var cry: String { get }
//    func 울음뚝()
//}
//
//class Lion: Cryable {
//    var cry = "어흥"
//}
//
//class Horse: Cryable {
//    var cry = "히잉"
//}
//
//class Chicken: Cryable {
//    var cry = "꼬끼오"
//}
//
//let lion = Lion()
//let horse = Horse()
//let chicken = Chicken()
//
//let array: [Cryable] = [lion, horse, chicken]
//
//for animal in array {
//    print(animal.cry)
//}
//
//protocol TwiceCryable: Cryable {
//    var cryTwoTime: String { get }
//}
//
//class Monkey: TwiceCryable {
//    var cry: String = "우끼끼"
//    var cryTwoTime: String = "우끼끼우끼끼"
//}
//
//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}
//
//let birthdayPerson = Person(name: "Hamo", age: 123)
//wishHappyBirthday(to: birthdayPerson)
//
//class Location {
//    var latitude: Double
//    var longitude: Double
//    init(latitude: Double, longitude: Double) {
//        self.latitude = latitude
//        self.longitude = longitude
//    }
//}
//class City: Location, Named {
//    var name: String
//    init(name: String, latitude: Double, longitude: Double) {
//        self.name = name
//        super.init(latitude: latitude, longitude: longitude)
//    }
//}
//func beginConcert(in location: Location & Named) {
//    print("Hello, \(location.name)!")
//}
//
//let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
//beginConcert(in: seattle)
//// Prints "Hello, Seattle!"
//
//import Foundation
//
//@objc protocol CounterDataSource {
//    @objc optional func increment(forCount count: Int) -> Int
//    @objc optional var fixedIncrement: Int { get }
//}
//
//class Counter {
//    var count = 0
//    var dataSource: CounterDataSource?
//    func increment() {
//        if let amount = dataSource?.increment?(forCount: count) {
//            count += amount
//        } else if let amount = dataSource?.fixedIncrement {
//            count += amount
//        }
//    }
//}
//
//extension Cryable {
//    func 울음뚝() {
//        print("뚝")
//    }
//}
//
//class Baby: Cryable {
//    var cry: String = "응애"
//}
//
//let bigBaby = Baby()
//print(bigBaby.cry)
//bigBaby.울음뚝()



//class SomeClass: SomeProtocol {
//    func instanceMethod() {
//        print("가능")
//    }
//
//    // class 키워드 가능
//    class func classTypeMethod() {
//        print("가능")
//    }
//
//    static func staticTypeMethod() {
//        print("가능")
//    }
//}


//protocol SomeProtocol {
//    func someMethod()
//}
//
//struct someStruct { }

//extension someStruct: SomeProtocol {
//    func someMethod() {
//        print("가능")
//    }
//}

//class SomeClass { }
//
//extension SomeClass {
//    func someMethod() {
//        print("가능")
//    }
//}
//
//protocol Where테스트프로토콜 {
//    func addAllElement() -> Int
//}
//
//protocol 다더하는프로토콜 { }
//
//extension Array: Where테스트프로토콜 where Element: 다더하는프로토콜 {
//    func addAllElement() -> Int {
//        var total: Int = 0
//        for i in 0..<self.count {
//            total += i
//        }
//
//        return total
//    }
//}
//
//extension Int: 다더하는프로토콜 { }
//
//let numbers: [Int] = [1, 2, 3, 4, 5, 6]
//print(numbers.addAllElement())
//
//let strings: [String] = ["a", "b", "c", "d"]

//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}

//class Person: Named, Aged {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

//func wishHappyBirthDat(to celebrator: Person & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}
//
//let birthdayPerson = Person(name: "Hamo", age: 345)
//wishHappyBirthDat(to: birthdayPerson)
// Happy birthday, Hamo, you're 345

//protocol Named {
//    var name: String { get }
//}
//
//class Aged {
//    var age: Int
//
//    init(age: Int) {
//        self.age = age
//    }
//}
//
//class Person: Aged, Named {
//    var name: String
//
//    init(name: String, age: Int) {
//        self.name = name
//        super.init(age: age)
//    }
//}
//
//func wishHappyBirthDat(to celebrator: Named & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}

//protocol SomeProtocol {
//    var a: Int { get set }
//    var b: String { get set }
//    init()
//}
//
//extension SomeProtocol {
//    init(a: Int, b: String) {
//        self.init()
//        self.a = a
//        self.b = b
//    }
//}
//
//class A: SomeProtocol {
//    var a: Int = 1
//    var b: String = ""
//    var name: String = ""
//
//    required init() { }
//
//    convenience init(a: Int, b: String, name: String) {
//        self.init(a: a, b: b)
//        self.name = name
//    }
//}

protocol SomeProtocol {
   var someNumber: Int { get }
}

class SomeClass: SomeProtocol {
    var someNumber: Int = 0
}

let someClass: SomeClass = SomeClass()

print(someClass.someNumber)

protocol SomeSomeProtocol {
    
}
