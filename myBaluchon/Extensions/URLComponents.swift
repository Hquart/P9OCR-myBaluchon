//
//  URLComponents.swift
//  myBaluchon
//
//  Created by Naji Achkar on 04/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation

extension URLComponents {
    // This func will map [String: String] parameters to URLQueryItems
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

