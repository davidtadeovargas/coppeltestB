/**
 Vista que muestra una lista de productos populares y un título.

 La vista `ProductsView` muestra una lista horizontal de productos populares y un título. Los productos se obtienen a través del ViewModel `ProductsViewModel`. Incluye un título con una flecha hacia la derecha y un fondo gris claro.

 - Important: Asegúrate de instanciar el `ProductsViewModel` y cargar los productos antes de utilizar esta vista.

 - Note: Utiliza un `ScrollView` horizontal para mostrar los productos uno al lado del otro.

 - SeeAlso: `ProductsViewModel` para obtener más información sobre cómo cargar los productos.
 */
import SwiftUI

struct ProductsView: View {
    
    @ObservedObject var viewModel = ProductsViewModel() // Un ViewModel para administrar los productos

    var body: some View {
       
        VStack {
            Spacer()

            HStack {
                Text("bestSellersLabel")
                    .font(.system(size: 16))
                    .alignmentGuide(.leading) { d in d[.leading] }
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
            }
            
            Spacer()
            Spacer()

            // ScrollView horizontal para mostrar los productos
            ScrollView(.horizontal) {
                
                HStack(spacing: 2) {
                    ForEach(viewModel.products) { product in
                        ProductView(product: product)
                    }
                }
            }
            .frame(height: 280)
        }
        // Fondo gris claro
        .background(Color.gray.opacity(0.1))
        .accessibility(identifier: "ProductsView")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
