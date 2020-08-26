//
//  FixerAPI.swift
//  myBaluchon
//
//  Created by Naji Achkar on 04/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation

class FixerAPI: APIService {
    
    let destinationService = Destination()
    
    var session: URLSession
    private var baseUrl: String = "http://data.fixer.io/api/latest"
    private var inputCurrency = "EUR"
    
    var parameters: [String: String] {
        return [
            "access_key": APIKeys.fixer,
            "base": inputCurrency,
            "symbols": destinationService.outputCurrency
        ]
    }
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
   
    func getRate(completion: @escaping((Result<ExchangeRate, APIError>)-> Void )) {
        request(baseUrl: baseUrl, parameters: parameters, completion: completion)
    }
}



