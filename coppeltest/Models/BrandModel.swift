/**
 Una estructura que representa un modelo de marca con identificador único.

 Esta estructura se utiliza para representar marcas de productos y contiene información sobre el nombre de la marca y una URL de imagen asociada. El identificador único es generado automáticamente.

 - Parameters:
   - brand: La marca de productos que se utilizará para inicializar el modelo.

 - Note: Esta estructura proporciona una forma de representar marcas de productos y sus imágenes asociadas en una aplicación.

 - SeeAlso: `Brand` para ver la enumeración de marcas disponibles.
 */

import Foundation

struct BrandModel: Identifiable {
    
    let id: UUID = UUID() // Identificador único generado automáticamente
    let name: String // Nombre de la marca
    let image: String // URL de la imagen asociada
    
    init(brand: Brand) {
        self.name = brand.rawValue
        switch brand {
            case .apple:
                self.image = "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?202110180743"
            case .samsung:
                self.image = "https://yt3.googleusercontent.com/TtoYXLkyKZu3EDOHAbLjhtpPKwW9eBa0vKacVOmFfq4qzG_Si5KHqzS_u86KO1VIoZJp11scbw=s900-c-k-c0x00ffffff-no-rj"
            case .motorola:
                self.image = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNlkfYn8he4cfrLXRM8O_QiJgIghNF9DjccQ&usqp=CAU"
            case .sony:
                self.image = "https://yt3.googleusercontent.com/trvTsFBmg36XQ4y55jb2eqewRBwAZI4a9AdC6KRoml1OO0nq2Vt6oZn6HukLBIq5yElIoAWDAg=s900-c-k-c0x00ffffff-no-rj"
        }
    }
}
