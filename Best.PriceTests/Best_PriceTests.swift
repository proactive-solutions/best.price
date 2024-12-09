//
//  Best_PriceTests.swift
//  Best.PriceTests
//
//  Created by Pawan Sharma on 22/09/23.
//

import XCTest
@testable import Best_Price
import Models

final class Best_PriceTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testProductCategoryInitialization() {
    // Arrange
    let title = "Electronics"
    let iconURL = "https://example.com/icon.png"

    // Act
    let category = ProductCategory(
      title: title,
      iconURL: iconURL
    )
    
    // Assert
    XCTAssertEqual(
      category.title,
      title,
      "The title should match the input value."
    )
    XCTAssertEqual(
      category.iconURL,
      iconURL,
      "The iconURL should match the input value."
    )
  }

  func testProductCategoryWithEmptyValues() {
    // Arrange
    let title = ""
    let iconURL = ""

    // Act
    let category = ProductCategory(
      title: title,
      iconURL: iconURL
    )

    // Assert
    XCTAssertEqual(
      category.title,
      title,
      "The title should be an empty string."
    )
    XCTAssertEqual(
      category.iconURL,
      iconURL,
      "The iconURL should be an empty string."
    )
  }
}
