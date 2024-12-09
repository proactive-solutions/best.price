//
//  NotesView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 04/12/2024.
//

import SwiftUI

struct NotesView: View {
  @Binding var noteText: String
  let fontSize: CGFloat
  let placeholder: String

  private enum Field {
    case textEditor
    case placeholder
  }

  @FocusState private var focusedField: Field?

  var body: some View {
    ZStack(alignment: .topLeading) {
      // TextEditor
      TextEditor(text: $noteText)
        .background(Color.white)
        .border(Color.gray, width: 1)
        .font(.system(size: fontSize, weight: .medium, design: .rounded))
        .focused($focusedField, equals: .textEditor)
        .onAppear {
          focusedField = .textEditor
        }

      // Placeholder
      if noteText.isEmpty {
        TextField(placeholder, text: $noteText)
          .foregroundColor(.gray)
          .padding(.top, 8)
          .padding(.leading, 5)
          .font(.system(size: fontSize, weight: .medium, design: .rounded))
          .autocorrectionDisabled(true)
          .focused($focusedField, equals: .placeholder)
          .onAppear {
            focusedField = .placeholder
          }
          .onDisappear {
            focusedField = .textEditor
          }
      }
    }
    .padding()
  }
}

#Preview {
  NotesView(
    noteText: .constant(""),
    fontSize: 18.0,
    placeholder: "Type your message here..."
  )
  .frame(width: 200, height: 150, alignment: .center)
}
