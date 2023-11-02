import Foundation

class SplashWorker {
    
    func fetchUpdateApp(completion: @escaping (Bool?, Error?) -> Void) {
        
        DispatchQueue.global().async {
            
            // Llama al bloque de finalización con los datos simulados.
            completion(false, nil)
        }
    }
}
