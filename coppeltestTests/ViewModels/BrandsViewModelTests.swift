import XCTest
@testable import coppeltest

final class BrandsViewModelTests: XCTestCase {

    var brandsViewModel: BrandsViewModel!
    
    override func setUp() {
        brandsViewModel = BrandsViewModel()
    }

    // Caso de prueba para verificar si la lista de marcas se carga correctamente
    func testLoadBrands() {
        XCTAssertEqual(brandsViewModel.brands.count, 4) // Debe haber 4 marcas de ejemplo en la lista.
    }
    
    // Caso de prueba para verificar si se inicializa la lista de marcas al crear el ViewModel
    func testInitialization() {
        XCTAssertFalse(brandsViewModel.brands.isEmpty) // La lista de marcas no debe estar vacía al inicializar el ViewModel.
    }
    
    // Caso de prueba para verificar si la lista de marcas no está vacía
    func testBrandsNotEmpty() {
        XCTAssertFalse(brandsViewModel.brands.isEmpty) // La lista de marcas no debe estar vacía.
    }
}
