//
//  LoginView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 22/09/23.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel = LoginViewModel()
  @EnvironmentObject var router: AppRouter

  var body: some View {
    NavigationStack {
      Form {
        Section {
          VStack(alignment: .leading) {
            EmailInputField(text: $viewModel.email)
            if let emailError = viewModel.emailError {
              Text(emailError)
                .foregroundColor(.red)
            }
          }
          
          VStack(alignment: .leading) {
            PasswordInputField(text: $viewModel.password)
            if let passwordError = viewModel.passwordError {
              Text(passwordError)
                .foregroundColor(.red)
            }
          }
        }
        Section {
          VStack {
            Spacer(minLength: 20)
            HStack {
              loginButton()
              Spacer()
              signUpButton()
            }
            Spacer(minLength: 20)
            if let loginError = viewModel.loginError {
              Text(loginError)
                .foregroundColor(.red)
            }
          }
        }
      }
    }
  }
}

// private extension for components
private extension LoginView {
  func loginButton() -> some View {
    Button(action: {
      // self.viewModel.signInUser(with: .credentials)
      router.navigateToHome()
    }) {
      Text("Login")
        .authButtonDecoration()
    }
  }

  func signUpButton() -> some View {
    Button(action: {
      // self.viewModel.createUser(with: .credentials)
      router.navigateToHome()
    }) {
      Text("Create Account")
        .authButtonDecoration()
    }
  }
}

private extension View where Self == Text {
  func authButtonDecoration() -> some View {
    padding([.bottom, .top], 10)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(.white)
      .background(Color.blue)
      .cornerRadius(10)
  }
}
