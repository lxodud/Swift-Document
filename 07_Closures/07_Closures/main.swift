//
//  main.swift
//  07_Closures
//
//  Created by Hamo on 2022/09/25.
//

//let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//func backward(_ s1: String, _ s2: String) -> Bool {
//    return s1 > s2
//}
//
//var reversedNames = names.sorted(by: backward)
//print(reversedNames)
//// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//    return s1 > s2
//})
//
//reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//
//func trailingClosure(closure: () -> Void) {
//
//}
//
//trailingClosure(closure: {
//
//})
//
//trailingClosure() {
//
//}
//
//trailingClosure {
//
//}
//
//let digitNames = [
//    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//]
//let numbers = [16, 58, 510]
//
//
//let strings = numbers.map { (number) -> String in
//    var number = number
//    var output = ""
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//    return output
//}
//
//print(strings)
//// ["OneSix", "FiveEight", "FiveOneZero"]

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//let incremnetByTen = makeIncrementer(forIncrement: 10)
//
//print(incremnetByTen())
//// 10
//print(incremnetByTen())
//// 20
//print(incremnetByTen())
//// 30
//print(incremnetByTen())
//// 40

let incrementBySeven = makeIncrementer(forIncrement: 7)

print(incrementBySeven())
// 7
print(incrementBySeven())
// 14
print(incrementBySeven())
// 21
print(incrementBySeven())
// 28


//print(incremnetByTen())
// 50

let incremnetByTen = makeIncrementer(forIncrement: 10)
let anotherIncrementByTen = incremnetByTen

print(incremnetByTen())
// 10
print(anotherIncrementByTen())
// 20
print(incremnetByTen())
// 30

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler)
}

//func nonAutoClouserFunc(closure: () -> Void) {
//    closure()
//}
//
//nonAutoClouserFunc(closure: {
//    print("하이")
//
//}) // 하이
//
//nonAutoClouserFunc {
//    print("하이")
//} // 하이
//
//func autoClouserFunc(closure: @autoclosure () -> Void) {
//    closure()
//}
//
//autoClouserFunc(closure: print("하이"))

func someFunc(closure: @autoclosure () -> String) {
    print(closure())
}

someFunc(closure: "ac")


