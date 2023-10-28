/**
 Una estructura que representa un modelo de producto con identificador único.

 Esta estructura se utiliza para representar información sobre un producto, incluyendo su identificador único, título, precio, descripción, categoría, imagen y calificación. La calificación se representa utilizando un modelo de datos separado.

 - Parameters:
   - id: El identificador único del producto.
   - title: El título del producto.
   - price: El precio del producto.
   - description: La descripción detallada del producto.
   - category: La categoría a la que pertenece el producto.
   - image: La URL de la imagen del producto.
   - rating: El modelo de calificación que incluye la tasa de calificación y el recuento de calificaciones.

 - Note: Esta estructura se utiliza para representar productos en una aplicación y proporciona información detallada sobre cada producto, incluyendo su calificación. El identificador único se utiliza para identificar de forma exclusiva cada producto.
g - SeeAlso: `RatingModel` para ver el modelo de calificación asociado.
 */
struct ProductModel: Identifiable, Codable {
    
    let id: Int // Identificador único del producto
    let title: String // Título del producto
    let price: Double // Precio del producto
    let description: String // Descripción detallada del producto
    let category: String // Categoría del producto
    let image: String // URL de la imagen del producto
    let rating: RatingModel // Modelo de calificación del producto
    
    /**
     Un modelo de datos que representa la calificación de un producto.
     
     - Parameters:
       - rate: La tasa de calificación del producto.
       - count: El recuento de calificaciones del producto.
     
     - Note: Este modelo de datos se utiliza para representar la calificación de un producto, incluyendo la tasa de calificación y el recuento de calificaciones.
     */
    struct RatingModel: Codable {
        let rate: Double // Tasa de calificación del producto
        let count: Int // Recuento de calificaciones del producto
    }
}
