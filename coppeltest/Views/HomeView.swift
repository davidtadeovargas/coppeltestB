    import SwiftUI

    struct HomeView: View {
        
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
        return HomeView()
    }
}
