//
//  main.swift
//  23_Generics
//
//  Created by Hamo on 2022/06/20.
//

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt: \(someInt), anotherInt: \(anotherInt)")
// someInt: 107, anotherInt: 3

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//struct IntStack {
//    var items: [Int] = []
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}

struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stringStack = Stack<String>()

stringStack.push("uno")
stringStack.push("dos")
stringStack.push("tres")
stringStack.push("cautro")

let value = stringStack.pop()
print(value)
// cautro
