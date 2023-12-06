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
    @Published var isCredentialsValid = false
    
    private var cancellables = Set<AnyCancellable>()

    enum AuthenticationProvider {
        case credentials
    }
    
    init() {
        // Combine the username and password to determine if the login is valid
        Publishers.CombineLatest($email, $password)
            .map { [weak self] username, password in
                guard let self else { return false }
                return Validator.isValidEmail(self.email) && Validator.isValidPassword(self.password)
            }
            .assign(to: \.isCredentialsValid, on: self)
            .store(in: &cancellables)
    }
    
    func createUser(withAuthProvider provider: AuthenticationProvider) async throws -> AuthDataResult {
        switch provider {
        case .credentials:
            return try await Auth.auth().createUser(withEmail: email, password: password)
        }
    }
    
    func signInUser(WithAuthProvider provider: AuthenticationProvider) async throws -> AuthDataResult {
        switch provider {
        case .credentials:
            return try await Auth.auth().signIn(withEmail: email, password: password)
        }
    }
}
