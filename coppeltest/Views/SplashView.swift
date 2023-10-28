import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel = SplashViewModel()
    
    @State private var showLogin = false
    
    var body: some View {
        
        if showLogin {
            NavigationView {
                LoginView()
            }
        } else {
            
            if !viewModel.updateApp {
                
                // Muestra una imagen de inicio. Asegúrate de reemplazar "logo_coppel" con el nombre de tu propia imagen.
                Image("logo_coppel")
                    .resizable() // Permite redimensionar la imagen.
                    .aspectRatio(contentMode: .fit) // Ajusta la imagen al tamaño del marco.
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ocupa todo el espacio disponible en la pantalla.
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showLogin = true
                            }
                        }
                    }
            } else {
             
                // Muestra una imagen de inicio. Asegúrate de reemplazar "logo_coppel" con el nombre de tu propia imagen.
                Image("logo_coppel")
                    .resizable() // Permite redimensionar la imagen.
                    .aspectRatio(contentMode: .fit) // Ajusta la imagen al tamaño del marco.
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ocupa todo el espacio disponible en la pantalla.
                .alert(isPresented: $viewModel.updateApp) {
                    Alert(
                        title: Text("Nueva versión disponible"),
                        message: Text("Hay una nueva versión de la aplicación disponible. Por favor, actualiza para seguir utilizando la aplicación."),
                        primaryButton: .default(Text("Actualizar")) {
                            // Redirigir al usuario a la App Store para que actualice la aplicación
                            if let url = URL(string: "URL_DE_LA_APP_EN_LA_APP_STORE") {
                                UIApplication.shared.open(url)
                            }
                        },
                        secondaryButton: .cancel(Text("Salir")) {
                            // Aquí puedes cerrar la aplicación si el usuario decide no actualizar
                            exit(0)
                        })}
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        // Muestra una vista de previsualización de SplashView.
        SplashView()
    }
}
