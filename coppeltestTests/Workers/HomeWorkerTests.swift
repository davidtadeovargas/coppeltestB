import XCTest
@testable import coppeltest

class HomeWorkerTests: XCTestCase {

    func testFetchIsBannerVisible() {
        // Preparación
        let worker = HomeWorker()

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch banner visibility expectation")

        // Prueba
        worker.fetchIsBannerVisible { isVisible, error in
            // Verificación
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(isVisible, "Visibility should not be nil")
            XCTAssertTrue(isVisible == true, "Banner should be visible")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que la expectativa se cumpla o se agote el tiempo
        wait(for: [expectation], timeout: 1.0)
    }
}
