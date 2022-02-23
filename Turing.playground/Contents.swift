import UIKit

enum Foo: RawRepresentable {
    case one
    case two
    
    init?(rawValue: Int) {
        self = .one
    }
    var rawValue: Int {
        return 1
    }
}
let result = Foo.one == Foo.two

var x = 5
func increment() -> Int {
    defer { x += 1}
    return x
}
x = increment()
let res = increment()
print(x, res, x)


var a: Int? = nil

a? = 10
var b: Int? = nil

b? = 5
var c: Int? = nil
c = 10

var animals = ["cow", "hen", "goat", "fish"]

animals.sort(by: <)


class Starship {
    var type: String = "John"
    var age: Int = 10
}

let m = 15

var resulting = 0
switch m {
case 1...15:
    resulting = 1
    fallthrough
case 2: resulting = 102
case 5:
    resulting = 103
default: resulting = 104
}
print(resulting)

let nsString = NSString("Hello")
let siftStr = String(nsString)


func swap(p: inout Int, l: inout Int) {
    let tempA = p
    p = l
    l = tempA
}
var p = 20
var l = 10
swap(&p, &l)
print(p)
print(l)

let num = UInt.min

func minMax(numbers: Double...) -> Double {
    return 3.0
}

func square<T: FloatingPoint>(_ value: T) -> T {
    return value * value
}
square(2)


/// Get the ruling
/// - Parameter submission: the submissions for the case
/// - Returns: Guilty or Not Guilty ruling
func sampleFunc(submission: String) -> String {
    let ruling = ""
    return ruling
}
