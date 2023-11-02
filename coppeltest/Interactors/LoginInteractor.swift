import Foundation

protocol LoginInteractorInput {
    func signIn(email: String, password: String)
}

protocol LoginInteractorOutput {
    func signInSucceeded()
    func signInFailed(withError error: Error)
}

class LoginInteractor: LoginInteractorInput {
    var output: LoginInteractorOutput?
    private let worker = LoginWorker()

    func signIn(email: String, password: String) {
        worker.signIn(email: email, password: password) { result in
            switch result {
            case .success:
                self.output?.signInSucceeded()
            case .failure(let error):
                self.output?.signInFailed(withError: error)
            }
        }
    }
}

