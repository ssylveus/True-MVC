//
//  EmployeesController.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

protocol EmployeesControllerModelDelegate {
    func getEmployees()
}

protocol EmployeesControllerViewDelegate {
    func updateTableViewWithData(employees: [Employee])
}

class EmployeesController: UIViewController {
    //Instance of view
    @IBOutlet var employeeView: EmployeesView!
    
    //Instance of Model
    let employeeModel = EmployeeModel()
    
    //Model delegate so the controller can talk to the model
    var modelDelegate: EmployeesControllerModelDelegate? {
        return employeeModel
    }
    
    //View delegate so the controller can talk to the view
    var viewDelegate: EmployeesControllerViewDelegate {
        return employeeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conformToModelViewDelegates()
        modelDelegate?.getEmployees()
    }
    
    func conformToModelViewDelegates() {
        employeeModel.delegate = self
        employeeView.delegate = self
    }
}

extension EmployeesController: EmployeeModelDelegate {
    func didGetListOfEmployees(employees: [Employee]) {
        viewDelegate.updateTableViewWithData(employees: employees)
    }
}

extension EmployeesController: EmployeesViewDelegate {
    func didSelectEmployee(employee: Employee) {
        let storyboard = UIStoryboard(name: "EmployeeDetail", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "EmployeeDetailController") as! EmployeeDetailController
        detailVC.employee = employee
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
