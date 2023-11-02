import XCTest
@testable import coppeltest

class LoginInteractorTests: XCTestCase {
    
    func testSignIn_Success() {
        // Preparación
        let interactor = LoginInteractor()
        let mockOutput = MockLoginInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Sign in success expectation")

        // Prueba
        interactor.signIn(email: "coritocorito@hotmail.com", password: "123456789")

        class MockLoginInteractorOutput: LoginInteractorOutput {
            var signInSucceededCalled = false
            var signInFailedCalled = false
            var error: Error?
            
            func signInSucceeded() {
                signInSucceededCalled = true
            }
            
            func signInFailed(withError error: Error) {
                signInFailedCalled = true
                self.error = error
            }
        }
        
        // Esperar hasta que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
            // Verificación
            XCTAssertTrue(mockOutput.signInSucceededCalled, "signInSucceeded should be called")
            XCTAssertFalse(mockOutput.signInFailedCalled, "signInFailed should not be called")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que se cumpla la expectativa o se agote el tiempo
        wait(for: [expectation], timeout: 10.0)
    }

    
    func testSignIn_Failure() {
        
        class MockLoginInteractorOutput: LoginInteractorOutput {
            var signInSucceededCalled = false
            var signInFailedCalled = false
            var error: Error?

            func signInSucceeded() {
                signInSucceededCalled = true
            }

            func signInFailed(withError error: Error) {
                signInFailedCalled = true
                self.error = error
            }
        }
    
        // Preparación
        let interactor = LoginInteractor()
        let mockOutput = MockLoginInteractorOutput()
        interactor.output = mockOutput

        // Expectativa
        let expectation = XCTestExpectation(description: "Sign in failure expectation")

        // Prueba
        interactor.signIn(email: "test@example.com", password: "incorrect_password")

        // Esperar hasta que se complete la llamada asincrónica
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
            // Verificación
            XCTAssertFalse(mockOutput.signInSucceededCalled, "signInSucceeded should not be called")
            XCTAssertTrue(mockOutput.signInFailedCalled, "signInFailed should be called")
            XCTAssertNotNil(mockOutput.error, "Error should not be nil")

            // Cumplir con la expectativa
            expectation.fulfill()
        }

        // Esperar hasta que se cumpla la expectativa o se agote el tiempo
        wait(for: [expectation], timeout: 10.0)
    }

}
