//
//  main.swift
//  27_Access_Control
//
//  Created by Hamo on 2022/09/05.
//

//public class SomePublicClass {}
//internal class SomeInternalClass {}
//fileprivate class SomeFilePrivateClass {}
//private class SomePrivateClass {}
//
//public var somePublicVariable = 0
//internal let someInternalConstant = 0
//fileprivate func someFilePrivateFunction() {}
//private func somePrivateFunction() {}

public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

//func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    // function implementation goes here
//}

public enum CompassPoint {
    case north
    case south
    case east
    case west
}

// MARK: 함수 접근 수준

//class PrivateClass {
//    let a: Int = 1
//}

//func a(privateClass: PrivateClass) {
//    print(privateClass.a)
//} // 에러남

//func a() -> PrivateClass? {
//    return nil
//} // 에러남

//fileprivate func a(privateClass: PrivateClass) {
//    print(privateClass.a)
//}

// MARK: 하위 클래스 상위 클래스

//private class PrivateClass {
//    let a: Int = 1
//}
//
//private class childClass: PrivateClass {
//
//} // Class cannot be declared internal because its superclass is private

// MARK: 재정의

//public class PrivateClass {
//    let a: Int = 1
//    fileprivate func someMethod() { }
//}
//
//internal class childClass: PrivateClass {
//
//    override internal func someMethod() {
//        print("abc")
//    }
//}

// MARK: 상수, 변수, 프로퍼티

//fileprivate class FilePrivateClass {
//    let a: Int = 0
//}
//
//private class PrivateClass {
//    let a: Int = 0
//}

//internal class InternalClass {
//    let a: Int = 0
//}
//
//private let some = PrivateClass()
// -> 에러
//fileprivate let some = PrivateClass()
////let some = PrivateClass() -> 에러

// MARK: private(set)

//class SomeClass {
//    private(set) var a: Int = 0
//}
//
//let number = SomeClass()
//
//print(number.a)
//
//number.a = 1
//
//private let some = PrivateClass()
//
//fileprivate let some = FilePrivateClass()

// MARK: fileprivate vs private
//private class FilePrivateClass {
//    let a: Int = 2
//}
////
//private class PrivateClass {
//    public let a = FilePrivateClass()
//}
//
//internal class InternalClass {
//    let a: Int = 0
//}

//private let some = PrivateClass()
// 이건 가능하죠?
// 가능

//fileprivate let some = PrivateClass()
//print(some.a.a)
// 이거도 가능해요
// 더 높은 접근수준인데 왜 될까요??
// 가능

//internal let some = PrivateClass()
// 불가능 인터널임

//fileprivate let some = FilePrivateClass()

//class SomeClass {
//    private(set) var a: Int = 0
//}
//
//let number = SomeClass()
//
//print(number.a)

//number.a = 1

