//
//  PersonsViewController.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import RxCocoa
import RxSwift
import SwiftyJSON
import UIKit

class PersonsViewController: BaseViewController {

    // MARK: - Properties
    
    private var viewModel: PersonsViewModel!
    private let disposeBag = DisposeBag()
        
    // MARK: - Functions
    
    private func setupBindings() {
        self.tableView.rx.modelSelected(Person.self).subscribe(onNext: { person in
            self.showPersonDetails(person)
        }).disposed(by: self.disposeBag)
        
        self.viewModel.persons
            .bind(to: self.tableView.rx.items(cellIdentifier: PersonTableViewCell.identifier, cellType: PersonTableViewCell.self)) { row, person, personCell in
                personCell.setupCell(person)
            }.disposed(by: self.disposeBag)
    }
    
    private func showPersonDetails(_ person: Person) {
        let personViewerViewController = PersonViewerViewController(person)
        self.navigationController?.pushViewController(personViewerViewController, animated: true)
    }
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = PersonsViewModel(personsController: self)
        self.setupUI()
        self.setupBindings()
    }
}

// MARK: - PersonsDelegate

extension PersonsViewController: PersonsDelegate {
    func presentAlert(title: String, message: String, okayButtonTitle: String, cancelButtonTitle: String?, withBlock completion: AlertCallBack?) {
        self.alert(title: title, message: message, okayButtonTitle: okayButtonTitle, cancelButtonTitle: cancelButtonTitle) { (didTapOk) in
            completion?(didTapOk)
        }
    }
}












