import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    @ObservedObject private var connectivityViewModel = ConnectivityViewModel.shared
    
    var body: some View {
        
        VStack {
            
            if  !connectivityViewModel.isInternetAvailable {
                ConnectivityNotificationView()
            }
            
            ScrollView(.vertical) {
                
                Spacer() // Espacio en blanco en la parte superior
                
                NavigationLink("", destination: HomeView(), isActive: $viewModel.isLoggedIn)
                
                NavigationLink("", destination: MaintenanceView(), isActive: $viewModel.isMaintenance)
                
                Image("logo_coppel")
                    .resizable()
                    .aspectRatio(contentMode: .fill
                    )
                    .frame(width: 200, height: 100)
                
                Text("Hello")
                    .font(.system(size: 30, weight: .bold))
                    .fontWeight(.semibold)
                    .bold()
                
                Spacer() // Espacio en blanco en la parte superior
                
                Text("SignInWithEmail")
                    .fontWeight(.light)
                
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                
                TextField("EmailPlaceholder", text: $viewModel.email)
                    .textFieldStyle(.plain)
                    .accessibilityIdentifier("EmailTextField")
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray.opacity(0.6)), alignment: .bottom)
                    .onReceive(viewModel.$email) { email in
                        viewModel.validateFields()
                    }
                    .onChange(of: viewModel.email) { newEmail in
                        if newEmail.count > 30 {
                            viewModel.email = String(newEmail.prefix(30))
                        }
                    }
                
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                Spacer() // Espacio en blanco en la parte superior
                
                HStack {
                    
                    if viewModel.isPasswordVisible {
                        TextField("PasswordPlaceholder", text: $viewModel.password)
                        .textFieldStyle(.plain)
                        .accessibilityIdentifier("PasswordTextField")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        .onReceive(viewModel.$password) { password in
                            viewModel.validateFields()
                        }
                        .onChange(of: viewModel.password) { password in
                            if password.count > 10 {
                                viewModel.password = String(password.prefix(10))
                            }
                        }
                        
                    } else {
                        SecureField("PasswordPlaceholder", text: $viewModel.password)
                        .textFieldStyle(.plain)
                        .accessibilityIdentifier("PasswordTextField")
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        .onReceive(viewModel.$password) { password in
                            viewModel.validateFields()
                        }
                        .onChange(of: viewModel.password) { password in
                            if password.count > 10 {
                                viewModel.password = String(password.prefix(10))
                            }
                        }
                    }

                    Spacer() // Espacio flexible para empujar el botón hacia la derecha

                    Button(action: {
                            viewModel.isPasswordVisible.toggle()
                        }) {
                            Image(systemName: viewModel.isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        }
                        .padding(.trailing, 10)
                        .foregroundColor(.black)
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.6))
                
                Text(viewModel.errorMessage)
                    .foregroundColor(.red) // Establece el color del mensaje de error
                    .font(.system(size: 16, weight: .regular))
                    .padding(.top, 5)
                    .accessibility(identifier: "ErrorMessageLogin")
                
                Text("Forgot Password")
                    .foregroundColor(.blue)
                
                Spacer() // Espacio en blanco en la parte superior
                
                Button(action: {
                    viewModel.isSigningIn = true // Habilita la bandera para indicar que se está iniciando sesión
                    viewModel.signIn { success, errorMessage in
                            viewModel.isSigningIn = false // Deshabilita la bandera después de la autenticación
                            if success {
                                
                            } else {
                                // Manejo de errores, muestra un mensaje de error al usuario, por ejemplo.
                                print("Error: \(errorMessage)")
                                
                                // Mostrar el mensaje de error al usuario
                                viewModel.errorMessage = NSLocalizedString("InvalidUserPassword", comment: "Invalid username or password")

                            }
                    }
                    
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isLoginButtonEnabled ? Color(
                            red: Double(0x32) / 255.0,
                            green: Double(0x68) / 255.0,
                            blue: Double(0xA8) / 255.0
                        ) : .gray)
                        .cornerRadius(10)
                }
                .disabled(!viewModel.isLoginButtonEnabled || viewModel.isSigningIn) // Desactiva el botón si no es válido o se está iniciando sesión
                .accessibilityIdentifier("LoginButton")
                
                Text("DoNotHaveAccount")
                    .font(.system(size: 20, weight: .bold))
                    .fontWeight(.semibold)
                    .bold()
                
                Button(action: {
                    // Acción para el botón de inicio de sesión
                }) {
                    Text("Create an Account")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .border(Color.blue, width: 1)
                        .cornerRadius(4)
                }
                
                Spacer()
            }
        }
        .background(Color.white)
        .padding()
        .onAppear {
            self.connectivityViewModel.shouldCheckConnectivity = true //Vuelve a checar conexión a internet
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

