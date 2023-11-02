import XCTest
@testable import coppeltest

class HomeInteractorTests: XCTestCase {

    class MockHomeInteractorOutput: HomeInteractorOutput {
        var isBannerVisibleFetchedCalled = false
        var isBannerVisibleFetchFailedCalled = false
        var visible: Bool?
        var error: Error?

        func isBannerVisibleFetched(_ visible: Bool) {
            isBannerVisibleFetchedCalled = true
            self.visible = visible
        }

        func isBannerVisibleFetchFailed(_ error: Error) {
            isBannerVisibleFetchFailedCalled = true
            self.error = error
        }
    }
    
    func testFetchIsBannerVisible_Success() {
        // Preparación
        let interactor = HomeInteractor()
        let mockOutput = MockHomeInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch is banner visible success expectation")

        // Prueba
        interactor.fetchIsBannerVisible()

        // Esperar hasta que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Verificación
            XCTAssertTrue(mockOutput.isBannerVisibleFetchedCalled, "isBannerVisibleFetched should be called")
            XCTAssertFalse(mockOutput.isBannerVisibleFetchFailedCalled, "isBannerVisibleFetchFailed should not be called")
            XCTAssertTrue(mockOutput.visible == true, "Visible should be true")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que se cumpla la expectativa o se agote el tiempo
        wait(for: [expectation], timeout: 2.0)
    }
}
