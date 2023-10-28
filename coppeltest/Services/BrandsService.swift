import Foundation

class BrandsService {
    
    private var brands: [BrandModel] = [
        BrandModel(brand: .apple),
        BrandModel(brand: .motorola),
        BrandModel(brand: .samsung),
        BrandModel(brand: .sony)
    ]
    
    func fetchBrands(completion: @escaping ([BrandModel]) -> Void) {
        // Simulamos una llamada asincrónica y luego llamamos al bloque de finalización con la lista de marcas.
        DispatchQueue.global().async {
            completion(self.brands)
        }
    }
}

