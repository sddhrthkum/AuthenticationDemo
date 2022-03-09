//
//  EmployeeViewModel.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 10/03/22.
//

import Foundation

protocol EmployeeViewModelType {
    var name: String? { get }
    var company: String? { get }
    var employeeId: String? { get }
    var address: String? { get }    
}

class EmployeeViewModel: EmployeeViewModelType {
    var employee: Employee?
    
    init() {
        fetchEmployeeData()
    }
    
    var name: String?  {
        employee?.name
    }
    
    var company: String? {
        employee?.company
    }
    
    var employeeId: String? {
        employee?.empId
    }
    
    var address: String? {
        getAddress()
    }
    
    private func fetchEmployeeData() {
        employee = JSONLoader().loadJSON("Employee")
    }
    
    private func getAddress() -> String? {
        guard let address = employee?.address else { return nil }
        let addressStr = address.addressline1 + "\n" + address.city + "\n" +  address.state + "\n" + address.pin
        return addressStr
    }
}
