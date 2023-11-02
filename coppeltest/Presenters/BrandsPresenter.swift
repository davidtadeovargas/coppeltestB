/**
 Una clase de ViewModel que gestiona una lista de marcas.

 Esta clase de ViewModel se utiliza para administrar una lista de marcas, proporcionando acceso a través de la propiedad `brands`. También incluye un método `loadBrands` para cargar las marcas en la lista.

 - Important: Asegúrate de inicializar esta clase antes de usarla y llamar al método `loadBrands` para cargar las marcas.

 - SeeAlso: `BrandModel` para ver el modelo de datos de marca asociado.
 */
import Foundation
import Combine

class BrandsPresenter: ObservableObject,BrandsInteractorOutput {
    
    @Published var brands: [BrandModel] = []
    
    private let interactor = BrandsInteractor()
    
    init() {
        self.interactor.output = self
        fetchBrands()
    }

    func fetchBrands() {
        interactor.fetchBrands()
    }
    
    func brandsFetched(_ brands: [BrandModel]) {
        DispatchQueue.main.async { [self] in
            self.brands = brands
        }
    }

    func brandsFetchFailed(_ error: Error) {
        print("Error fetching brands: \(error)")
    }
}
