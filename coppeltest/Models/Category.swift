/**
 Una enumeración que representa diferentes categorías de productos.

 Esta enumeración se utiliza para categorizar productos en diferentes grupos o categorías. Cada caso de la enumeración representa una categoría de producto y se almacena como una cadena.

 - Note: Puedes utilizar esta enumeración para organizar y clasificar productos según su categoría en tu aplicación.

 - SeeAlso: `CaseIterable` para obtener una colección de todas las categorías disponibles.
 */
enum Category: String, CaseIterable {
    case electronics
    case jewelry
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
}
