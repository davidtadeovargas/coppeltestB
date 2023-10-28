import Foundation
import Combine

class SplashViewModel: ObservableObject {
    
    @Published var updateApp = false //Con un metodo se consume del backend para actualizar este valor
}
