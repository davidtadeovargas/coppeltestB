/**
 Vista que muestra la imagen de una marca.

 La vista `BrandView` se utiliza para mostrar la imagen de una marca. La imagen se obtiene de un modelo de datos de marca (`BrandModel`) proporcionado como parámetro. La vista utiliza `AsyncImage` para cargar y mostrar la imagen. También proporciona mensajes de carga, error y estado desconocido.

 - Important: Asegúrate de proporcionar un modelo de datos `BrandModel` válido con una URL de imagen para mostrar.

 - Parameters:
   - brand: Un modelo de datos `BrandModel` que contiene la URL de la imagen de la marca.

 - Note: La vista redimensiona y muestra la imagen con un tamaño de 80x80 y bordes redondeados.

 - SeeAlso: `BrandModel` para obtener más información sobre el modelo de datos de la marca.
 */
import SwiftUI

struct BrandView: View {
    let brand: BrandModel // Debes crear un modelo de datos para las marcas que contenga la imagen.

    var body: some View {
        AsyncImage(url: URL(string: brand.image)) { phase in
            switch phase {
            case .empty:
                Text("loadingMessage") // Puedes mostrar un mensaje de carga
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
            case .failure:
                Text("failedToLoadImageMessage")
            @unknown default:
                Text("unknownStateMessage")
            }
        }
    }
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView(brand: BrandModel(brand: .apple))
    }
}
