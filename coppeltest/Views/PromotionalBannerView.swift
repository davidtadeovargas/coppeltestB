import SwiftUI

struct PromotionalBannerView: View {
    var body: some View {
        VStack {
         
            AsyncImage(url: URL(string: "https://images.milled.com/2020-11-25/X2Yy3LM-yp9m6796/pn2AISrVCpaA.jpeg")) { phase in
                switch phase {
                case .empty:
                    Text("loadingMessage") // Puedes mostrar un mensaje de carga
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit) // Rellena todo el espacio
                        .frame(maxWidth: .infinity) // Abarca todo el ancho
                        .border(Color.yellow, width: 2) // Agregar un borde amarillo de 2 puntos
                        
                case .failure:
                    Text("failedToLoadImageMessage")
                @unknown default:
                    Text("unknownStateMessage")
                }
            }
            .padding()
            .background(Color.white) // Fondo blanco
        }
        .accessibilityIdentifier("PromotionalBannerView")
        
    }
}

struct PromotionalBannerView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionalBannerView()
    }
}
