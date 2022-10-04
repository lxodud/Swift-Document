//
//  main.swift
//  14_Initalization
//
//  Created by TaeLee on 2022/08/30.
//

import Darwin
import CoreGraphics

// MARK: Setting Initial Values for Stored Properties
//struct Fahrenheit {
//    var temperature: Double
//    init() {
//        temperature = 32.0
//    }
//}
//
//var f = Fahrenheit()
//print("기본 온도: \(f.temperature)")
//// 기본 온도: 32.0
//
//// MARK: Initialization Parameters
//struct Celsius {
//    var temperatureInCelsius: Double
//
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//
//let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
//// boilingPointOfWater.temperatureInCelsius == 100.0
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)
//// freezingPointOfWater.temperatureInCelsius == 0.0
//
//// MARK: Parameter Names and Argument Labels
//struct Color {
//    let red: Double
//    let green: Double
//    let blue: Double
//
//    init(red: Double, green: Double, blue: Double) {
//        self.red = red
//        self.green = green
//        self.blue = blue
//    }
//
//    init(white: Double) {
//        red = white
//        green = white
//        blue = white
//    }
//}
//
//let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
//let halfGray = Color(white: 0.5)
//
//// MARK: Initializer Parameters Without Argument Labels
//extension Celsius {
//    init(_ celsius: Double) {
//        temperatureInCelsius = celsius
//    }
//}
//
//let bodyTemperature = Celsius(37.0)
//print(bodyTemperature)
//
//// MARK: Default Initializers
//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//
//var item = ShoppingListItem()
//
//// MARK: Memberwise Initializers for Structure Types
//struct Size {
//    var width = 0.0
//    var height = 0.0
//}
////let twoByTwo = Size(width: 2.0, height: 2.0)
////let zeroByTwo = Size(height: 2.0)
////let zeroByZero = Size()
//
//struct Point {
//    var x = 0.0
//    var y = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//
//    init() {}
//
//    init(origin: Point, size: Size) {
//        self.origin = origin
//        self.size = size
//    }
//
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//
//let basicRect = Rect()
//
//let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//
//class Vehicle {
//    var numberOfWheels = 0
//    var description: String {
//        return "\(numberOfWheels) wheel(s)"
//    }
//}
//
//class Bicycle: Vehicle {
//    override init() {
//        super.init()
//        numberOfWheels = 2
//    }
//}
//
//let bicycle = Bicycle()
//print(bicycle.description)
//
//class Hoverboard: Vehicle {
//    var color: String
//
//    init(color: String) {
//        self.color = color
//        // super.init()이 암시적으로 호출된다.
//    }
//
//    override var description: String {
//        return "\(super.description) in a beautiful \(color)"
//    }
//}
//
//let hoverboard = Hoverboard(color: "silver")
//print("Hoverboard: \(hoverboard.description)")
//// Hoverboard: 0 wheel(s) in a beautiful silver

//class Food {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    convenience init() {
//        self.init(name: "[Unnamed]")
//    }
//}
//
//let mysteryMeat = Food()
//let namedMeet = Food(name: "Bacon")
//
//class RecipeIngredient: Food {
//    var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}
//
//let oneMysteryItem = RecipeIngredient()
//
//print(oneMysteryItem.name)
//
//let wholeNumber: Double = 12345.0
//let pi = 3.14159
//
//if let valueMaintained = Int(exactly: wholeNumber) {
//    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
//}
//// Prints "12345.0 conversion to Int maintains value of 12345"
//
//let valueChanged = Int(exactly: pi)
//// valueChanged is of type Int?, not Int
//
//if valueChanged == nil {
//    print("\(pi) conversion to Int does not maintain value")
//}
//// Prints "3.14159 conversion to Int does not maintain value"
//
//struct Animal {
//    let species: String
//
//    init?(species: String) {
//        if species.isEmpty {
//            return nil
//        }
//
//        self.species = species
//    }
//}
//
//let someAnimal1 = Animal(species: "monkey")
//
//if let monkey = someAnimal1 {
//    print("원숭이")
//} else {
//    print("nil")
//}
//// 원숭이
//
//let someAnimal2 = Animal(species: "")
//
//if let rabbit = someAnimal2 {
//    print("토끼")
//} else {
//    print("nil")
//}
//// nil
//
////enum TemperatureUnit {
////    case kelvin, celsius, fahrenheit
////    init?(symbol: Character) {
////        switch symbol {
////        case "K":
////            self = .kelvin
////        case "C":
////            self = .celsius
////        case "F":
////            self = .fahrenheit
////        default:
////            return nil
////        }
////    }
////}
////
////let fahrenheit = TemperatureUnit(symbol: "F")
////
////if fahrenheit != nil {
////    print("fahrenheit")
////}
////
////let unknown = TemperatureUnit("x")
////
////if unknown == nil {
////    print("nil")
////}
//
//enum TemperatureUnit: Character {
//    case kelvin = "K", celsius = "C", fahrenheit = "F"
//}
//
//let fahrenheit = TemperatureUnit(rawValue: "F")
//
//if fahrenheit != nil {
//    print("fahrenheit")
//}
//
//let unknown = TemperatureUnit(rawValue: "x")
//
//if unknown == nil {
//    print("nil")
//}
//
//class Product {
//    let name: String
//    init?(name: String) {
//        if name.isEmpty { return nil }
//        self.name = name
//    }
//}
//
//class CartItem: Product {
//    let quantity: Int
//    init?(name: String, quantity: Int) {
//        if quantity < 1 { return nil }
//        self.quantity = quantity
//        super.init(name: name)
//    }
//}

//class Person {
//    var name: String
//    let age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
////    convenience init() {
////        self.init(name: "Hamo", age: 345)
////    }
//}

//class Student: Person {
//    var grade: Int
//
//    func gradeUp() {
//        self.grade += 2
//    }
//
//    init(grade: Int) {
//        self.grade = grade
//        super.init(name: "Hamo", age: 345)
//    }
//
//    convenience init() {
//        self.init(grade: 6)
//        self.grade = 2
//        gradeUp()
//    }
//}
