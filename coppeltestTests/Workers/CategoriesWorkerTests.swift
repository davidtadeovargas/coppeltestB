import XCTest
@testable import coppeltest

class CategoriesWorkerTests: XCTestCase {
    
    // Define una propiedad para el worker a probar
    var categoriesWorker: CategoriesWorker!

    override func setUp() {
        super.setUp()
        // Inicializa el worker antes de cada prueba
        categoriesWorker = CategoriesWorker()
    }

    override func tearDown() {
        // Realiza limpieza después de cada prueba si es necesario
        categoriesWorker = nil
        super.tearDown()
    }

    func testFetchCategoriesWithSuccess() {
        let expectation = XCTestExpectation(description: "Fetch categories with success")
        
        // Realiza la prueba para verificar la obtención exitosa de categorías
        categoriesWorker.fetchCategories { categories, error in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(categories, "Categories should not be nil")
            
            // Realiza más comprobaciones según tu lógica de negocio
            // Por ejemplo, verifica si la cantidad de categorías es la esperada.
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
