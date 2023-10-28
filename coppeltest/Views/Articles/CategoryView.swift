/**
 Vista que muestra una categoría.

 La vista `CategoryView` se utiliza para mostrar una categoría de productos. Muestra la imagen y el nombre de la categoría. La imagen se carga de forma asíncrona utilizando `AsyncImage`. El nombre de la categoría se obtiene del modelo de datos proporcionado como parámetro.

 - Important: Asegúrate de proporcionar un modelo de datos `CategoryModel` válido con información de la categoría.

 - Parameters:
   - category: Un modelo de datos `CategoryModel` que contiene la información de la categoría a mostrar.

 - Note: La vista utiliza un fondo azul para el nombre de la categoría.

 - SeeAlso: `CategoryModel` para obtener más información sobre el modelo de datos de la categoría.
 */
import SwiftUI

struct CategoryView: View {
    let category: CategoryModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: category.image)) { phase in
                switch phase {
                case .empty:
                    Text("loadingMessage") // Puedes mostrar un mensaje de carga
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                case .failure:
                    Text("failedToLoadImageMessage")
                @unknown default:
                    Text("unknownStateMessage")
                }
            }
            
            Text(category.name)
                .foregroundColor(.blue)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: CategoryModel(category: .electronics))
    }
}
