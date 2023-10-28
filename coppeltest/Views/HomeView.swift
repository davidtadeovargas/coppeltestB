    import SwiftUI

    struct HomeView: View {
        
        @ObservedObject private var viewModel = HomeViewModel()
        
        init(viewModel: HomeViewModel) {
            self.viewModel = viewModel
        }
        
        var body: some View {
            VStack {
                
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
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
            }
            .background(Color.gray.opacity(0.1))
            .accessibility(identifier: "HomeView")
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel() // Crea una instancia del viewModel con el estado deseado
        return HomeView(viewModel: viewModel)
    }
}
