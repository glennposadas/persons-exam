//
//  BaseViewController.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import EFInternetIndicator
import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties
    
    public typealias PersonsExamAlertCallBack = (_ userDidTapOk: Bool) -> Void
    public var internetConnectionIndicator: InternetViewIndicator?
    
    // MARK: - Functions
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add some more common configurations here...
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        // For reachability
        // Change the remoteHostName if necessary...
        // Suppose the mock api is on a real server...
        
        self.startMonitoringInternet(
            backgroundColor: .blueTheme,
            style: .statusLine,
            textColor: .white,
            message: "Oops! Please check your internet connection! 🤦‍♂️",
            remoteHostName: "google.com"
        )
    }
}

// MARK: - InternetStatusIndicable

extension BaseViewController: InternetStatusIndicable {
    
}





