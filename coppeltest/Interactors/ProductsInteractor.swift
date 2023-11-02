import Foundation

protocol ProductsInteractorInput {
    func fetchProducts()
}

protocol ProductsInteractorOutput {
    func productsFetched(_ products: [ProductModel])
    func productsFetchFailed(_ error: Error)
}

class ProductsInteractor: ProductsInteractorInput {
    var output: ProductsInteractorOutput?
    private let worker = ProductsWorker()

    func fetchProducts() {
        worker.fetchProducts { result in
            switch result {
            case .success(let products):
                self.output?.productsFetched(products)
            case .failure(let error):
                self.output?.productsFetchFailed(error)
            }
        }
    }
}
