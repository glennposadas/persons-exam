//
//  String+PersonsExam.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

/// Category for String.
/// Contains String helpers.
extension String {
    
    /// Returns an escaped URL
    var URLEscaped: URL? {
        return URL(string: self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
