import Foundation
import Combine

class SplashPresenter: ObservableObject, SplashInteractorOutput {
    
    @Published var updateApp = false
    
    private let interactor = SplashInteractor()
    
    init() {
        self.interactor.output = self
        fetchUpdateApp()
    }

    func fetchUpdateApp() {
        interactor.fetchUpdateApp()
    }
    
    // Implementa los métodos del protocolo para manejar los resultados
    func updateAppFetched(_ update: Bool) {
        DispatchQueue.main.async { [self] in
            self.updateApp = update
        }
    }

    func updateAppFetchFailed(_ error: Error) {
        print("Error fetchUpdateApp: \(error)")
    }
}
