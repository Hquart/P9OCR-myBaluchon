//
//  OpenWeatherAPITestCase.swift
//  myBaluchonTests
//
//  Created by Naji Achkar on 20/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation


@testable import myBaluchon
import XCTest

class OpenWeatherAPITestCase: XCTestCase {
    
    // ERROR:
    func testGetWeather_WhenServerError_ShouldFailAndThrowAnError() {
        
        let weatherService = OpenWeatherAPI(session: URLSessionFake(
            data: nil,
            response: nil,
            error: FakeResponseData.error))
        let expectation = XCTestExpectation(description: "Queue change")
        weatherService.getWeather { result in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // NO DATA:
    func testGetWeather_WhenDataIsNil_ShouldFailAndThrowAnError() {
        
        let weatherService = OpenWeatherAPI(session: URLSessionFake(
            data: nil,
            response: nil,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        weatherService.getWeather { result in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // BAD RESPONSE:
    func testGetWeather_WhenIncorrectResponse_ShouldFailAndThrowAnError() {
        
        let weatherService = OpenWeatherAPI(session: URLSessionFake(
            data: nil,
            response: FakeResponseData.responseKO,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        weatherService.getWeather { result in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    // BAD DATA:
    func testGetWeather_WhenDataIsIncorrect_ShouldFailAndThrowAnError() {
        
        let weatherService = OpenWeatherAPI(session: URLSessionFake(
            data:  FakeResponseData.incorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        weatherService.getWeather { result in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    // DATA OK, RESPONSE OK, NO ERROR:
    func testGetWeather_WhenEverythingOK_ShouldSucceedAndProvideData() {
        
        let weatherService = OpenWeatherAPI(session: URLSessionFake(
            data:  FakeResponseData.openWeatherCorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        weatherService.getWeather { result in
            guard case .success(let weather) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(weather.list)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
}
