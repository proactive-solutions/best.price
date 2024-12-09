//
//  Logger+Extension.swift
//  Best.Price
//
//  Created by Pawan Sharma on 05/12/2024.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
    static let general = Logger(subsystem: subsystem, category: "general")
}
