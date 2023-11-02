import Foundation
import Firebase

class LoginPresenter: ObservableObject, LoginInteractorOutput {
    
    @Published var email = "coritocorito@hotmail.com" // Almacena el correo electrónico ingresado por el usuario.
    @Published var password = "123456789" // Almacena la contraseña ingresada por el usuario.
    @Published var isPasswordVisible = false // Indica si la contraseña debe mostrarse o no.
    @Published var isLoginButtonEnabled = false // Indica si el botón de inicio de sesión está habilitado.
    @Published var errorMessage: String = "" // Almacena mensajes de error relacionados con el inicio de sesión.
    @Published var isLoggedIn = false // Propiedad para rastrear el inicio de sesión exitoso.
    @Published var isSigningIn = false // Indica si se está realizando el proceso de inicio de sesión.
    @Published var isMaintenance = false //Con un metodo se consume del backend para actualizar este valor

    var loginCompletion: ((Bool, String) -> Void)?

    private let interactor = LoginInteractor()
    
    init(){
        self.interactor.output = self
    }
    
    func validateFields() {
        let emailIsValid = isValidEmail(email)
        let passwordIsValid = !password.isEmpty

        errorMessage = ""
        
        isLoginButtonEnabled = emailIsValid && passwordIsValid
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        return emailPredicate.evaluate(with: email)
    }
    
    func togglePasswordVisibility() {
        isPasswordVisible.toggle()
    }
    
    //Login methods
    
    func signIn(completion: @escaping (Bool, String) -> Void) {
        
        print("Running signIn() ...")
        
        isSigningIn = true // Indica que se está realizando el inicio de sesión.
        
        self.isSigningIn = false
        
        self.loginCompletion = completion //Guarda el callback para la vista
        
        interactor.signIn(email: email, password: password)
    }
    
    func signInSucceeded() {
        
        print("Running signInSucceeded ...")
        
        //Aquí se podría validar si esta en mantenimiento o no la app
        
        self.isLoggedIn = true
        
        //self.isMaintenance = true
        
        print("isLoggedIn")
        self.loginCompletion!(true, "")
        
    }

    func signInFailed(withError error: Error) {
        print("Error login: \(error)")
        self.loginCompletion!(false, error.localizedDescription)
    }
}
