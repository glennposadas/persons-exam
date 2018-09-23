//
//  PersonsViewController+SetupUI.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import SnapKit
import UIKit

extension PersonsViewController {
    internal func setupUI() {
        // Layout goes here...
        self.title = "Persons"
        self.addTableView()
    }
}
