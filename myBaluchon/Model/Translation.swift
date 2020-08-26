//
//  Translation.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation

struct Translation: Decodable {
    let data: DataClass
}

struct DataClass: Decodable {
    let translations: [TranslationElement]
}

struct TranslationElement: Decodable {
    let translatedText, detectedSourceLanguage: String
}

