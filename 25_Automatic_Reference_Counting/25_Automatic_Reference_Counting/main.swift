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

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

let department = Department(name: "Horticulture")

let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"


class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}
