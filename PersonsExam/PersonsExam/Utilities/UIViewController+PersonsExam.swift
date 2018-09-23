//
//  UIViewController+PersonsExam.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import SnapKit
import UIKit

/// The completion callback for the ```alert```.
public typealias AlertCallBack = ((_ userDidTapOk: Bool) -> Void)

/// Category for any controller.
extension UIViewController {
    // MARK: - Functions
    // MARK: - Navigation Bar utilities.
    
    /// Sets the title with attributed string
    public func setAttributedTitle(_ title: String, color: UIColor, font: UIFont) {
        
        let titleLabel = UILabel()
        let attributes = [NSAttributedStringKey.foregroundColor: color,
                          NSAttributedStringKey.font : font as Any]
        titleLabel.attributedText = NSAttributedString(string: title, attributes: attributes)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    /**
     Presents an alertController with completion.
     - parameter title: The title of the alert.
     - parameter message: The body of the alert, nullable, since we can just sometimes use the title parameter.
     - parameter okButtonTitle: the title of the okay button.
     - parameter cancelButtonTitle: The title of the cancel button, defaults to nil, nullable.
     - parameter completion: The ```LLFAlertCallBack```, returns Bool. True when the user taps on the OK button, otherwise false.
     */
    public func alert(
        title: String,
        message: String? = nil,
        okayButtonTitle: String,
        cancelButtonTitle: String? = nil,
        withBlock completion: AlertCallBack?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okayButtonTitle, style: .default) { _ in
            completion?(true)
        }
        alertController.addAction(okAction)
        
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default) { _ in
                completion?(false)
            }
            alertController.addAction(cancelAction)
        }
        
        alertController.view.tintColor = .black
        present(alertController, animated: true, completion: nil)
    }    
}





