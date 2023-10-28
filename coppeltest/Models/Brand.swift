/**
 Una enumeración que representa distintas marcas de dispositivos o productos.

 Esta enumeración permite representar marcas de una manera clara y precisa utilizando valores de cadena.
 
 - Note: Esta enumeración puede ser utilizada en aplicaciones para categorizar y organizar productos o dispositivos según su marca.

 - SeeAlso: `CaseIterable` para obtener una colección de todas las marcas disponibles.
 */
enum Brand: String, CaseIterable {
    case apple
    case samsung
    case motorola
    case sony
}
