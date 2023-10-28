import XCTest
@testable import coppeltest

final class ProductsViewModelTests: XCTestCase {

    var productsViewModel: ProductsViewModel!
    
    override func setUp() {
        productsViewModel = ProductsViewModel()
    }

    // Caso de prueba para verificar que los productos se cargan después de la inicialización
    func testProductsLoadAfterInitialization() {
        let expectation = XCTestExpectation(description: "Esperar a que se carguen los productos")
        
        DispatchQueue.global(qos: .background).async {
            // Espera un tiempo razonable para que los productos se carguen (ajusta según tu caso)
            Thread.sleep(forTimeInterval: 5)
            
            // Realiza la afirmación una vez que los productos se han cargado
            XCTAssertFalse(self.productsViewModel.products.isEmpty)
            
            // Indica que la expectativa se ha cumplido
            expectation.fulfill()
        }
        
        // Espera hasta que se cumpla la expectativa
        wait(for: [expectation], timeout: 10)
    }
    
    // Caso de prueba para verificar que la lista de productos contiene elementos
    func testProductsListIsNotEmpty() {
        let expectation = XCTestExpectation(description: "Esperar a que se carguen los productos")
        
        DispatchQueue.global(qos: .background).async {
            // Espera un tiempo razonable para que los productos se carguen (ajusta según tu caso)
            Thread.sleep(forTimeInterval: 5)
            
            // Realiza la afirmación una vez que los productos se han cargado
            XCTAssertTrue(!self.productsViewModel.products.isEmpty)
            
            // Indica que la expectativa se ha cumplido
            expectation.fulfill()
        }
        
        // Espera hasta que se cumpla la expectativa
        wait(for: [expectation], timeout: 10)
    }

    // Caso de prueba para verificar que un producto específico está en la lista
    func testProductIsInList() {
        let expectation = XCTestExpectation(description: "Esperar a que se carguen los productos")
        
        DispatchQueue.global(qos: .background).async {
            // Espera un tiempo razonable para que los productos se carguen (ajusta según tu caso)
            Thread.sleep(forTimeInterval: 5)
            
            let productToCheck = ProductModel(id: 1, title: "Product Title", price: 9.99, description: "Product Description", category: "Electronics", image: "https://example.com/image.jpg", rating: ProductModel.RatingModel(rate: 4.5, count: 100))
            
            // Realiza la afirmación una vez que los productos se han cargado
            XCTAssertTrue(self.productsViewModel.products.contains { productModel in
                productModel.id == productToCheck.id
            })
            
            // Indica que la expectativa se ha cumplido
            expectation.fulfill()
        }
        
        // Espera hasta que se cumpla la expectativa
        wait(for: [expectation], timeout: 10) 
    }
}
