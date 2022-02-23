import UIKit
import Foundation

var array = [2,3,4,5,6,7,8,9,10,20,30,1]

func binarySearch(for value: Int, in array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    let sortedArray = array.sorted()

    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = sortedArray[middleIndex]
        
        if value == middleValue {
            return true
        }
        if value < middleValue {
            rightIndex = middleIndex
        }
        if value > middleValue {
            leftIndex = middleIndex
        }
    }
    return false
}

binarySearch(for: 140, in: array)


func binarySearch2(for value: Int, in array: [Int]) -> String {
    var leftIndex = 0
    var rightIndex = array.count - 1
    let sortedArray = array.sorted()
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = sortedArray[middleIndex]
        
        if value == middleValue {
            return "\(middleIndex)"
        }
        
        if value < middleValue {
            rightIndex = middleIndex
        }
        
        if value > middleValue {
            leftIndex = middleIndex
        }
    }
    return "Value not found"
}

binarySearch2(for: 140, in: array)
