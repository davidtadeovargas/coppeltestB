/**
 Vista que muestra un producto.

 La vista `ProductView` se utiliza para mostrar los detalles de un producto, incluyendo su imagen, título, descripción y precio. La imagen del producto se carga de forma asíncrona utilizando `AsyncImage`. Los detalles del producto se obtienen del modelo de datos proporcionado como parámetro.

 - Important: Asegúrate de proporcionar un modelo de datos `ProductModel` válido con información del producto.

 - Parameters:
   - product: Un modelo de datos `ProductModel` que contiene la información del producto a mostrar.

 - Note: La vista recorta el título y la descripción para que no excedan los primeros 25 caracteres y muestra el precio en formato de moneda con dos decimales.

 - SeeAlso: `ProductModel` para obtener más información sobre el modelo de datos del producto.
 */
import SwiftUI

struct ProductView: View {
    
    let product: ProductModel

    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    Text("loadingMessage") // Puedes mostrar un mensaje de carga
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        
                case .failure:
                    Text("failedToLoadImageMessage")
                @unknown default:
                    Text("unknownStateMessage")
                }
            }
            .padding()
            .background(Color.white) // Fondo blanco
            
            Text(String(product.title.prefix(25)))
                .font(.headline)
                .padding(.top, 5)
                .padding(.leading,5)
                .padding(.trailing,5)
                .multilineTextAlignment(.leading)

            Text(String(product.description.prefix(25)))
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.leading,5)
                .padding(.trailing,5)

            Text("price: $\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.green)
                .padding(.bottom, 5)
                .multilineTextAlignment(.leading)

            Button(action: {
                // Agregar lógica para agregar al carrito (por ahora, puede ser solo visual)
            }) {
                Image(systemName: "cart")
            }
            
            Spacer()
        }
        .background(Color.white) // Fondo blanco
        .padding()
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ProductModel(
            id: 1,
            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            price: 109.95,
            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            category: "men's clothing",
            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            rating: ProductModel.RatingModel(rate: 3.9, count: 120)
        )   )
    }
}
