import XCTest
@testable import coppeltest

final class LoginServiceTests: XCTestCase {

    // Caso de prueba exitoso
    func testLoginServiceSuccess() {
        let loginService = LoginService()
        
        // Usuario y contraseña válidos
        let validEmail = "coritocorito@hotmail.com"
        let validPassword = "123456789"
        
        let expectation = self.expectation(description: "Logging in with valid credentials.")
        
        loginService.signIn(email: validEmail, password: validPassword) { result in
            switch result {
            case .success:
                expectation.fulfill() // Éxito si se inicia sesión correctamente
            case .failure:
                XCTFail("Login should succeed.")
            }
        }
        
        // Espera a que se cumpla la expectativa
        waitForExpectations(timeout: 5, handler: nil)
    }

    // Caso de prueba no exitoso
    func testLoginServiceFailure() {
        let loginService = LoginService()
        
        // Usuario y contraseña no válidos (cualquier valor)
        let invalidEmail = "correo_invalido@hotmail.com"
        let invalidPassword = "contraseña_invalida"
        
        let expectation = self.expectation(description: "Logging in with invalid credentials.")
        
        loginService.signIn(email: invalidEmail, password: invalidPassword) { result in
            switch result {
            case .success:
                XCTFail("Login should fail with invalid credentials.")
            case .failure:
                expectation.fulfill() // Éxito si el inicio de sesión falla con credenciales no válidas
            }
        }
        
        // Espera a que se cumpla la expectativa
        waitForExpectations(timeout: 5, handler: nil)
    }
}
