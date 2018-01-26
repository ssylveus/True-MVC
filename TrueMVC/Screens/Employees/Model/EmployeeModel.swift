//
//  EmployeesModel.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

protocol EmployeeModelDelegate {
    func didGetListOfEmployees(employees: [Employee])
}

class EmployeeModel: NSObject {
    var delegate: EmployeeModelDelegate?
    
    /// Sort employees by name in ascending order
    ///
    /// - Parameter employees: list of employees to be sorted
    /// - Returns: sorted list of employees
    func sortEmployeesByNames(employees: [Employee]) -> [Employee] {
        return employees.sorted { (e1, e2) -> Bool in
            return e1.name < e2.name
        }
    }
}

extension EmployeeModel: EmployeesControllerModelDelegate {
    func getEmployees() {
        var employees = [Employee]()
        
        var employee = Employee(name: "John Doe", department: "Information Technology")
        employees.append(employee)
        
        employee = Employee(name: "Abby Johnson", department: "Human Resource")
        employees.append(employee)
        
        employee = Employee(name: "Sam Young", department: "Retail")
        employees.append(employee)
        
        delegate?.didGetListOfEmployees(employees: sortEmployeesByNames(employees: employees))
    }
}
