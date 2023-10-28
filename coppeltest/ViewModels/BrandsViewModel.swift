/**
 Una clase de ViewModel que gestiona una lista de marcas.

 Esta clase de ViewModel se utiliza para administrar una lista de marcas, proporcionando acceso a través de la propiedad `brands`. También incluye un método `loadBrands` para cargar las marcas en la lista.

 - Important: Asegúrate de inicializar esta clase antes de usarla y llamar al método `loadBrands` para cargar las marcas.

 - SeeAlso: `BrandModel` para ver el modelo de datos de marca asociado.
 */
import Foundation
import Combine

class BrandsViewModel: ObservableObject {
    
    @Published var brands: [BrandModel] = []

    /**
     Inicializa un nuevo ViewModel de marcas.
     
     - Important: Asegúrate de inicializar esta clase antes de usarla.

     */
    init() {
        loadBrands()
    }

    /**
     Carga las marcas en la lista de marcas.

     - Note: Este método carga marcas de ejemplo y las almacena en la propiedad `brands`. Puedes personalizar este método para cargar marcas desde una fuente de datos real.

     - SeeAlso: `BrandModel` para ver el modelo de datos de marca asociado.
     */
    func loadBrands() {
        
        brands = [
            BrandModel(brand: .apple),
            BrandModel(brand: .motorola),
            BrandModel(brand: .samsung),
            BrandModel(brand: .sony)
        ]
    }
}
