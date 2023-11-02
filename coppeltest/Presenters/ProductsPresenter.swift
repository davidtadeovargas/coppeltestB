import Foundation
import Combine

class ProductsPresenter: ObservableObject, ProductsInteractorOutput {
    
    @Published var products: [ProductModel] = []

    private let interactor = ProductsInteractor()
    
    init() {
        self.interactor.output = self
        fetchProducts()
    }

    func fetchProducts() {
        interactor.fetchProducts()
    }

    // Implementa los métodos del protocolo para manejar los resultados
    func productsFetched(_ products: [ProductModel]) {
        DispatchQueue.main.async {
            self.products = products
        }
    }

    func productsFetchFailed(_ error: Error) {
        print("Error fetching products: \(error)")
    }
}
