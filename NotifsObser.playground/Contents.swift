import UIKit

protocol DynamicText {
    func textCopy(value: String) -> Bool
}
extension DynamicText {
    func textCopy(value: String) -> Bool {
        return true
    }
}
class Bamboo: DynamicText {
    
}

@objc protocol DynamicTexter {
    @objc optional func textCopy(value: String) -> Bool
}

class Bamboos: DynamicTexter {
    
}


class Person {
    var name: String
    var computer: Computer?
    init(name: String, computer: Computer?) {
        self.name = name
        self.computer = computer
    }
}
class Computer {
    var name: String
    var owner: Person?
    init(name: String, owner: Person?) {
        self.name = name
        self.owner = owner
    }
}
