//
//  Validator.swift
//  Best.Price
//
//  Created by Pawan Sharma on 01/12/23.
//

import Foundation

enum Validator {
  static func isValidEmail(_ email: String) -> Bool {
    let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
  }

  static func isValidPassword(_ password: String) -> Bool {
    password.count >= 8
  }
}
