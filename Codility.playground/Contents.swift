import Foundation
import UIKit
extension String {
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let supportedFormats = [
            "dd MMM y HH:mm:ss zzz",
            "EEEE dd/MMMM/y",
            "d(EEE).MM(MMM).y"
        ]
        for format in supportedFormats {
            formatter.dateFormat = format
            if let date = formatter.date(from: self) {
                return date
            }
        }
        return nil
    }

}

extension Date {
    var day: Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day
    }

    var nameOfDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "cccc"
        return formatter.string(from: self)
    }

    var month: Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        return components.month
    }

    var nameOfTheMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }

    var year: Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return components.year
    }

    static func numberOfDaysBetween(_ date: Date, and date2: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date, to: date2)
        return abs(components.day!)
    }
}
//print("12 Dec 2018 22:15:00 CST".toDate()!)
//print("Sunday 26/April/2020".toDate()!)

//let date = "12 Dec 2018 22:15:00 CST".toDate()!
//print(Date().day!)
//print(Date().nameOfDay)
//print(Date().month!)
//print(Date().nameOfTheMonth)
//print(Date().year!)
//print(Date.numberOfDaysBetween(Date(), and: Date()))
//

enum ImageFetchingError: Error {
    case timeout
    case unknown
}

protocol CatImageCellModel {
    var placeholderImage: UIImage {get}
    func fetchCatImage(completion: @escaping(Result<UIImage, ImageFetchingError>) -> Void)
}
struct UIImage: Equatable {}
class UIImageView {
    var image: UIImage?
}
class UICollectionViewCell {
    func prepareForReuse() {}
}

final class CatImageCell: UICollectionViewCell {

    private var imageView: UIImageView!

    convenience init(imageView: UIImageView) {
        self.init()

        self.imageView = imageView
    }

    func set(model: CatImageCellModel) {
        var counter = 0
        model.fetchCatImage{ [weak self] (result) in
            switch result {
                case .timeout:
                    counter+
                case .unknown:
                    DispatchQueue.main.async {
                        self!.imageView.image = model.placeholderImage
                    }
                case default(let image):
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
            }
        }
    }
}
