//
//  BaseViewModelDelegate.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Foundation

/// The Base Delegate of all ViewModels.
protocol BaseViewModelDelegate: NSObjectProtocol {
    /// Returns true if inputs are valid, otherwise false.
    func validateInputs() -> Bool
    /// Presents an alert/
    func presentAlert(title: String, message: String, okayButtonTitle: String, cancelButtonTitle: String?, withBlock completion: AlertCallBack?)
}

/// Make the methods optional.
extension BaseViewModelDelegate {
    func validateInputs() -> Bool { return false }
    func presentAlert(title: String, message: String, okayButtonTitle: String, cancelButtonTitle: String?, withBlock completion: AlertCallBack?) {}
}

