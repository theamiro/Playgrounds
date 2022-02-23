import UIKit

func getDate(createdAt: String) -> Date {
    
    let dateComponents = createdAt.components(separatedBy: "T")
    let splitDate = dateComponents[0]
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let newDateFormatter = DateFormatter()
    newDateFormatter.dateFormat = "M/dd/yyyy"
    
    let date = dateFormatter.date(from: splitDate)
    return date!
}

extension Date {
    func timeAgo(numericDates:Bool) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = self < now ? self : now
        let latest =  self > now ? self : now
        
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfMonth, .month, .year, .second]
        let components: DateComponents = calendar.dateComponents(unitFlags, from: earliest, to: latest)
        
        if let year = components.year {
            if (year >= 2) {
                return "\(year) years ago"
            } else if (year >= 1) {
                return numericDates ?  "1 year ago" : "Last year"
            }
        }
        if let month = components.month {
            if (month >= 2) {
                return "\(month) months ago"
            } else if (month >= 1) {
                return numericDates ? "1 month ago" : "Last month"
            }
        }
        if let weekOfMonth = components.weekOfMonth {
            if (weekOfMonth >= 2) {
                return "\(weekOfMonth) weeks ago"
            } else if (weekOfMonth >= 1) {
                return numericDates ? "1 week ago" : "Last week"
            }
        }
        if let day = components.day {
            if (day >= 2) {
                return "\(day) days ago"
            } else if (day >= 1) {
                return numericDates ? "1 day ago" : "Yesterday"
            }
        }
        if let hour = components.hour {
            if (hour >= 2) {
                return "\(hour) hours ago"
            } else if (hour >= 1) {
                return numericDates ? "1 hour ago" : "An hour ago"
            }
        }
        if let minute = components.minute {
            if (minute >= 2) {
                return "\(minute) minutes ago"
            } else if (minute >= 1) {
                return numericDates ? "1 minute ago" : "A minute ago"
            }
        }
        if let second = components.second {
            if (second >= 3) {
                return "\(second) seconds ago"
            }
        }
        return "Just now"
    }
}

let now = Date()
let pastDate = Date(timeIntervalSinceNow: -464641)

pastDate.timeAgo(numericDates: true)

var sample = getDate(createdAt: "2021-01-12T15:18:45.000Z")
print(sample)

sample.timeAgo(numericDates: true)
