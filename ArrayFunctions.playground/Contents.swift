import UIKit

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
tagsArray.remove(at: 2)

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
tagsArray.reversed()

var arrayWithNil = ["Bool", "String", "Int", nil]
arrayWithNil.map { item in
    item?.uppercased()
}
//unwraps and gets rid of nils
arrayWithNil.compactMap { item in
    item?.uppercased()
}
