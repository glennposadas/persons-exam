//
//  PersonViewerViewController+SetupUI.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import SnapKit
import UIKit

extension PersonViewerViewController {
    internal func setupUI() {
        // Layout goes here...
        self.addScrollView()
        
        self.scrollView.addSubview(self.imageView_PersonPicture)
        self.imageView_PersonPicture.snp.makeConstraints {
            $0.width.height.equalTo(150.0)
            $0.top.equalToSuperview().inset(50.0)
            $0.centerX.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.label_FirstName)
        self.label_FirstName.snp.makeConstraints {
            $0.top.equalTo(self.imageView_PersonPicture.snp.bottom).offset(20.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }

        self.scrollView.addSubview(self.label_LastName)
        self.label_LastName.snp.makeConstraints {
            $0.top.equalTo(self.label_FirstName.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }
        
        self.scrollView.addSubview(self.label_Mobile)
        self.label_Mobile.snp.makeConstraints {
            $0.top.equalTo(self.label_LastName.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }
        
        self.scrollView.addSubview(self.label_Email)
        self.label_Email.snp.makeConstraints {
            $0.top.equalTo(self.label_Mobile.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }
        
        self.scrollView.addSubview(self.label_Address)
        self.label_Address.snp.makeConstraints {
            $0.top.equalTo(self.label_Email.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }

        self.scrollView.addSubview(self.label_ContactPerson)
        self.label_ContactPerson.snp.makeConstraints {
            $0.top.equalTo(self.label_Address.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
        }

        self.scrollView.addSubview(self.label_ContactPersonNumber)
        self.label_ContactPersonNumber.snp.makeConstraints {
            $0.top.equalTo(self.label_ContactPerson.snp.bottom).offset(10.0)
            $0.leading.equalTo(self.label_ContactPerson).offset(10.0)
            $0.trailing.equalToSuperview().inset(10.0)
            $0.bottom.equalToSuperview().inset(30.0)
        }
    }
}
