//
//  Employee.swift
//  TrueMVC
//
//  Created by Sylveus, Steeven on 1/25/18.
//  Copyright © 2018 Allstate. All rights reserved.
//

import UIKit

class Employee: NSObject {
    var name: String!
    var department: String
    
    init(name: String, department: String) {
        self.name = name
        self.department = department
    }
}
