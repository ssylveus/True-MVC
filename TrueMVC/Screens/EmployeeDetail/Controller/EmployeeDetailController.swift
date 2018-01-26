//
//  EmployeeDetailController.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

protocol EmployeeDetailControllerViewDelegate {
    func updateViewForEmployee(employee: Employee)
}

class EmployeeDetailController: UIViewController {
    @IBOutlet var employeeDetailView: EmployeeDetailView!
    
    var viewDelegate: EmployeeDetailControllerViewDelegate {
        return employeeDetailView
    }
    
    var employee: Employee!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDelegate.updateViewForEmployee(employee: employee)
    }

}
