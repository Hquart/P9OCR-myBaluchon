//
//  FakeResponseData.swift
//  myBaluchonTests
//
//  Created by Naji Achkar on 19/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation

class FakeResponseData {
    
    // MARK: - CORRECT DATA:
    // Creating fake correct data for each API Service to be tested
    static var fixerCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "fixerAPI", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
    static var googleCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "googleAPI", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
    static var openWeatherCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "openWeatherAPI", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
    
    // MARK: - INCORRECT DATA:
    static let incorrectData = "erreur".data(using: .utf8)!
    
    // MARK: - RESPONSE:
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://openclassrooms.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    // MARK: - ERROR:
    class TestError: Error {}
    static let error = TestError()
}
