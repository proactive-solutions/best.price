//
//  LoginView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 22/09/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        Form {
            ViewFactory.avatarView()
            ViewFactory.emailInputField($viewModel.email)
            ViewFactory.passwordInputField($viewModel.password)
            VStack {
                Spacer(minLength: 20)
                HStack(alignment: .center) {
                    rememberMeButton()
                    Spacer()
                    forgotPasswordButton()
                }
                Spacer(minLength: 20)
                HStack {
                    loginButton()
                    Spacer()
                    signUpButton()
                }
                Spacer(minLength: 20)
            }
        }
    }
}

// private extension for components
private extension LoginView {
    func loginButton() -> some View {
        Button(action: {
            Task {
                do {
                    let result = try await viewModel.signInUser(WithAuthProvider: .credentials)
                    print("Result = ", result, "description = ", result.description, result.user)
                } catch let userSignInError {
                    print("Firebase Error = ", userSignInError)
                }
            }
        }) {
            Text("Login")
                .authButtonDecoration()
        }
        .disabled(!viewModel.isCredentialsValid)
    }

    func signUpButton() -> some View {
        Button(action: {
            Task {
                do {
                    let result = try await viewModel.createUser(withAuthProvider: .credentials)
                    print("Result = ", result, "description = ", result.description)
                } catch let accountCreationError {
                    print("Firebase Error = ", accountCreationError)
                }
            }
        }) {
            Text("Create Account")
                .authButtonDecoration()
        }
        .disabled(!viewModel.isCredentialsValid)
    }

    func rememberMeButton() -> some View {
        Button(action: {
            // TODO: Implement login logic
        }) {
            Text("Remember me")
        }
    }

    func forgotPasswordButton() -> some View {
        Button(action: {
            // TODO: Implement login logic
        }) {
            Text("Forgot Password?")
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
