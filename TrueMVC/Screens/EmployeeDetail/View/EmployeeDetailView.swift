//
//  EmployeeDetailView.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

class EmployeeDetailView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension EmployeeDetailView: EmployeeDetailControllerViewDelegate {
    func updateViewForEmployee(employee: Employee) {
        nameLabel.text = employee.name
        departmentLabel.text = employee.department
    }
    
}
