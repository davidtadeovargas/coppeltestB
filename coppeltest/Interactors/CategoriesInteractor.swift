import Foundation

protocol CategoriesInteractorInput {
    func fetchCategories()
}

protocol CategoriesInteractorOutput {
    func categoriesFetched(_ categories: [CategoryModel])
    func categoriesFetchFailed(_ error: Error)
}

class CategoriesInteractor: CategoriesInteractorInput {
    var output: CategoriesInteractorOutput?
    private let worker = CategoriesWorker()

    func fetchCategories() {
        worker.fetchCategories { categories, error in
                if let categories = categories {
                    self.output?.categoriesFetched(categories)
                } else if let error = error {
                    self.output?.categoriesFetchFailed(error)
                }
            }
    }
}
