/**
 Una vista que muestra una lista de las mejores marcas.

 Esta vista muestra una lista horizontal de las mejores marcas, obtenidas a través del ViewModel `BrandsViewModel`. Proporciona un título, una lista de marcas y un borde decorativo.

 - Important: Asegúrate de instanciar el `BrandsViewModel` y cargar las marcas antes de utilizar esta vista.

 - Note: Esta vista utiliza un `ScrollView` horizontal para mostrar las marcas una al lado de la otra.

 - SeeAlso: `BrandsViewModel` para obtener más información sobre cómo cargar las marcas.
 */
import SwiftUI

struct BrandsView: View {
    
    @ObservedObject var viewModel = BrandsViewModel() // Un ViewModel para administrar las marcas

    var body: some View {
        
        VStack {
            // Título de las mejores marcas
            Text("bestBrandsLabel")
                .font(.system(size: 21))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            // ScrollView horizontal para mostrar las marcas
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(viewModel.brands) { brand in
                        BrandView(brand: brand)
                    }
                }
            }
            .frame(height: 150)
        }
        // Borde decorativo
        .overlay(
            RoundedRectangle(cornerRadius: 1)
                .strokeBorder(Color.black, lineWidth: 1)
                .padding([.top, .bottom, .trailing], 0) // Deja el borde en la parte izquierda sin cambios
        )
        // Fondo gris claro
        .background(Color.gray.opacity(0.1))
        .accessibility(identifier: "BrandsView")
    }
}

struct BrandsView_Previews: PreviewProvider {
    static var previews: some View {
        BrandsView()
    }
}
