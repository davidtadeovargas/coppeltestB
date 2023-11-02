import Foundation

protocol BrandsInteractorInput {
    func fetchBrands()
}

protocol BrandsInteractorOutput {
    func brandsFetched(_ brands: [BrandModel])
    func brandsFetchFailed(_ error: Error)
}

class BrandsInteractor: BrandsInteractorInput {
    var output: BrandsInteractorOutput?
    private let worker = BrandsWorker()

    func fetchBrands() {
        worker.fetchBrands { brands, error in
                if let brands = brands {
                    self.output?.brandsFetched(brands)
                } else if let error = error {
                    self.output?.brandsFetchFailed(error)
                }
            }
    }
}
