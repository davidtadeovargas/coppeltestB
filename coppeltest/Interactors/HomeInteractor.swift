import Foundation

protocol HomeInteractorInput {
    func fetchIsBannerVisible()
}

protocol HomeInteractorOutput {
    func isBannerVisibleFetched(_ visible: Bool)
    func isBannerVisibleFetchFailed(_ error: Error)
}

class HomeInteractor: HomeInteractorInput {
    var output: HomeInteractorOutput?
    private let worker = HomeWorker()

    func fetchIsBannerVisible() {
        worker.fetchIsBannerVisible { visible, error in
                if let visible = visible {
                    self.output?.isBannerVisibleFetched(visible)
                } else if let error = error {
                    self.output?.isBannerVisibleFetchFailed(error)
                }
            }
    }
}
