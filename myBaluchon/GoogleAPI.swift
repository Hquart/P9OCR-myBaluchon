//
//  GoogleAPI.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.

import Foundation

// commentaire test pour git diff  
class GoogleAPI: APIService {
    
    let destinationService = Destination()
    
    var session: URLSession
    private var baseUrl: String = "https://translation.googleapis.com/language/translate/v2?"
    var input: String = "" // text to be translated provided by the TranslationViewController
    
    private var parameters: [String: String] {
        return [
            "key": APIKeys.google,
            "format": "text",
            "q": self.input,
            "target": destinationService.outputLanguageSymbol
        ]
    }
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getTranslation(completion: @escaping((Result<Translation, APIError>)-> Void )) {
        request(baseUrl: baseUrl, parameters: parameters, completion: completion)
    }
}

