//
//  LoginViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 02/10/23.
//

import Combine
import Foundation
import FirebaseAuth

final class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var emailError: String?
  @Published var passwordError: String?
  @Published var loginError: String?
  @Published var isCredentialsValid = false

  private var cancellables = Set<AnyCancellable>()

  enum AuthenticationProvider {
    case credentials
  }

  init() {
    setupPublishers()
  }

  private func setupPublishers() {
    // Combine email and password validation
    Publishers.CombineLatest($email, $password)
      .map { [weak self] email, password in
        guard let _ = self else { return false }
        return Validator.isValidEmail(email) && Validator.isValidPassword(password)
      }
      .assign(to: \.isCredentialsValid, on: self)
      .store(in: &cancellables)

    // Email validation error handling
    $email
      .dropFirst() // you ignore the first empty value that it gets initialised with
      .debounce(for: 0.3, scheduler: RunLoop.main) // you give the user a bit of time to finish typing
      .removeDuplicates() // you get rid of duplicated inputs as they do not change anything in terms of validation
      .map { [weak self] in
        self?.emailErrorMessage(isValid: Validator.isValidEmail($0)) }
      .assign(to: \.emailError, on: self)
      .store(in: &cancellables)

    // Password validation error handling
    $password
      .dropFirst() // you ignore the first empty value that it gets initialised with
      .debounce(for: 0.3, scheduler: RunLoop.main) // you give the user a bit of time to finish typing
      .removeDuplicates() // you get rid of duplicated inputs as they do not change anything in terms of validation
      .map { [weak self] in
        self?.passwordErrorMessage(isValid: Validator.isValidPassword($0)) }
      .assign(to: \.passwordError, on: self)
      .store(in: &cancellables)
  }

  private func emailErrorMessage(isValid: Bool) -> String? {
    if email.isEmpty { return nil }
    return isValid ? nil : "Email address is not valid."
  }

  private func passwordErrorMessage(isValid: Bool) -> String? {
    if password.isEmpty { return nil }
    return isValid ? nil : "Password must be at least 8 characters."
  }

  func createUser(with provider: AuthenticationProvider) {
    switch provider {
    case .credentials:
      Task {
        do {
          try await Auth.auth().createUser(withEmail: email, password: password)
        } catch let error {
          print(error)
          DispatchQueue.main.async {
            self.loginError = error.localizedDescription
          }
        }
      }
    }
  }

  func signInUser(with provider: AuthenticationProvider) {
    switch provider {
    case .credentials:
      Task {
        do {
          try await Auth.auth().signIn(withEmail: email, password: password)
        } catch let error {
          print(error)
          DispatchQueue.main.async {
            self.loginError = error.localizedDescription
          }
        }
      }
    }
  }
}
