import XCTest
@testable import coppeltest

final class ProductServiceTests: XCTestCase {

    func testFetchProductsSuccess() {
        // Given
        let productService = ProductService()
        let expectation = self.expectation(description: "Fetching products successfully.")
        
        // When
        productService.fetchProducts { result in
            switch result {
            case .success(let products):
                // Then
                XCTAssertFalse(products.isEmpty)
                expectation.fulfill()
            case .failure:
                XCTFail("Fetching products should not fail.")
            }
        }
        
        // Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 5, handler: nil)
    }
}
