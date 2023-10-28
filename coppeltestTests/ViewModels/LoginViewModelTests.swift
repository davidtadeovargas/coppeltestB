import XCTest
@testable import coppeltest

final class coppeltestTests: XCTestCase {

    var loginViewModel: LoginViewModel!
    
    override func setUp() {
        loginViewModel = LoginViewModel()
    }
    
    // Caso de prueba para validar la validación de campos
    func testFieldValidation() {
        // Caso 1: Correo y contraseña válidos
        loginViewModel.email = "test@example.com"
        loginViewModel.password = "password123"
        loginViewModel.validateFields()
        XCTAssertTrue(loginViewModel.isLoginButtonEnabled)
            
        // Caso 2: Correo inválido, contraseña válida
        loginViewModel.email = "invalidemail"
        loginViewModel.validateFields()
        XCTAssertFalse(loginViewModel.isLoginButtonEnabled)
            
        // Caso 3: Correo válido, contraseña vacía
        loginViewModel.email = "test@example.com"
        loginViewModel.password = ""
        loginViewModel.validateFields()
        XCTAssertFalse(loginViewModel.isLoginButtonEnabled)
    }
    
    // Caso de prueba para validar la visibilidad de la contraseña
    func testPasswordVisibility() {
        loginViewModel.isPasswordVisible = false
        loginViewModel.togglePasswordVisibility()
        XCTAssertTrue(loginViewModel.isPasswordVisible)

        loginViewModel.togglePasswordVisibility()
        XCTAssertFalse(loginViewModel.isPasswordVisible)
    }
    
    // Caso de prueba para simular el inicio de sesión exitoso
    func testSuccessfulSignIn() {
        let expectation = XCTestExpectation(description: "Successful sign-in")
        
        loginViewModel.email = "coritocorito@hotmail.com"
        loginViewModel.password = "123456789"
        loginViewModel.signIn { success, errorMessage in
            XCTAssertTrue(success)
            XCTAssertEqual(errorMessage, "")
            expectation.fulfill()
        }
            
        wait(for: [expectation], timeout: 5.0)
    }

    // Caso de prueba para simular el inicio de sesión fallido
    func testFailedSignIn() {
        let expectation = XCTestExpectation(description: "Failed sign-in")
            
        loginViewModel.email = "test@example.com"
        loginViewModel.password = "invalidpassword"
            
        loginViewModel.signIn { success, errorMessage in
            XCTAssertFalse(success)
            XCTAssertNotEqual(errorMessage, "")
            expectation.fulfill()
        }
            
        wait(for: [expectation], timeout: 5.0)
    }
}
