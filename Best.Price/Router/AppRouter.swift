//
//  AppRouter.swift
//  Best.Price
//
//  Created by Pawan Sharma on 05/12/2024.
//

import Foundation
import SwiftUI

final class AppRouter: ObservableObject {
  fileprivate enum Route {
    case unAuthenticatedUser
    case authenticatedUser
  }

  @Published fileprivate var currentRoute: Route = .unAuthenticatedUser

  func navigateToHome() {
    currentRoute = .authenticatedUser
  }

  func navigateToLogin() {
    currentRoute = .unAuthenticatedUser
  }
}

extension Best_PriceApp {
  @ViewBuilder
  func contentView() -> some View {
    switch router.currentRoute {
    case .authenticatedUser:
      CategoriesView()
    case .unAuthenticatedUser:
      LoginView()
    }
  }
}
