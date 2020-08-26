//
//  FixerAPITestCase.swift
//  myBaluchonTests
//
//  Created by Naji Achkar on 19/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

@testable import myBaluchon
import XCTest

class FixerAPITestCase: XCTestCase {
    // ERROR:
    func testGetRate_WhenError_ShouldThrowAnError() {
        let fixerService = FixerAPI(session: URLSessionFake(
            data: nil,
            response: nil,
            error: FakeResponseData.error))
        let expectation = XCTestExpectation(description: "Queue change")
        fixerService.getRate { result in
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
    func testGetRate_WhenNoData_ShouldFail() {
        let fixerService = FixerAPI(session: URLSessionFake(
            data: nil,
            response: nil,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        
        fixerService.getRate { result in
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
    func testGetRate_WhenIncorrectResponse_ShouldFail() {
        let fixerService = FixerAPI(session: URLSessionFake(
            data: FakeResponseData.fixerCorrectData,
            response: FakeResponseData.responseKO,
            error: nil))
        let expectation = XCTestExpectation(description: "Queue change")
        
        fixerService.getRate { result in
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
    func testGetRate_WhenIncorrectData_ShouldFail() {
        //Given
        let fixerService = FixerAPI(session: URLSessionFake(
            data: FakeResponseData.incorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        //When
        let expectation = XCTestExpectation(description: "Queue change")
        fixerService.getRate { result in
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
    func testGetRate_WhenDataResponseOKnoError_ShouldSucceedandProvideData() {
        //Given
        let fixerService = FixerAPI(session: URLSessionFake(
            data: FakeResponseData.fixerCorrectData,
            response: FakeResponseData.responseOK,
            error: nil))
        //When
        let expectation = XCTestExpectation(description: "Queue change")
        fixerService.getRate { result in
            guard case .success(let data) = result else {
                XCTFail()
                return
            }
            XCTAssertNotNil(data.rates)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}









