//
//  PersonViewerViewController.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

/**
 TODO: ViewModel for PersonViewerViewController.
 */
class PersonViewerViewController: BaseViewController {

    // MARK: - Properties
    
    private var person: Person!
    
    internal lazy var imageView_PersonPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    internal lazy var label_FirstName: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    internal lazy var label_LastName: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    internal lazy var label_Email: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    internal lazy var label_Address: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    internal lazy var label_Mobile: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    internal lazy var label_ContactPerson: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()

    internal lazy var label_ContactPersonNumber: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, textColor: .black)
        return label
    }()
    
    // MARK: - Functions
    
    private func setupData() {
        let firstName = self.person.firstName ?? ""
        let lastName = self.person.lastName ?? ""
        let fullName = "\(firstName) \(lastName)"
        let email = self.person.email ?? ""
        let address = self.person.address ?? ""
        let mobile = self.person.mobileNumber ?? ""
        let contactPerson = self.person.contactPerson ?? ""
        let contactPersonNo = self.person.contactPersonPhoneNumber ?? ""
        let picture = self.person.picture ?? ""
        
        self.title = fullName
        self.label_FirstName.text = "FIRSTNAME: \(firstName)"
        self.label_LastName.text = "LASTNAME: \(lastName)"
        self.label_Email.text = "EMAIL: \(email)"
        self.label_Address.text = "ADDRESS: \(address)"
        self.label_Mobile.text = "MOBILE: \(mobile)"
        self.label_ContactPerson.text = "CONTACT PERSON: \(contactPerson)"
        self.label_ContactPersonNumber.text = "MOBILE: \(contactPersonNo)"
        
        if let url = picture.URLEscaped {
            let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
            self.imageView_PersonPicture.kf.setImage(with: resource, placeholder: UIImage.placeholder, options: [.transition(.fade(0.2)), .cacheOriginalImage])
        }
    }
    
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
        
        self.setupUI()
        self.setupData()
    }
}
