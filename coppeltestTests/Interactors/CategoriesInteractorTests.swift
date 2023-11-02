import XCTest
@testable import coppeltest

class CategoriesInteractorTests: XCTestCase {
    
    class MockCategoriesInteractorOutput: CategoriesInteractorOutput {
        var categoriesFetchedCalled = false
        var categoriesFetchFailedCalled = false

        func categoriesFetched(_ categories: [CategoryModel]) {
            categoriesFetchedCalled = true
        }

        func categoriesFetchFailed(_ error: Error) {
            categoriesFetchFailedCalled = true
        }
    }

    func testFetchCategories_Success() {
        // Preparación
        let interactor = CategoriesInteractor()
        let mockOutput = MockCategoriesInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch categories expectation")

        // Prueba
        interactor.fetchCategories()

        // Esperar un tiempo para que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Verificación
            XCTAssertTrue(mockOutput.categoriesFetchedCalled, "categoriesFetched should be called")
            XCTAssertFalse(mockOutput.categoriesFetchFailedCalled, "categoriesFetchFailed should not be called")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que la expectativa se cumpla o se agote el tiempo
        wait(for: [expectation], timeout: 2.0)
    }
}
