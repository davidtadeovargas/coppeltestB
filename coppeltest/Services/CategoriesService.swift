import Foundation

class CategoriesService {
    
    private var categories: [CategoryModel] = [
        CategoryModel(category: .electronics),
        CategoryModel(category: .jewelry),
        CategoryModel(category: .mensClothing),
        CategoryModel(category: .womensClothing)
    ]
    
    func fetchCategories(completion: @escaping ([CategoryModel]) -> Void) {
        // Simulamos una llamada asincrónica y luego llamamos al bloque de finalización con la lista de categorías.
        DispatchQueue.global().async {
            completion(self.categories)
        }
    }
}
