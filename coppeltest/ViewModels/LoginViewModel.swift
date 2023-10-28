/**
 Una clase de ViewModel que administra las interacciones y validaciones relacionadas con el inicio de sesión.

 Esta clase de ViewModel se utiliza para gestionar la lógica de inicio de sesión, incluida la validación de campos, el seguimiento del estado de inicio de sesión y la capacidad de mostrar u ocultar la contraseña. Proporciona propiedades publicadas para rastrear el estado del inicio de sesión y mensajes de error, y métodos para validar campos y realizar el inicio de sesión.

 - Important: Asegúrate de inicializar esta clase antes de usarla y utilizar sus propiedades y métodos para interactuar con la lógica de inicio de sesión.

 - SeeAlso: `Auth` y `Firebase` para más información sobre Firebase Authentication.
 */
import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var email = "coritocorito@hotmail.com" // Almacena el correo electrónico ingresado por el usuario.
    @Published var password = "123456789" // Almacena la contraseña ingresada por el usuario.
    @Published var isPasswordVisible = false // Indica si la contraseña debe mostrarse o no.
    @Published var isLoginButtonEnabled = false // Indica si el botón de inicio de sesión está habilitado.
    @Published var errorMessage: String = "" // Almacena mensajes de error relacionados con el inicio de sesión.
    @Published var isLoggedIn = false // Propiedad para rastrear el inicio de sesión exitoso.
    @Published var isSigningIn = false // Indica si se está realizando el proceso de inicio de sesión.
    @Published var isMaintenance = false //Con un metodo se consume del backend para actualizar este valor

    private let loginService = LoginService()
    /**
     Valida los campos de correo electrónico y contraseña para habilitar el botón de inicio de sesión.

     - Important: Esta función valida si el correo electrónico es válido y si la contraseña no está vacía. Si ambos son válidos, se habilita el botón de inicio de sesión. Si no, se deshabilita y se pueden mostrar mensajes de error.

     - SeeAlso: `isValidEmail(_:)` para ver la validación de correo electrónico.
     */
    func validateFields() {
        let emailIsValid = isValidEmail(email)
        let passwordIsValid = !password.isEmpty

        errorMessage = ""
        
        isLoginButtonEnabled = emailIsValid && passwordIsValid
    }
    
    /**
     Valida si un correo electrónico es válido.

     - Parameter email: El correo electrónico que se va a validar.

     - Returns: `true` si el correo electrónico es válido, de lo contrario, `false`.
     */
    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        return emailPredicate.evaluate(with: email)
    }
    
    /**
     Alterna la visibilidad de la contraseña.
     
     Cuando se llama a esta función, cambia la visibilidad de la contraseña entre visible e invisible.

     */
    func togglePasswordVisibility() {
        isPasswordVisible.toggle()
    }
    
    /**
     Realiza el proceso de inicio de sesión.

     - Parameter completion: Un cierre que se llama después de intentar el inicio de sesión. Proporciona un booleano que indica si el inicio de sesión fue exitoso y un mensaje de error si no lo fue.

     - Important: Esta función utiliza Firebase Authentication para realizar el inicio de sesión con el correo electrónico y la contraseña proporcionados por el usuario. Llama al cierre de finalización con los resultados del inicio de sesión.

     - SeeAlso: `Firebase` y `Auth` para más información sobre Firebase Authentication.
     */
    func signIn(completion: @escaping (Bool, String) -> Void) {
        
        print("Running signIn() ...")
        
        isSigningIn = true // Indica que se está realizando el inicio de sesión.
        
        loginService.signIn(email: email, password: password) { result in
            
            print("Running signIn ...")
            
            // El inicio de sesión fue exitoso
            self.isSigningIn = false // Marca el final del proceso de inicio de sesión.
            
            switch result {
            case .success:
                
                //Aquí se podría validar si esta en mantenimiento o no la app
                
                self.isLoggedIn = true
                
                //self.isMaintenance = true
                
                print("isLoggedIn")
                completion(true, "")
                
            case .failure(let error):
                print("error \(error)")
                completion(false, error.localizedDescription)
            }
        }
    }
}
