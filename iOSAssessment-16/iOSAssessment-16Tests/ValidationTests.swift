//
//  ValidationTests.swift
//  iOSAssessment-16Tests
//
//  Created by Satyam Dixit on 27/10/21.
//

import XCTest
@testable import iOSAssessment_16

class LoginValidationTests: XCTestCase {
    
    let validation = Model()

    func test_LoginValidation_With_EmptyStrings_Returns_ValidationFailure(){
        
        let result = validation.validate(email: "", pass: "")
        
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Email or Password cannot be empty")
    }
    
    func test_LoginValidation_With_EmptyEmail_Returns_ValidationFailure(){
        
        let result = validation.validate(email: "", pass: "1234")
        
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Email or Password cannot be empty")
    }
    
    func test_LoginValidation_With_EmptyPass_Returns_ValidationFailure(){
        
        let result = validation.validate(email: "test@gmail.com", pass: "")
        
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Email or Password cannot be empty")
    }
    
    func test_LoginValidation_With_InvalidEmail_Returns_ValidationFailure(){
            
        let result = validation.validate(email: "test", pass: "1234")
        
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Email is invalid")
    }
    
    func test_LoginValidation_With_PasswordLength_Returns_ValidationFailure(){
                
        let result = validation.validate(email: "test@gmail.com", pass: "1234")
        
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Password should be greater than 6 characters")
    }
    
    func test_LoginValidation_With_ValidRequest_Returns_Success(){
        
        let result = validation.validate(email: "test@gmail.com", pass: "1234567")
        
        XCTAssertTrue(result.isValid)
        XCTAssertNotNil(result.msg)
        XCTAssertEqual(result.msg, "Success")
    }
}
