//
//  EmployeeModelTests.swift
//  TrueMVCTests
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

@testable import TrueMVC
import XCTest

class EmployeeModelTests: XCTestCase {
    var sut: EmployeeModel!
    
    override func setUp() {
        super.setUp()
        sut = EmployeeModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    class EmployeeModelSpy: EmployeeModelDelegate {
        var employees = [Employee]()
        func didGetListOfEmployees(employees: [Employee]) {
            self.employees = employees
        }
    }
    
    func testGetEmployees() {
        let spy = EmployeeModelSpy()
        sut.delegate = spy
        sut.getEmployees()
        XCTAssertTrue(spy.employees.count > 0, "Employee count should be greater than 0")
    }
    
    func getMockEmployeeData() -> [Employee] {
        var employees = [Employee]()
        
        var employee = Employee(name: "John Doe", department: "Information Technology")
        employees.append(employee)
        
        employee = Employee(name: "Abby Johnson", department: "Human Resource")
        employees.append(employee)
        
        employee = Employee(name: "Sam Young", department: "Retail")
        employees.append(employee)
        return employees
    }
    
    func testSortEmployeeByName() {
        let sortedEmployees = sut.sortEmployeesByNames(employees: getMockEmployeeData())
        XCTAssertTrue(sortedEmployees.first!.name == "Abby Johnson", "Abby Johnson should be the first employee in the list")
        XCTAssertTrue(sortedEmployees.last!.name == "Sam Young", "Sam Young should be the last employee in the list")
    }
}
