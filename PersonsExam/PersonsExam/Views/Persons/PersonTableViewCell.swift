//
//  PersonTableViewCell.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Kingfisher
import UIKit

class PersonTableViewCell: BaseTableViewCell {

    // MARK: - Properties
    
    private lazy var imageView_PersonPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label_FullName: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 14.0, weight: .medium, textColor: .black)
        return label
    }()
    
    private lazy var label_Email: UILabel = {
        let label = UILabel()
        label.setup("", fontSize: 11.0, textColor: .darkGray, numberOfLines: 2)
        return label
    }()
    
    // MARK: - Functions
    
    func setupCell(_ person: Person) {
        // Setup the data.
        let fullName = "\(person.firstName ?? "") \(person.lastName ?? "")"
        let email = person.email ?? ""
        let picture = person.picture ?? ""
        
        self.label_FullName.text = fullName
        self.label_Email.text = email
        
        if let url = picture.URLEscaped {
            let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
            self.imageView_PersonPicture.kf.setImage(with: resource, placeholder: UIImage.placeholder, options: [.transition(.fade(0.2)), .cacheOriginalImage])
        }
    }
    
    // MARK: Overrides
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0.1,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 5,
            options: [],
            animations: {
                let value: CGFloat = highlighted ? 0.95 : 1.0
                self.label_FullName.transform = CGAffineTransform(scaleX: value, y: value)
                self.label_Email.transform = CGAffineTransform(scaleX: value, y: value)
                self.imageView_PersonPicture.transform = CGAffineTransform(scaleX: value, y: value)
        }, completion: nil)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup views.
        
        self.backgroundColor = .white
        self.separatorInset = UIEdgeInsetsMake(0, 20.0, 0, 20.0)
        self.selectionStyle = .none
        
        self.addSubview(self.imageView_PersonPicture)
        self.imageView_PersonPicture.snp.makeConstraints {
            $0.width.height.equalTo(50.0)
            $0.top.bottom.equalToSuperview().inset(9.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        self.addSubview(self.label_FullName)
        self.label_FullName.snp.makeConstraints {
            $0.top.equalTo(self.imageView_PersonPicture.snp.top).offset(5.0)
            $0.leading.equalTo(self.imageView_PersonPicture.snp.trailing).offset(5.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        
        self.addSubview(self.label_Email)
        self.label_Email.snp.makeConstraints {
            $0.top.equalTo(self.label_FullName.snp.bottom).offset(5.0)
            $0.leading.trailing.equalTo(self.label_FullName)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









