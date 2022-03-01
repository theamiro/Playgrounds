import UIKit

enum APIError: Error {
    case unknownError
    case invalidURLString
    case requestFailure
    case noData
    case JSONError
    case jsonNotDecodable
}

func makeEscapingAPICall(endpoint: String, completion: @escaping (Result<Any, APIError>) -> Void) {
    guard let url = URL(string: endpoint) else {
        completion(.failure(.invalidURLString))
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        if error != nil {
            completion(.failure(.unknownError))
        }
        guard let data = data else {
            completion(.failure(.noData))
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let object = json as? [[String: Any]] else {
                completion(.failure(.jsonNotDecodable))
                return
            }
            completion(.success(object))
        } catch {
            completion(.failure(.JSONError))
        }
        
    }.resume()
}

func nonEscapingCompletion(array: [Int], completion: ([Int]) -> Void) {
    var sortedArray = [Int]()
    sortedArray = array.sorted()
    
    completion(sortedArray)
}

makeEscapingAPICall(endpoint: "https://fakestoreapi.com/products") { result in
    switch result {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

nonEscapingCompletion(array: [1,2,5,2,4,3,1,2]) { sorted in
    print(sorted)
}
