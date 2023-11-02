/**
 Vista que muestra una lista de categorías y un título.

 La vista `CategoriesView` muestra una lista horizontal de categorías y un título. Las categorías se obtienen a través del ViewModel `CategoriesViewModel`. Incluye un título con un fondo gris claro y un borde negro en la parte superior y derecha.

 - Important: Asegúrate de instanciar el `CategoriesViewModel` y cargar las categorías antes de utilizar esta vista.

 - Note: Utiliza un `ScrollView` horizontal para mostrar las categorías una al lado de la otra.

 - SeeAlso: `CategoriesViewModel` para obtener más información sobre cómo cargar las categorías.
 */
import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var presenter = CategoriesPresenter()

    var body: some View {
        
        VStack {
            Text("categoriesTitle")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            // ScrollView horizontal para mostrar las categorías
            ScrollView(.horizontal) {
                HStack {
                    ForEach(presenter.categories) { category in
                        CategoryView(category: category)
                    }
                }
            }
            .frame(height: 150)
        }
        .overlay(
            // Borde negro en la parte superior y derecha
            RoundedRectangle(cornerRadius: 1)
                .strokeBorder(Color.black, lineWidth: 1)
                .padding([.top, .bottom, .trailing], 0)
        )
        .background(Color.gray.opacity(0.1)) // Fondo gris claro
        .accessibility(identifier: "CategoriesView")
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
