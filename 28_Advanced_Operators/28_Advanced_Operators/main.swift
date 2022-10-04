//
//  main.swift
//  28_Advanced_Operators
//
//  Created by Dylan_Yoon on 2022/06/20.
//

//var myValue: Int = Int.max
////print(myValue + 1)
//// 오버플로우가 발생한다!! -> 에러
//print(myValue &+ 1)
//// -9223372036854775808 최소값으로 넘어감

//let bit: UInt8 = 0b00001111
//let invertedBit = ~bit
//// invertedBit는 0b11110000
//
//let firstSixBits: UInt8 = 0b11111100
//let lastSixBits: UInt8 = 0b00111111
//let andOperateTest = firstSixBits & lastSixBits
//// 00111100
//
//let someBits: UInt8 = 0b10110010
//let moreBits: UInt8 = 0b01011110
//let combinedbits = someBits | moreBits
//// 11111110
//
//let firstBits: UInt8 = 0b00010100
//let otherBits: UInt8 = 0b00000101
//let outputBits = firstBits ^ otherBits
//// 00010001

var myValue: Int8 = Int8.min
print(myValue &- 1)
// 127 최소값으로 넘어감

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector는 (5.0, 5.0)이다.

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 1.0, y: 2.0)
let negative = -positive
print(negative)
// Vector2D(x: -1.0, y: -2.0)

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original)
// Vector2D(x: 4.0, y: 6.0)

//extension Vector2D: Equatable {
//    static func == (left: Vector2D, right: Vector2D) -> Bool {
//        return (left.x == right.x) && (left.y == right.y)
//    }
//}

//let firstVector = Vector2D(x: 1.0, y: 1.0)
//let secondVector = Vector2D(x: 1.0, y: 1.0)
//
//if firstVector == secondVector {
//    print("같다.")
//} else {
//    print("다르다.")
//} // 같다. 가 출력된다.

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)
// Vector2D(x: 2.0, y: 8.0)

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print(plusMinusVector)
// Vector2D(x: 4.0, y: -2.0)

protocol Drawable {
    func draw() -> String
}

struct Line: Drawable {
    var elements: [Drawable]
    func draw() -> String {
        return elements.map { $0.draw() }.joined(separator: "")
    }
}

struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}

struct Space: Drawable {
    func draw() -> String { return " " }
}

struct Stars: Drawable {
    var length: Int
    func draw() -> String { return String(repeating: "*", count: length) }
}

struct AllCaps: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw().uppercased() }
}

let name: String? = "Ravi Patel"
let manualDrawing = Line(elements: [
    Stars(length: 3),
    Text("Hello"),
    Space(),
    AllCaps(content: Text((name ?? "World") + "!")),
    Stars(length: 2),
    ])
print(manualDrawing.draw())
// Prints "***Hello RAVI PATEL!**"

@resultBuilder
struct DrawingBuilder {
    static func buildBlock(_ components: Drawable...) -> Drawable {
        return Line(elements: components)
    }
    static func buildEither(first: Drawable) -> Drawable {
        return first
    }
    static func buildEither(second: Drawable) -> Drawable {
        return second
    }
}
