//
//  EmplyeeViewModelTest.swift
//  AuthenticationDemoTests
//
//  Created by Siddharth Kumar on 10/03/22.
//

import XCTest
@testable import AuthenticationDemo

class EmplyeeViewModelTest: XCTestCase {
    var viewModel: EmployeeViewModelType!
    
    override func setUp() {
         viewModel = EmployeeViewModel()
    }
    
    func testName() {
        //Given
        //viewModel in the setup
        
        //When
        let testValue = viewModel.name
        
        //Then
        XCTAssertEqual(testValue, "Siddharth Kumar")
    }
    
    func testCompany() {
        //Given
        //viewModel in the setup
        
        //When
        let testValue = viewModel.company
        
        //Then
        XCTAssertEqual(testValue, "Litmus7 Consulting System Limited")
    }
    
    func testEmpID() {
        //Given
        //viewModel in the setup
        
        //When
        let testValue = viewModel.employeeId
        
        //Then
        XCTAssertEqual(testValue, "588")
    }
    
    func testAddress() {
        //Given
        //viewModel in the setup
        
        //When
        let testValue = viewModel.address
        
        //Then
        let expectedValue = "2nd Phase, JPNagar\nBengaluru\nKarnataka\n576105"
        XCTAssertEqual(testValue, expectedValue)
    }
}
