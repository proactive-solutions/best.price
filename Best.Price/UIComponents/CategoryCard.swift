//
//  CategoryCard.swift
//  Best.Price
//
//  Created by Pawan Sharma on 09/12/24.
//
import SwiftUI

struct CategoryCard: View {
  let category: Category

  var body: some View {
    ZStack {
      Image(category.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 120)
        .padding()

      VStack {
        Spacer()
        Text(category.name)
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
          .frame(alignment: .top)
      }
      .padding(.bottom)
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 2)
  }
}
