import Foundation
import Combine

class CategoriesPresenter: ObservableObject, CategoriesInteractorOutput {
    
    @Published var categories: [CategoryModel] = []
    
    private let interactor = CategoriesInteractor()
    
    init() {
        self.interactor.output = self
        fetchCategories()
    }

    func fetchCategories() {
        interactor.fetchCategories()
    }
    
    // Implementa los métodos del protocolo para manejar los resultados
    func categoriesFetched(_ categories: [CategoryModel]) {
        DispatchQueue.main.async { [self] in
            self.categories = categories
        }
    }

    func categoriesFetchFailed(_ error: Error) {
        print("Error fetching categories: \(error)")
    }
}
