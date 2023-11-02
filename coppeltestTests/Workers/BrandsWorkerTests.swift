import XCTest
@testable import coppeltest

class BrandsWorkerTests: XCTestCase {
    
    // Define una propiedad para el worker a probar
    var brandsWorker: BrandsWorker!

    override func setUp() {
        super.setUp()
        // Inicializa el worker antes de cada prueba
        brandsWorker = BrandsWorker()
    }

    override func tearDown() {
        // Realiza limpieza después de cada prueba si es necesario
        brandsWorker = nil
        super.tearDown()
    }

    func testFetchBrandsWithSuccess() {
        let expectation = XCTestExpectation(description: "Fetch brands with success")
        
        // Realiza la prueba para verificar la obtención exitosa de marcas
        brandsWorker.fetchBrands { brands, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(brands, "Brands should not be nil")
            
            // Realiza más comprobaciones según tu lógica de negocio
            // Por ejemplo, verifica si la cantidad de marcas es la esperada.
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
