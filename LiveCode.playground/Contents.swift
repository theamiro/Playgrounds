import UIKit
import Foundation

var values = [0,1,3,78,43,23]
func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
    var result: [String] = []
    var lowerRange = lower
    var subArray: [Int] = []
    if nums.isEmpty && lower == upper {
        return ["\(lower)"]
    }
    for i in lower...upper {
        if !nums.contains(i) {
            subArray.append(i)
        } else {
            result.append("\(subArray.min()!)->\(subArray.max()!)")
            subArray.removeAll(keepingCapacity: true)
        }
    }
    return result
}
print(findMissingRanges(values, 0, 100))

struct Response: Decodable {
    let status: Int
    let message: String
    let genres: [Genre]
}

struct Genre: Decodable {
    let id: String
    let name: String
    let description: String
    let links: Link
}

struct Link: Decodable {
    let url: String
    let collection: String
    
    enum CodingKeys: String, CodingKey {
        case url = "self"
        case collection = "collection"
    }
}

let url = "https://video-vixen.herokuapp.com/api/genres"

if let urlRequest = URL(string: url) {
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if error == nil {
            if let data = data {
                if let reply = try? JSONDecoder().decode(Response.self, from: data) {
                    for genre in reply.genres {
                        print(genre)
                    }
                }
                else {
                    print("error")
                }
            } else {
                print("error getting data")
            }
        } else {
            print("Error: \(error)")
        }
    }
//    task.resume()
}

var classes = [
    ["Ash", "Brock", "Misty"],
    ["Gloria", "Piper", "Suzanne"],
    ["Picard", "Riker", "Troi"]
]


var names = ["Ash", "Brock", "Misty"]

print(values.min()!)
print(values.max()!)

print(Array(classes.joined()))
classes.append(["Michael"])
classes[0].append("Michael")
print(classes)

print(classes[0])

print(classes[0].map({$0.uppercased()}))

print(values.map({$0 * 10}))

print("Squares of all values: \(values.map({$0 * $0}))")

print(values.sorted().map({$0 * $0}))

for (index, item) in names.reversed().enumerated() {
    print("Index: \(index) and Item: \(item)")
}

for (index, item) in values.enumerated() {
    print("Index: \(index) and Item: \(item)")
}

print(names.remove(at: 1))
// Sum of the Squares using Map and Reduce
print(values.map({$0 * $0}).reduce(0, +))

//Sum of Squares using reduce
print(values.reduce(0, { $0 + ($1 * $1)}))

print(classes[0].filter {
    $0.contains("Mi")
})

// Filter array return only even numbers
print(values.filter { $0 % 2 == 0} )

// Filter array return only odd numbers
print(values.filter { $0 % 2 != 0} )

// String

var string = "michael amiro"
print(String(string.reversed()))

var tags = "Social,Media, Marketing, Money Matters, Matters, Matters"
var range = NSRange(location: 0, length: tags.utf16.count)
tags = tags.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)

print(tags.split(separator: Character(",")))

extension Sequence where Element: Hashable {
    func uniqueArray() -> [Element]{
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
print(tags.trimmingCharacters(in: .whitespaces).split(separator: Character(",")).uniqueArray())

print(string)
print(string.capitalized)
print(string.uppercased())
print(string.lowercased())

print(string.remove(at: string.index(string.startIndex, offsetBy: 2)))
var stringy = string.prefix(upTo: string.index(string.startIndex, offsetBy: 2)) + string.suffix(from: string.index(string.startIndex, offsetBy: 2))
print(stringy)


var sample = "1234567890"
var subSample = sample.remove(at: sample.index(sample.startIndex, offsetBy: 4))


// Functions
func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
var four  = 4
var five = 5

var firstname = "Michael"
var lastname = "Amiro"
var fullname = "\(firstname) \(lastname)"
var search = "[]e][e638+]"
let injection: [Character] = ["[", "]", "+"]
print(search.removeAll(where: {injection.contains($0)}))
print(search)

print(search.filter{injection.contains($0)})

swap(&four, &five)
swap(&firstname, &lastname)
print(four, five)
print(firstname, lastname)

extension String {
    mutating func addOne() -> String {
        return self + "1"
    }
    func generateEmailID(with domain: String) -> String {
        let regex = try! NSRegularExpression(pattern: "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: domain.utf16.count)
        if (regex.firstMatch(in: domain, options: [], range: range) != nil) {
            return "\(self.split(separator: " ")[0].lowercased()).\(self.split(separator: " ")[1].lowercased())@\(domain)"
        }
      return ""
    }
}
firstname.addOne()
fullname.generateEmailID(with: "qhala.com")

// Recursive Funcs
func factorial(number: Int) -> Int {
    if number <= 1 {
        return 1
    }
    return number * factorial(number: number - 1)
}
factorial(number: 12)

func fibonacci(number: Int) -> Int {
    if number == 0 {
        return 0
    }
    if number == 1 {
        return 1
    }
    return fibonacci(number: number - 1) + fibonacci(number: number - 2)
}
for i in 0...9 {
    print(fibonacci(number: i))
}

func square<T: FloatingPoint>(_ value: T) -> T {
    return value * value
}
square(2)

