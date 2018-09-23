//
//  PersonViewerViewController.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

class PersonViewerViewController: BaseViewController {

    // MARK: - Properties
    
    private var person: Person!
    
    // MARK: - Functions
    // MARK: Initialization
    
    init(_ person: Person) {
        super.init(nibName: nil, bundle: nil)
        
        self.person = person
    }
    
    private init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
