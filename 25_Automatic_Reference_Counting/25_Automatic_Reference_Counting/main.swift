//
//  main.swift
//  25_Automatic_Reference_Counting
//
//  Created by Hamo on 2022/10/04.
//
//
//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "Hamo")
//// Hamo is being initialized
//reference1 = nil
//reference2 = nil
//
//reference3 = nil
// Prints "John Appleseed is being deinitialized"

class Person {
    let name: String
    var car: Car?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("사람 해제!!")
    }
}

class Car {
    let name: String
    weak var owner: Person?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("자동차 해제!!")
    }
}

var hamo: Person?
var avante: Car?

hamo = Person(name: "Hamo")
avante = Car(name: "avante")

hamo?.car = avante
avante?.owner = hamo

hamo = nil
avante = nil

class Customer {
    let name: String
    var card: Insurance?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("고객 해제!!")
    }
}

class Insurance {
    let name: String
    unowned let customer: Customer

    init(name: String, customer: Customer) {
        self.name = name
        self.customer = customer
    }

    deinit {
        print("카드 해제!!")
    }
}
//
//
//var hamo: Customer?
//hamo = Customer(name: "Hamo")
//hamo?.card = Insurance(name: "라이나생명", customer: hamo!)
//hamo = nil
// 고객 해제!!
// 카드 해제!!

// 보험이라는 놈은 고객이 없으면 아무짝에 쓸모가 없다.따라서 사람이 수명이 더 길거나 같음!!
// 그래서 unowned를 사용한다~~
