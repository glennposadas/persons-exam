//
//  BaseTableView.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {
    
    // MARK: - Properties
    
    var _backgroundColor: UIColor?
    
    override var backgroundColor: UIColor? {
        didSet {
            _backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Functions
    
    func reloadData(_ animated: Bool, completion: (() -> Void)? = nil) {
        
        self.reloadData()
        
        if animated {
            let cells = self.visibleCells
            let tableViewHeight = self.bounds.size.height
            
            for cell in cells {
                cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            }
            
            let delayCounter = 0
            for cell in cells {
                UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform.identity
                }) { (didFinish) in
                    if didFinish {
                        completion?()
                    }
                }
            }
        }
    }
    
    // MARK: Overrides
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.estimatedRowHeight = 50.0
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedSectionHeaderHeight = 0
        self.estimatedSectionFooterHeight = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        
        // Register custom cells.
        
        backgroundColor = _backgroundColor
        
        // Base Cells
        
        self.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.identifier)
        
        // Register other cells.
        
        self.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        
        // Set the footer and header to remove extra blank lines
        
        let transluscentView = UIView()
        transluscentView.backgroundColor = .clear
        
        self.tableHeaderView = transluscentView
        self.tableFooterView = transluscentView
        
        // Few more setups
        self.keyboardDismissMode = .interactive
        self.scrollsToTop = true
        
        super.didMoveToWindow()
    }
    
}
