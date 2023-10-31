// CategoriesViewModelTests.swift

import XCTest
@testable import coppeltest

final class CategoriesViewModelTests: XCTestCase {

    var categoriesViewModel: CategoriesViewModel!
    
    override func setUp() {
        categoriesViewModel = CategoriesViewModel()
    }

    func testLoadCategories() {
            
        // Arrange
        let expectation = XCTestExpectation(description: "Categories loading completed")

        // Act
        categoriesViewModel.loadCategories()

        // Assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Espera un tiempo suficiente para la carga (ajusta según tu lógica)
            XCTAssertTrue(self.categoriesViewModel.categories.count > 0, "No se cargaron categorías")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0) // Ajusta el tiempo de espera según sea necesario
    }
}
