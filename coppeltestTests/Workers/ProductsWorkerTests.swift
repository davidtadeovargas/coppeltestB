import XCTest
@testable import coppeltest

class ProductsWorkerTests: XCTestCase {
    
    // Define una propiedad para el worker a probar
    var productsWorker: ProductsWorker!

    override func setUp() {
        super.setUp()
        // Inicializa el worker antes de cada prueba
        productsWorker = ProductsWorker()
    }

    override func tearDown() {
        // Realiza limpieza después de cada prueba si es necesario
        productsWorker = nil
        super.tearDown()
    }
    
    func testFetchProductsWithValidURL() {
        let expectation = XCTestExpectation(description: "Fetch products with valid URL")
        
        productsWorker.fetchProducts { result in
            switch result {
            case .success(let products):
                // Verifica que se obtengan datos válidos (puedes realizar más comprobaciones aquí)
                XCTAssertFalse(products.isEmpty, "Products array should not be empty")
            case .failure:
                // La prueba fallará si se obtiene un error en lugar de un éxito
                XCTFail("Fetching products with valid URL should succeed")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
