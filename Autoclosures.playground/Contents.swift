import UIKit

struct Person: CustomStringConvertible {
    var name: String
    var description: String {
        return "The name of the person is \(name)"
    }
}
var debug = true

func logDebug(_ message: @autoclosure () -> String) {
    if debug {
        print("Debug: \(message())")
    }
}

let amiro = Person(name: "Michael Amiro")
logDebug(amiro.description)


