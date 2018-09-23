//
//  PersonsExamTests.swift
//  PersonsExamTests
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Moya
import Result
import SwiftyJSON
import XCTest
@testable import PersonsExam

class NetwokingTests: XCTestCase {
    
    /// Tests network call using dataServiceProvider.
    func testGetPersons() {
        let exp = expectation(description: "SomeService does stuff and runs the callback closure")
        
        dataServiceProvider.request(.getPersons()) { (result) in
            switch result {
            case let .success(moyaResponse):
                //let jsonObj = JSON(moyaResponse.data)
                if moyaResponse.statusCode == 200 {
                    //let person = Person(fromJson: jsonObj)
                    exp.fulfill()
                    return
                }
                
                if moyaResponse.statusCode == 401 {
                    XCTFail("401")
                    exp.fulfill()
                    return
                }
                
                XCTFail("Error")
                exp.fulfill()
                
            case let .failure(error):
                XCTFail("Error: \(error)")
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    /// Test network call via APIManager
    
    func testGetPersonsViaAPIManager() {
        let exp = expectation(description: "SomeService does stuff and runs the callback closure")
        
        APIManager.Persons.getPersons(onSuccess: { (persons) in
            print("Persons count: \(persons.count)")
            XCTAssert(persons.count > 1, "No persons found")
            
            exp.fulfill()
        }) { (errorMessage) in
            XCTFail("waitForExpectationsWithTimeout errored: \(errorMessage)")
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
}
