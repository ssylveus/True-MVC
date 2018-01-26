//
//  EmployeeControllerTestCase.swift
//  TrueMVCTests
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

@testable import TrueMVC
import XCTest

class EmployeeControllerTests: XCTestCase {
    var sut: EmployeesController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Employees", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "EmployeesController") as! EmployeesController
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testEmployeeSelected() {
        let employee = Employee(name: "John Doe", department: "Information Technology")
        let nav = MockNavigationController.setKeyWindow(rootViewController: sut)
        sut.didSelectEmployee(employee: employee)
        XCTAssertTrue(nav.pushedViewController is EmployeeDetailController)
        
    }
    
    class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        
        class func setKeyWindow(rootViewController: UIViewController) -> MockNavigationController  {
            let navigationController = MockNavigationController(rootViewController: rootViewController)
            UIApplication.shared.keyWindow?.rootViewController = navigationController
            return navigationController
        }
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: true)
        }
    }
}
