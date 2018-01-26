 //
//  EmployeesView.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

protocol EmployeesViewDelegate {
    func didSelectEmployee(employee: Employee)
}

class EmployeesView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: EmployeesViewDelegate?
    var employees = [Employee]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension EmployeesView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name
        cell.detailTextLabel?.text = employee.department
        return cell
    }
}

extension EmployeesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectEmployee(employee: employees[indexPath.row])
    }
}

extension EmployeesView: EmployeesControllerViewDelegate {
    func updateTableViewWithData(employees: [Employee]) {
        self.employees = employees
        tableView.reloadData()
    }
}
