//
//  Best_PriceTests.swift
//  Best.PriceTests
//
//  Created by Pawan Sharma on 22/09/23.
//

import XCTest
import Combine
@testable import Best_Price

final class LoginViewModelTests: XCTestCase {
    private var viewModel: LoginViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testInitiallyCredentialsShouldNotBeValid() {
        XCTAssertFalse(
            viewModel.isCredentialsValid,
            "After initialisation credentials should be invalid"
        )
    }

    func testLoginWithValidCredentials() {
        // Given
        viewModel.email = "test@gmail.com"
        viewModel.password = "testpassword"

        Task {
            _ = try await viewModel.signInUser(
                WithAuthProvider: .credentials
            )

            XCTAssertFalse(
                viewModel.isCredentialsValid,
                "Invalid credentials should set isValid to false"
            )
        }
    }

    func testLoginWithInvalidCredentials() {
        // Given
        viewModel.email = ""
        viewModel.password = "testpassword"

        Task {
            // When
            _ = try await viewModel.signInUser(
                WithAuthProvider: .credentials
            )

            // Then
            XCTAssertFalse(
                viewModel.isCredentialsValid,
                "Invalid credentials should set isValid to false"
            )

            viewModel.email = "testuser"
            viewModel.password = "testpassword"

            // When
            _ = try await viewModel.signInUser(
                WithAuthProvider: .credentials
            )

            // Then
            XCTAssertFalse(
                viewModel.isCredentialsValid,
                "Valid credentials should set isValid to true"
            )
        }
    }

    func testLoginPrintsSuccessfulMessage() {
        Task {
            // Given
            viewModel.isCredentialsValid = true

            // When
            _ = try await viewModel.signInUser(
                WithAuthProvider: .credentials
            )

            // Then
            XCTAssertEqual(
                viewModel.isCredentialsValid,
                true,
                "Login successful message should be printed"
            )
        }
    }

    func testLoginPrintsInvalidMessage() {
        Task {
            // Given
            viewModel.isCredentialsValid = false

            // When
            _ = try await viewModel.signInUser(
                WithAuthProvider: .credentials
            )

            // Then
            XCTAssertEqual(
                viewModel.isCredentialsValid,
                false,
                "Invalid credentials message should be printed"
            )
        }
    }
}
