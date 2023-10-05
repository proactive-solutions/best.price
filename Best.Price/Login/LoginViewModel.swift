//
//  LoginViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 02/10/23.
//

import Foundation
import FirebaseAuth

final class LoginViewModel {
    enum AuthenticationProvider {
        case credentials(email: String, password: String)
    }
    
    func authenticWith(provider: AuthenticationProvider) async throws -> AuthDataResult {
        switch provider {
        case let .credentials(email, password):
            return try await Auth.auth().createUser(withEmail: email, password: password)
        }
    }
}

