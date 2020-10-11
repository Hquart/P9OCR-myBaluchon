//
//  GoogleAPITestCase.swift
//  myBaluchonTests
//
//  Created by Naji Achkar on 20/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import Foundation

@testable import myBaluchon
import XCTest

class GoogleAPITestCase: XCTestCase {
    
    // ERROR:
    func testGetTranslation_WhenServerError_ShouldFailAndThrowAnError() {
        let googleService = GoogleAPI(session: URLSessionFake(
            data: nil,
            response: nil,
            error: FakeResponseData.error))
        let expectation = XCTestExpectation(description: "Queue change")
        googleService.getTranslation { result in
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
    func testGetTranslation_WhenDataIsNil_ShouldFailAndThrowAnError() {
        let googleService = GoogleAPI(session: URLSessionFake(
            data: nil,
            response: FakeResponseData.responseOK,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        googleService.getTranslation { result in
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
    func testGetTranslation_WhenIncorrectResponse_ShouldFailAndThrowAnError() {
        let googleService = GoogleAPI(session: URLSessionFake(
            data: FakeResponseData.googleCorrectData,
            response: FakeResponseData.responseKO,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        googleService.getTranslation { result in
            guard case .failure(let error) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    // BAD DATA
    func testGetTranslation_WhenIncorrectData_ShouldFail() {
        let googleService = GoogleAPI(session: URLSessionFake(
            data: FakeResponseData.incorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        googleService.getTranslation { result in
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
    func testGetTranslation_WhenEverythingOK_ShouldSucceedAndProvideData() {
        let googleService = GoogleAPI(session: URLSessionFake(
            data: FakeResponseData.googleCorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        googleService.getTranslation { result in
            guard case .success(let translation) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(translation.data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
