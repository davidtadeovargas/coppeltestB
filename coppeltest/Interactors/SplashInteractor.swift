import Foundation

protocol SplashInteractorInput {
    func fetchUpdateApp()
}

protocol SplashInteractorOutput {
    func updateAppFetched(_ update: Bool)
    func updateAppFetchFailed(_ error: Error)
}

class SplashInteractor: SplashInteractorInput {
    var output: SplashInteractorOutput?
    private let worker = SplashWorker()

    func fetchUpdateApp() {
        worker.fetchUpdateApp { update, error in
                if let update = update {
                    self.output?.updateAppFetched(update)
                } else if let error = error {
                    self.output?.updateAppFetchFailed(error)
                }
            }
    }
}
