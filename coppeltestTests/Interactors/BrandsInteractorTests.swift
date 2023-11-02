import XCTest
@testable import coppeltest

class BrandsInteractorTests: XCTestCase {
    
    class MockBrandsInteractorOutput: BrandsInteractorOutput {
        var brandsFetchedCalled = false
        var brandsFetchFailedCalled = false

        func brandsFetched(_ brands: [BrandModel]) {
            brandsFetchedCalled = true
        }

        func brandsFetchFailed(_ error: Error) {
            brandsFetchFailedCalled = true
        }
    }

    func testFetchBrands_Success() {
        // Preparación
        let interactor = BrandsInteractor()
        let mockOutput = MockBrandsInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch brands expectation")

        // Prueba
        interactor.fetchBrands()

        // Esperar un tiempo para que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Verificación
            XCTAssertTrue(mockOutput.brandsFetchedCalled, "brandsFetched should be called")
            XCTAssertFalse(mockOutput.brandsFetchFailedCalled, "brandsFetchFailed should not be called")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que la expectativa se cumpla o se agote el tiempo
        wait(for: [expectation], timeout: 2.0)
    }
}
