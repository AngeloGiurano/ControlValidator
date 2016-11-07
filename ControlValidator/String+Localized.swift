//
//  String+Localized.swift
//  ControlValidator
//
//  Created by Angelo Giurano on 11/7/16.
//
//

import Foundation

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
