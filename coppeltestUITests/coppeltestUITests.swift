import XCTest
import SwiftUI

class coppeltestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testMissingFields() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let emailTextField = app.textFields["EmailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 15))

        // Espera a que el campo de texto sea seleccionable
        let isSelectable = emailTextField.waitForExistence(timeout: 5) // Puedes ajustar el tiempo límite según sea necesario

        if isSelectable {
            // Borrar el contenido del campo de texto
            emailTextField.tap()
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
        } else {
            XCTFail("El campo de correo electrónico no es seleccionable.")
        }
        
        let passwordTextField = app.secureTextFields["PasswordTextField"]
        XCTAssert(passwordTextField.exists)
        
        let loginButton = app.buttons["LoginButton"]
        XCTAssert(loginButton.exists)
        
        //El botón de iniciar sesión debe estar deshabilitado por que falta el campo de correo de llenarse o de sintaxis
        XCTAssertTrue(!loginButton.isEnabled)
    }

    func testSuccessfulLogin() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let emailTextField = app.textFields["EmailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 15))
        
        let passwordTextField = app.secureTextFields["PasswordTextField"]
        XCTAssert(passwordTextField.exists)
        
        // Realiza el inicio de sesión tocando el botón de inicio de sesión.
        let loginButton = app.buttons["LoginButton"]
        XCTAssert(loginButton.exists)
        
        // Ejecuta la acción de tocar el botón
        loginButton.tap()
    
        // Espera a que aparezca un elemento específico de HomeView
        let homeViewElement = app.otherElements["HomeView"]
        XCTAssertTrue(homeViewElement.waitForExistence(timeout: 15))
    }
    
    func testNotSuccessfulLogin() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        let emailTextField = app.textFields["EmailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 15))

        // Espera a que el campo de texto sea seleccionable
        let isSelectable = emailTextField.waitForExistence(timeout: 5) // Puedes ajustar el tiempo límite según sea necesario

        if isSelectable {
            // Borrar el contenido del campo de texto
            emailTextField.tap()
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("\u{8}")
            emailTextField.typeText("corito@hotmail.com")
        } else {
            XCTFail("El campo de correo electrónico no es seleccionable.")
        }
        
        let passwordTextField = app.secureTextFields["PasswordTextField"]
        XCTAssert(passwordTextField.exists)
        
        // Realiza el inicio de sesión tocando el botón de inicio de sesión.
        let loginButton = app.buttons["LoginButton"]
        XCTAssert(loginButton.exists)

        // Ejecuta la acción de tocar el botón
        loginButton.tap()

        // Crea una expectativa para verificar el mensaje de error
        let errorMessageExpectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: "label != ''"),
            object: app.staticTexts["ErrorMessageLogin"]
        )

        // Espera hasta que la expectativa se cumpla o se alcance el tiempo límite
        let result = XCTWaiter().wait(
            for: [errorMessageExpectation],
            timeout: 5  // Ajusta el tiempo límite según sea necesario
        )

        // Verifica si la expectativa se cumplió
        if result == .completed {
            // El mensaje de error no está vacío, lo que indica un inicio de sesión no exitoso
            print("Login no exitoso.")
        } else {
            // La expectativa no se cumplió a tiempo o el mensaje de error no está vacío
            XCTFail("Inicio de sesión correcto")
        }
    }

    func testTransitionToHome() throws {
        
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()
        
        // Accede a los campos de correo electrónico y contraseña y escribe valores válidos.
        let emailTextField = app.textFields["EmailTextField"]
        XCTAssertTrue(emailTextField.waitForExistence(timeout: 15))
        
        let passwordTextField = app.secureTextFields["PasswordTextField"]
        XCTAssert(passwordTextField.exists)
        
        // Realiza el inicio de sesión tocando el botón de inicio de sesión.
        let loginButton = app.buttons["LoginButton"]
        XCTAssert(loginButton.exists)

        sleep(2)
        
        // Ejecuta la acción de tocar el botón
        loginButton.tap()

        // Verifica la transición a la vista de inicio de la aplicación.
        XCTAssertTrue(app.otherElements["HomeView"].waitForExistence(timeout: 5))
    }
}
