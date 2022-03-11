import UIKit

var integer = 1
var negativeInteger = -10
var money = 30494983

var greeting = "Hello, playground"
var tags = "Clothing,Men,Happy,Fun,Goofy"

var tagsArray = tags.split(separator: ",")

tagsArray.forEach { tag in
    print(tag)
}
print("-----------")
for tag in 0..<tagsArray.count{
    print(tagsArray[tag])
}
tagsArray.sorted()

print(tagsArray.sorted { $0 < $1})

tagsArray.map { tag in
    return tag
}

tagsArray.flatMap { tag in
    return tag
}

tagsArray.min()
tagsArray.max()

tagsArray.append("Uncategorised")
tagsArray.insert("Polisia", at: 3)

print("-----------")
//tagsArray.remove(at: 2)

var index = 2
tagsArray.joined(separator: ", ")
tagsArray.contains { tag in
    return tag == "Men"
}

tagsArray.reversed()

tagsArray.append("lowercased")
tagsArray.allSatisfy { tag in
    tag.first!.isUppercase
}

integer.byteSwapped
integer.magnitude

//checks whether a number is negative or positive
integer.signum()
negativeInteger.signum()

money.formatted(.number)

money.formatted(.currency(code: "USD"))
money.formatted(.currency(code: "KES"))
money.formatted(.percent)

4.isMultiple(of: 2)
5.isMultiple(of: 2)

4.nextUp
4.squareRoot()

//var dictionary: Dictionary = [:]
