//
//  ComputedPropertiesTestCase.swift
//  myBaluchonTests
//
//  Created by Naji Achkar on 20/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

@testable import myBaluchon
import XCTest

class DestinationTestCase: XCTestCase {
    
    var destinationSut = Destination()
    
    let fixerService = FixerAPI()
    let googleService = GoogleAPI()
    let weatherService = OpenWeatherAPI()
    
    // DESTINATION MEXICO:
    func testGivenDestinationIsDefault_WhenSelectingMexico_ComputedPropertiesShouldRelateToMexico() {
        destinationSut.selection = "Mexico"
        
        XCTAssertTrue(destinationSut.outputCurrency == "MXN")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "es")
        XCTAssertTrue(destinationSut.outputLanguage == "Spanish")
        XCTAssertTrue(destinationSut.cityId == "3530597")
         XCTAssertTrue(destinationSut.imageId == "mexico")
    }
    
    // DESTINATION NEW YORK:
    func testGivenDestinationIsDefault_WhenSelectingNewYork_ComputedPropertiesShouldRelateToNewYork() {
        destinationSut.selection = "NewYork"
        
        XCTAssertTrue(destinationSut.outputCurrency == "USD")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "en")
        XCTAssertTrue(destinationSut.outputLanguage == "English")
        XCTAssertTrue(destinationSut.cityId == "5128638")
         XCTAssertTrue(destinationSut.imageId == "newyork")
    }
    // DESTINATION LONDON:
    func testGivenDestinationIsDefault_WhenSelectingNLondon_ComputedPropertiesShouldRelateToLondon() {
        destinationSut.selection = "London"
        
        XCTAssertTrue(destinationSut.outputCurrency == "GBP")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "en")
        XCTAssertTrue(destinationSut.outputLanguage == "English")
        XCTAssertTrue(destinationSut.cityId == "2643743")
         XCTAssertTrue(destinationSut.imageId == "london")
    }
    // DESTINATION MOSCOW:
    func testGivenDestinationIsDefault_WhenSelectingNLondon_ComputedPropertiesShouldRelateToMoscow() {
        destinationSut.selection = "Moscow"
        
        XCTAssertTrue(destinationSut.outputCurrency == "RUB")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "ru")
        XCTAssertTrue(destinationSut.outputLanguage == "Russian")
        XCTAssertTrue(destinationSut.cityId == "524901")
         XCTAssertTrue(destinationSut.imageId == "moscow")
    }
    // DESTINATION BEIRUT:
    func testGivenDestinationIsDefault_WhenSelectingNLondon_ComputedPropertiesShouldRelateToBeirut() {
        destinationSut.selection = "Beyrouth"
        
        XCTAssertTrue(destinationSut.outputCurrency == "LBP")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "ar")
        XCTAssertTrue(destinationSut.outputLanguage == "Arabic")
        XCTAssertTrue(destinationSut.cityId == "276781")
         XCTAssertTrue(destinationSut.imageId == "beyrouth")
    }
    // DESTINATION TOKYO:
    func testGivenDestinationIsDefault_WhenSelectingNLondon_ComputedPropertiesShouldRelateToTokyo() {
        destinationSut.selection = "Tokyo"
        
        XCTAssertTrue(destinationSut.outputCurrency == "JPY")
        XCTAssertTrue(destinationSut.outputLanguageSymbol == "ja")
        XCTAssertTrue(destinationSut.outputLanguage == "Japanese")
        XCTAssertTrue(destinationSut.cityId == "1850144")
         XCTAssertTrue(destinationSut.imageId == "tokyo")
    }
    // DESTINATION  BERLIN:
    func testGivenDestinationIsDefault_WhenSelectingNLondon_ComputedPropertiesShouldRelateToBerlin() {
         destinationSut.selection = "Berlin"
         
         XCTAssertTrue(destinationSut.outputCurrency == "EUR")
         XCTAssertTrue(destinationSut.outputLanguageSymbol == "de")
         XCTAssertTrue(destinationSut.outputLanguage == "Deutch")
         XCTAssertTrue(destinationSut.cityId == "2950159")
         XCTAssertTrue(destinationSut.imageId == "berlin")
     }
}
