import SwiftUI

struct BrandsView: View {
    
    @ObservedObject var presenter = BrandsPresenter() 

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
                    ForEach(presenter.brands) { brand in
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
