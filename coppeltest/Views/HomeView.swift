    import SwiftUI

    struct HomeView: View {
        
        @ObservedObject private var viewModel = HomeViewModel()
        @ObservedObject var connectivityViewModel = ConnectivityViewModel.shared
        
        var body: some View {
            VStack {
                Spacer()
                if !ProcessInfo.processInfo.arguments.contains("isRunningUITests") {
                    // Prepare application for UI tests.
                    
                    ScrollView(.vertical) {
                        
                        CategoriesView()
                            .padding()
                        
                        ProductsView()
                            .padding()
                        
                        BrandsView()
                            .padding()
                        
                    }
                    .background(Color.gray.opacity(0.1))
                    
                    if viewModel.isBannerVisible {
                        PromotionalBannerView()
                            .onTapGesture {
                                // Ocultar el banner cuando se toque
                                viewModel.isBannerVisible = false
                            }
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
            }
            .background(Color.gray.opacity(0.1))
            .accessibility(identifier: "HomeView")
            .onAppear { //Aqui ya no debe de consultar la conexión a internet
                self.connectivityViewModel.shouldCheckConnectivity = false
            }
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        return HomeView()
    }
}
