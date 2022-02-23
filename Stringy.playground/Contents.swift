import UIKit

var fullName = "Michael Amiro"

extension String {
    func getFirstName() -> String {
        guard let firstName = self.split(separator: " ").first else {
            return ""
        }
        return String(firstName)
    }

    func getLastName() -> String {
        guard let lastName = self.split(separator: " ").last else {
            return ""
        }
        return String(lastName)
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss"
        
        guard let date = formatter.date(from: self) else {
            return "No Date Found"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD/MM/YYYY HH:mm:ss"
        return "\(dateFormatter.string(from: date))"
    }
}
fullName.getFirstName()
fullName.getLastName()
