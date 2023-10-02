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
    
    var body: some View {
        Form {
            HStack {
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.blue)
                Spacer()
            }
            HStack{
                Image(systemName:"envelope")
                // play with the frame and padding here
                TextField("Email Address", text: $email)
            }
            HStack{
                Image(systemName:"lock")
                SecureField("Password", text: $password)
            }
            VStack {
                Spacer(minLength: 20)
                HStack(alignment: .center) {
                    Button(action: {
                        // TODO: Implement login logic
                    }) {
                        Text("Remember me")
                    }
                    Spacer()
                    Button(action: {
                        // TODO: Implement login logic
                    }) {
                        Text("Forgot Password?")
                    }
                }
                Spacer(minLength: 20)
                Button(action: {
                    // TODO: Implement login logic
                }) {
                    Text("Login")
                        .frame(width: 150)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer(minLength: 20)
            }
        }
    }
}

#Preview {
    LoginView()
}
