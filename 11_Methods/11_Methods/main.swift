//
//  main.swift
//  11_Methods
//
//  Created by TaeLee on 2022/06/20.
//

// MARK: Instance Method
// 특정 클래스, 구조체, 열거형의 인스턴스에 속하는 함수
class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
// count = 1
counter.increment(by: 5)
// count = 6
counter.reset()
// count = 0

// MARK: self Porperty
// 인스턴스 메서드에서 현재의 인스턴스를 참조하기 위해 사용한다.
struct Point {
    var x = 0.0
    var y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

// MARK: Modifying Value Types from Within Instance Methods
// 구조체, 열거형의 인스턴스 메서드 내에서 프로퍼티의 값을 변경하려면 mutating 키워드를 사용한다.
extension Point {
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("\(somePoint.x), \(somePoint.y) ")
// (3.0, 4.0)

// MARK: Assigning to self Within a Mutating Method
// 암시적 self 프로퍼티를 새로운 인스턴스로 할당할 수 있다.
struct Point1 {
    var x = 0.0
    var y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
// .high
ovenLight.next()
// .off

// MARK: Type Methods
// 타입 자체에서 호출되는 메서드
class SomeClass {
    class func someTypeMethod() {
        print("재정의 가능한 타입 메서드")
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    // warning 무시 -> Attributes 참고
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "TaeLee")
player.complete(level: 1)
print("\(LevelTracker.highestUnlockedLevel)")
// LevelTracker.highestUnlockedLevel = 2

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
