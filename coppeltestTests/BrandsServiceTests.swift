import XCTest
@testable import coppeltest

final class BrandsServiceTests: XCTestCase {

    func testFetchBrandsSuccess() {
        
            // Given
            let service = BrandsService()
            let expectation = self.expectation(description: "Fetching brands successfully.")
            
            // When
            service.fetchBrands { brands in
                // Ensure that the fetched brands are not empty
                XCTAssertFalse(brands.isEmpty, "Fetched brands should not be empty.")
                expectation.fulfill()
            }
            
            // Wait for the expectation to be fulfilled
            waitForExpectations(timeout: 5, handler: nil)
        }
}
