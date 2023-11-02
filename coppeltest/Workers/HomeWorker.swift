import Foundation

class HomeWorker {
    
    func fetchIsBannerVisible(completion: @escaping (Bool?, Error?) -> Void) {
        
        DispatchQueue.global().async {
            
            // Llama al bloque de finalización con los datos simulados.
            completion(true, nil)
        }
    }
}

