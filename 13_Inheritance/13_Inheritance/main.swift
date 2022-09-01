//
//  main.swift
//  13_Inheritance
//
//  Created by Hamo on 2022/08/31.
//

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()

class Bicycle: Vehicle {
    var hasBasket = false
}
