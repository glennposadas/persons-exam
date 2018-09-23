//
//  PersonsViewModel.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift
import SwiftyJSON

/// The delegate of the ```PersonsViewModel```
protocol PersonsDelegate: BaseViewModelDelegate {
    
}

class PersonsViewModel {
    
    // MARK: - Properties
    
    private var delegate: PersonsDelegate?
    
    var persons = BehaviorRelay<[Person]>(value: [])
    
    // MARK: Functions
    // MARK: Network Calls.
    
    func fetchData() {
        APIManager.Persons.getPersons(onSuccess: { (persons) in
            self.persons.accept(persons)
        }) { (errorMessage) in
            self.delegate?.presentAlert(title: "Persons Exam", message: errorMessage, okayButtonTitle: "OK", cancelButtonTitle: nil, withBlock: nil)
        }
    }
    
    /// init
    init(personsController: PersonsDelegate) {
        self.delegate = personsController
        self.fetchData()
    }
}
