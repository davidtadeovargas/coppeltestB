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
                }
            }.resume()
        }
    }
}
