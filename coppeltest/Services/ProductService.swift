import Foundation

class ProductService {
    
    func fetchProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
            if let url = URL(string: "https://fakestoreapi.com/products") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decodedProducts = try JSONDecoder().decode([ProductModel].self, from: data)
                            completion(.success(decodedProducts))
                        } catch {
                            completion(.failure(error))
                        }
                    } else if let error = error {
                        completion(.failure(error))
                    } else {
                        let unknownError = NSError(domain: "com.yourapp", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])
                        completion(.failure(unknownError))
                    }
                }.resume()
            } else {
                let invalidURLError = NSError(domain: "com.yourapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                completion(.failure(invalidURLError))
            }
        }
}
