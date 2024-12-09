//
//  EmailInputField.swift
//  Best.Price
//
//  Created by Pawan Sharma on 28/10/23.
//

import Foundation
import SwiftUI

/// Represents an email input field.
///
/// This view consists of an `Image` displaying an envelope icon and a `TextField` for entering an email address.
/// The `text` parameter is a `Binding` to the email text.
///
/// - Parameters:
///   - text: A `Binding` to the email text.
///
/// - Returns: A `View` representing the email input field.
struct EmailInputField: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "envelope")
      TextField("Email Address", text: $text)
        .frame(height: 40.0)
        .autocapitalization(.none)
        .keyboardType(.emailAddress)
        .textContentType(.emailAddress)
    }
  }
}

/// Represents a password input field.
///
/// This view consists of an `Image` displaying a lock icon and a `SecureField` for entering a password.
/// The `text` parameter is a `Binding` to the password text.
///
/// - Parameters:
///   - text: A `Binding` to the password text.
///
/// - Returns: A `View` representing the password input field.
struct PasswordInputField: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "lock")
      SecureField("Password", text: $text)
        .frame(height: 40.0)
        .textContentType(.password)
    }
  }
}

/// Represents an avatar.
///
/// This view consists of a centered `Image` displaying a person icon with a circular shape and a blue color.
///
/// - Returns: A `View` representing the avatar.
struct Avatar: View {
  var body: some View {
    HStack {
      Spacer()
      Image(systemName: "person.crop.circle.fill")
        .resizable()
        .frame(width: 150, height: 150, alignment: .center)
        .foregroundColor(.blue)
      Spacer()
    }
  }
}
