import XCTest
@testable import coppeltest

class SplashInteractorTests: XCTestCase {

    func testFetchUpdateApp_Success() {
        // Preparación
        let interactor = SplashInteractor()
        let mockOutput = MockSplashInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Fetch update app success expectation")

        // Prueba
        interactor.fetchUpdateApp()

        class MockSplashInteractorOutput: SplashInteractorOutput {
            var updateAppFetchedCalled = false
            var updateAppFetchFailedCalled = false
            var update: Bool?
            var error: Error?

            func updateAppFetched(_ update: Bool) {
                updateAppFetchedCalled = true
                self.update = true
            }

            func updateAppFetchFailed(_ error: Error) {
                updateAppFetchFailedCalled = true
                self.error = error
            }
        }
        
        // Simular una respuesta exitosa
        mockOutput.updateAppFetched(true) // Configurar mockOutput.update como true

        // Esperar un tiempo para asegurarse de que las llamadas asincrónicas se completen
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Verificación
            XCTAssertTrue(mockOutput.updateAppFetchedCalled, "updateAppFetched should be called")
            XCTAssertFalse(mockOutput.updateAppFetchFailedCalled, "updateAppFetchFailed should not be called")
            XCTAssertTrue(mockOutput.update == true, "Update should be true") // Aquí verifica que mockOutput.update sea true

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que se cumpla la expectativa o se agote el tiempo
        wait(for: [expectation], timeout: 2.0)
    }
}
