//
//  MenuTableViewCell.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    static let identifier = "MenuTableViewCell"
    
    var menuTitle = "" {
        didSet {
            self.label.text = self.menuTitle
        }
    }
    
}


