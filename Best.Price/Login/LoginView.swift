//
//  LoginView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 22/09/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    private let loginViewModel = LoginViewModel()

    var body: some View {
        Form {
            avatarView()
            emailInputField()
            passwordInputField()
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
    func avatarView() -> some View {
        HStack {
            Spacer()
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
            Spacer()
        }
    }

    func emailInputField() -> some View {
        HStack {
            Image(systemName: "envelope")
            TextField("Email Address", text: $email)
        }
    }

    func passwordInputField() -> some View {
        HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $password)
        }
    }

    func loginButton() -> some View {
        Button(action: {
            Task {
                do {
                    let result = try await loginViewModel.signInUser(
                        WithAuthProvider: .credentials(
                            email: email,
                            password: password
                        )
                    )
                    print("Result = ", result, "description = ", result.credential, result.user)
                } catch let userSignInError {
                    print("Firebase Error = ", userSignInError)
                }
            }
        }) {
            Text("Login")
                .authDecoration()
        }
    }

    func signUpButton() -> some View {
        Button(action: {
            Task {
                do {
                    let result = try await loginViewModel.createUser(
                        withAuthProvider: .credentials(
                            email: email,
                            password: password
                        )
                    )
                    print("Result = ", result, "description = ", result.description)
                } catch let accountCreationError {
                    print("Firebase Error = ", accountCreationError)
                }
            }
        }) {
            Text("Create Account")
                .authDecoration()
        }
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
    func authDecoration() -> some View {
        padding([.bottom, .top], 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
