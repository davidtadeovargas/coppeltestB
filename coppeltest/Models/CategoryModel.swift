/**
 Una estructura que representa un modelo de categoría con identificador único.

 Esta estructura se utiliza para representar categorías de productos y contiene información sobre el nombre de la categoría y una URL de imagen asociada. El identificador único es generado automáticamente.

 - Parameters:
   - category: La categoría de productos que se utilizará para inicializar el modelo.

 - Note: Esta estructura proporciona una forma de representar categorías de productos y sus imágenes asociadas en una aplicación. Puedes utilizar un ID único para cada categoría si es necesario.

 - SeeAlso: `Category` para ver la enumeración de categorías disponibles.
 */

import Foundation

struct CategoryModel: Identifiable {
    
    let id: UUID = UUID() // Identificador único generado automáticamente
    let name: String // Nombre de la categoría
    let image: String // URL de la imagen asociada
    
    init(category: Category) {
        self.name = category.rawValue
        switch category {
            case .electronics:
                self.image = "https://superior-electronics.com/website/wp-content/uploads/2021/05/PlurimarcaA.jpg"
            case .jewelry:
                self.image = "https://cocojewelery.com/wp-content/uploads/2022/10/2-5.png"
            case .mensClothing:
                self.image = "https://n.nordstrommedia.com/id/95b689e1-64b7-400e-b6a1-df34e4485574.jpeg?h=500&w=500"
            case .womensClothing:
                self.image = "https://n.nordstrommedia.com/id/4288533e-82e2-45ac-897c-1ab7da8d756d.jpeg?h=500&w=500"
        }
    }
}
