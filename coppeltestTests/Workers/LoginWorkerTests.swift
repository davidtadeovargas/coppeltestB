import XCTest
@testable import coppeltest

class LoginWorkerTests: XCTestCase {

    // Define una propiedad para el worker a probar
    var loginWorker: LoginWorker!

    override func setUp() {
        super.setUp()
        // Inicializa el worker antes de cada prueba
        loginWorker = LoginWorker()
    }

    override func tearDown() {
        // Realiza limpieza después de cada prueba si es necesario
        loginWorker = nil
        super.tearDown()
    }

    func testSignInWithValidCredentials() {
        let expectation = XCTestExpectation(description: "Sign in with valid credentials")
        
        // Proporciona credenciales válidas para la prueba
        loginWorker.signIn(email: "coritocorito@hotmail.com", password: "123456789") { result in
            switch result {
            case .success:
                // Verifica que el inicio de sesión con credenciales válidas sea exitoso
                XCTAssertTrue(true, "Sign in with valid credentials should succeed")
            case .failure:
                // La prueba fallará si se obtiene un error en lugar de un éxito
                XCTFail("Sign in with valid credentials should succeed")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testSignInWithInvalidCredentials() {
        let expectation = XCTestExpectation(description: "Sign in with invalid credentials")
        
        // Proporciona credenciales inválidas a propósito
        loginWorker.signIn(email: "invalid@example.com", password: "invalidPassword") { result in
            switch result {
            case .success:
                // La prueba fallará si se obtiene un éxito en lugar de un error
                XCTFail("Sign in with invalid credentials should fail")
            case .failure(let error):
                // Verifica que se obtenga un error (puedes realizar más comprobaciones aquí)
                XCTAssertNotNil(error, "Error should not be nil")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
