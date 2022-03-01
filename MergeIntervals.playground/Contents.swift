import UIKit

func mergeIntervals(_ intervals: inout [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else {
        return intervals
    }
    let sortedIntervals = intervals.sorted { interval1, interval2 in
        return interval1[0] < interval2[0]
    }
    var result = [[Int]]()
    result.append(sortedIntervals[0])
    
    for i in 0..<sortedIntervals.count {
        let currentInterval = sortedIntervals[i]
        let lastInterval = result.last!
        
        if currentInterval[0] >= lastInterval[0] && currentInterval[0] <= lastInterval[1] {
            result.removeLast()
            result.append([
                min(currentInterval[0], lastInterval[0]),
                max(currentInterval[1], lastInterval[1])
            ])
        } else {
            result.append(currentInterval)
        }
    }
    return result
}

var array: [[Int]] = [[8,10], [1,3], [2,5]]
print(mergeIntervals(&array))
