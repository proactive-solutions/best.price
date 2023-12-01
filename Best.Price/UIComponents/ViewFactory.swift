//
//  EmailInputField.swift
//  Best.Price
//
//  Created by Pawan Sharma on 28/10/23.
//

import Foundation
import SwiftUI

enum ViewFactory {
    static func emailInputField(_ text: Binding<String>) -> some View {
        HStack {
            Image(systemName: "envelope")
            TextField("Email Address", text: text)
        }
    }
    
    static func passwordInputField(_ text: Binding<String>) -> some View {
        HStack {
            Image(systemName: "lock")
            SecureField("Password", text: text)
        }
    }
    
    static func avatarView() -> some View {
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
