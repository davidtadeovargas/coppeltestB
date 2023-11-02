import XCTest
@testable import coppeltest

class ProductsInteractorTests: XCTestCase {
    
    class MockProductsInteractorOutput: ProductsInteractorOutput {
        var productsFetchedCalled = false
        var productsFetchFailedCalled = false

        func productsFetched(_ products: [ProductModel]) {
            productsFetchedCalled = true
        }

        func productsFetchFailed(_ error: Error) {
            productsFetchFailedCalled = true
        }
    }

    func testFetchProducts_Success() {
        // Preparación
        let interactor = ProductsInteractor()
        let mockOutput = MockProductsInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch products expectation")

        // Prueba
        interactor.fetchProducts()

        // Esperar un tiempo para que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Verificación
            XCTAssertTrue(mockOutput.productsFetchedCalled, "productsFetched should be called")
            XCTAssertFalse(mockOutput.productsFetchFailedCalled, "productsFetchFailed should not be called")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que la expectativa se cumpla o se agote el tiempo
        wait(for: [expectation], timeout: 2.0)
    }
}
