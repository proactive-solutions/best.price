//
//  CategoriesView.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import SwiftUI

struct Category: Identifiable {
  let id = UUID()
  let name: String
  let image: String
}

struct CategoriesView: View {
  let categories = [
    Category(name: "Home care", image: "homecare"),
    Category(name: "Beverages", image: "beverages"),
    Category(name: "Personal care", image: "personalcare"),
    Category(name: "Rice, Atta & Dals", image: "grains"),
    Category(name: "Packaged Foods & Dry Fruits", image: "packaged"),
    Category(name: "Oil, Sugar & Masalas", image: "oil"),
    Category(name: "Dairy, Fresh & Frozen", image: "dairy"),
    Category(name: "Luggage & Apparel", image: "luggage")
  ]

  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        // Header
        HStack {
          Spacer()
          Text("Categories")
            .font(.subheadline)
          Spacer()
          Button(action: {}) {
            Image(systemName: "magnifyingglass")
              .font(.subheadline)
          }
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)

        // Grid
        ScrollView {
          LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
          ], spacing: 16) {
            ForEach(categories) { category in
              CategoryCard(category: category)
            }
          }
          .padding()
        }

        // Bottom Navigation
        HStack(spacing: 0) {
          NavigationLink(destination: EmptyView()) {
            BottomNavItem(icon: "house", text: "Home")
          }
          NavigationLink(destination: EmptyView()) {
            BottomNavItem(icon: "square.grid.2x2", text: "Categories")
          }
          NavigationLink(destination: EmptyView()) {
            BottomNavItem(icon: "person", text: "Login Now!")
          }
          NavigationLink(destination: EmptyView()) {
            BottomNavItem(icon: "percent", text: "Offers")
          }
          NavigationLink(destination: EmptyView()) {
            BottomNavItem(icon: "questionmark.circle", text: "Help")
          }
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(radius: 2)
      }
    }
  }
}

struct BottomNavItem: View {
  let icon: String
  let text: String

  var body: some View {
    VStack(spacing: 4) {
      Image(systemName: icon)
        .font(.system(size: 20))
      Text(text)
        .font(.system(size: 12))
    }
    .frame(maxWidth: .infinity)
    .foregroundColor(.blue)
  }
}

#Preview {
  CategoriesView()
}
