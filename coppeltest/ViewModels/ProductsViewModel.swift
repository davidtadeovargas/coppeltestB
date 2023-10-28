/**
 Una clase de ViewModel que gestiona una lista de productos.

 Esta clase de ViewModel se utiliza para administrar una lista de productos, proporcionando acceso a través de la propiedad `products`. También incluye un método `fetchProducts` para cargar productos desde una fuente de datos remota.

 - Important: Asegúrate de inicializar esta clase antes de usarla y llamar al método `fetchProducts` para cargar los productos.

 - SeeAlso: `ProductModel` para ver el modelo de datos de producto asociado.
 */
import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []

    /**
     Inicializa un nuevo ViewModel de productos y carga productos desde una fuente de datos remota.
     
     - Important: Asegúrate de inicializar esta clase antes de usarla.

     */
    init() {
        fetchProducts()
    }

    /**
     Carga productos desde una fuente de datos remota.

     - Note: Este método utiliza URLSession para realizar una solicitud HTTP y decodificar los datos JSON de la respuesta en objetos `ProductModel`. Los productos se almacenan en la propiedad `products`.

     - Important: Asegúrate de que el dispositivo tenga una conexión a Internet para que esta operación funcione correctamente.

     - SeeAlso: `ProductModel` para ver el modelo de datos de producto asociado.
     */
    func fetchProducts() {
        if let url = URL(string: "https://fakestoreapi.com/products") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedProducts = try JSONDecoder().decode([ProductModel].self, from: data)
                        DispatchQueue.main.async {
                            self.products = decodedProducts
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }
}
