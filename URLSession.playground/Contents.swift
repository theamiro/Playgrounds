import Foundation

struct Device {
    var type: String
    var price: Double
    var color: String
}


var iMacPro = Device(type: "iMac", price: 300.00, color: "Green")
var ipadPro = Device(type: "iPad", price: 265.00, color: "Red")
var iphoneX = Device(type: "iPhone", price: 145.00, color: "Yellow")
var appleWatch = Device(type: "iWatch", price: 30.00, color: "Blue")


var devices = [iMacPro, ipadPro, iphoneX, appleWatch]


//Filter
var macs = devices.filter { ( $0.type == "iMac" ) }
print(macs)


//Map
var canMacs = devices.map{ ( $0.price * 2.00 ) }
print(canMacs)

//Reduce
//combine values into one
//sum up all prices into one

var totalPrice = canMacs.reduce(0.0, +)
print(totalPrice)


protocol selectDeviceDelegate {
    func selectDevice()
}
//extension selectDeviceDelegate {
//    func selectDevice() { }
//}


func reverseString(_ string: String) -> String {
    return String(string.reversed())
}
print(reverseString("Hello World!"))
