import XCTest
@testable import coppeltest

final class BrandsViewModelTests: XCTestCase {

    var brandsViewModel: BrandsViewModel!
    
    override func setUp() {
        brandsViewModel = BrandsViewModel()
    }

    func testLoadBrands() {
            
        // Arrange
        let expectation = XCTestExpectation(description: "Brands loading completed")

        // Act
        brandsViewModel.loadBrands()

        // Assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Espera un tiempo suficiente para la carga (ajusta según tu lógica)
            XCTAssertTrue(self.brandsViewModel.brands.count > 0, "No se cargaron marcas")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0) // Ajusta el tiempo de espera según sea necesario
    }
}
