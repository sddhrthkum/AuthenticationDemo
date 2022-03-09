//
//  Employee.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 10/03/22.
//

import Foundation

struct Employee: Decodable {
    let name: String
    let company: String
    let empId: String
    let address: Address
}

struct Address: Decodable {
    let addressline1: String
    let city: String
    let state: String
    let pin: String
}
