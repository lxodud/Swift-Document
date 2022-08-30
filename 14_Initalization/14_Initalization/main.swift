//
//  main.swift
//  14_Initalization
//
//  Created by TaeLee on 2022/08/30.
//

// MARK: Setting Initial Values for Stored Properties
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("기본 온도: \(f.temperature)")
// 기본 온도: 32.0

// MARK: Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius == 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius == 0.0

// MARK: Parameter Names and Argument Labels
struct Color {
    let red: Double
    let green: Double
    let blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// MARK: Initializer Parameters Without Argument Labels
extension Celsius {
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius(37.0)
print(bodyTemperature)

// MARK: Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// MARK: Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0
    var height = 0.0
}
//let twoByTwo = Size(width: 2.0, height: 2.0)
//let zeroByTwo = Size(height: 2.0)
//let zeroByZero = Size()

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let
    }
}





