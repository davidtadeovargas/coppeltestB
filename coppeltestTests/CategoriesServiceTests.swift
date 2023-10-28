import XCTest
@testable import coppeltest

final class CategoriesServiceTests: XCTestCase {

    func testFetchCategoriesSuccess() {
        
            // Given
            let categoriesService = CategoriesService()
            let expectation = self.expectation(description: "Fetching categories with success.")
            
            // When
            categoriesService.fetchCategories { categories in
                // Then
                XCTAssertFalse(categories.isEmpty, "Fetched categories should not be empty.")
                expectation.fulfill()
            }
            
            // Wait for the expectation to be fulfilled
            waitForExpectations(timeout: 5, handler: nil)
        }
}
