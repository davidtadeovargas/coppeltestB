/**
 Una clase de ViewModel que gestiona una lista de categorías.

 Esta clase de ViewModel se utiliza para administrar una lista de categorías, proporcionando acceso a través de la propiedad `categories`. También incluye un método `loadCategories` para cargar las categorías manualmente.

 - Important: Asegúrate de inicializar esta clase antes de usarla y llama al método `loadCategories` para cargar las categorías.

 - SeeAlso: `CategoryModel` para ver el modelo de datos de categoría asociado.
 */
import Foundation
import Combine

class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [CategoryModel] = []
    
    private let categoriesService = CategoriesService()
    
    /**
     Inicializa un nuevo ViewModel de categorías y carga categorías manualmente.

     - Important: Asegúrate de inicializar esta clase antes de usarla y llama al método `loadCategories` para cargar las categorías.

     */
    init() {
        loadCategories()
    }

    /**
     Carga categorías manualmente y las asigna a la propiedad `categories`.

     - Note: Este método carga una lista predefinida de categorías y las almacena en la propiedad `categories`.

     - SeeAlso: `CategoryModel` para ver el modelo de datos de categoría asociado.
     */
    func loadCategories() {
        categoriesService.fetchCategories { [weak self] categories in
            DispatchQueue.main.async {
                self?.categories = categories
            }
        }
    }
}
