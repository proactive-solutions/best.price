//
//  LoginViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 02/10/23.
//

import Foundation
final class LoginViewModel {
    enum LoginMethod {
        case gmail
        case apple
        case credentials(email: String, password: String)
    }
    
    func login(with method: LoginMethod) async throws {
        switch method {
        case .apple:
            break

        case .gmail:
            break

        case .credentials:
            break
        }
    }
}
