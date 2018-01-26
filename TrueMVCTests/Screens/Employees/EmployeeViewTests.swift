//
//  EmployeeViewTests.swift
//  TrueMVCTests
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

@testable import TrueMVC
import XCTest

class EmployeeViewTests: XCTestCase {
    var sut: EmployeesView!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Employees", bundle: nil)
        let employeeVC = storyboard.instantiateViewController(withIdentifier: "EmployeesController") as! EmployeesController
        sut = employeeVC.view as! EmployeesView
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTableViewIsASubView() {
        XCTAssertTrue(sut.subviews.contains(sut.tableView), "TableView was not added to employee view")
    }
    
}
