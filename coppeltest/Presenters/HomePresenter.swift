import Foundation
import Combine

class HomePresenter: ObservableObject,HomeInteractorOutput {
    
    @Published var isBannerVisible = true
    
    private let interactor = HomeInteractor()
    
    init() {
        self.interactor.output = self
        fetchIsBannerVisible()
    }

    func fetchIsBannerVisible() {
        interactor.fetchIsBannerVisible()
    }
    
    // Implementa los métodos del protocolo para manejar los resultados
    func isBannerVisibleFetched(_ visible: Bool) {
        DispatchQueue.main.async { [self] in
            self.isBannerVisible = visible
        }
    }

    func isBannerVisibleFetchFailed(_ error: Error) {
        print("Error fetchIsBannerVisible: \(error)")
    }
}

