import Foundation

class CategoriesWorker {
    
    func fetchCategories(completion: @escaping ([CategoryModel]?, Error?) -> Void) {
        
        DispatchQueue.global().async {
            // Simula la obtención de datos del servicio real o fuente de datos.
            let categories: [CategoryModel] = [
                CategoryModel(category: .electronics),
                CategoryModel(category: .jewelry),
                CategoryModel(category: .mensClothing),
                CategoryModel(category: .womensClothing)
            ]
            
            // Llama al bloque de finalización con los datos simulados.
            completion(categories, nil)
        }
    }
}
