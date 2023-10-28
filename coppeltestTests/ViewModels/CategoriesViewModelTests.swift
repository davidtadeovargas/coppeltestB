// CategoriesViewModelTests.swift

import XCTest
@testable import coppeltest

final class CategoriesViewModelTests: XCTestCase {

    var categoriesViewModel: CategoriesViewModel!
    
    override func setUp() {
        categoriesViewModel = CategoriesViewModel()
    }

    func testInitialization() {
        XCTAssertFalse(categoriesViewModel.categories.isEmpty)
    }
    
    func testLoadCategories() {
        categoriesViewModel.loadCategories()
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.electronics.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.jewelry.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.mensClothing.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.womensClothing.rawValue
        })
    }

    func testCategoriesContainExpectedCategories() {
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.electronics.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.jewelry.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.mensClothing.rawValue
        })
        XCTAssertTrue(categoriesViewModel.categories.contains { categoryModel in
            categoryModel.name == Category.womensClothing.rawValue
        })
    }
}
