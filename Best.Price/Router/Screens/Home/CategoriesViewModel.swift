//
//  CategoriesViewModel.swift
//  Best.Price
//
//  Created by Pawan Sharma on 03/12/2024.
//

import FirebaseFirestore
import Foundation
import OSLog
import SwiftUI
import Models

final class CategoriesViewModel: ObservableObject {
  @Published var categories: [ProductCategory] = []

  init() {
    fetchFirestoreCategories()
  }

  private func fetchFirestoreCategories() {
    Task {
      do {
        // Get a reference to Firestore
        let db = Firestore.firestore()
        // Get a reference to the "categories" collection
        let categoriesCollection = db.collection("categories")
        let snapshot = try await categoriesCollection.getDocuments()

        await MainActor.run {
          // Iterate through the documents and extract the data
          categories = snapshot.documents.compactMap { document -> ProductCategory? in
            let data = document.data()
            guard let title = data["title"] as? String,
                  let iconURL = data["icon-url"] as? String
            else { return nil }
            return ProductCategory(title: title, iconURL: iconURL)
          }
        }
      }
    }
  }
}
