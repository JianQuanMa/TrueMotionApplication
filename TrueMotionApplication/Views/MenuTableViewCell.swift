//
//  MenuTableViewCell.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "MenuTableViewCell"
    var descrip: String = ""{
        didSet{
            self.label.text = self.descrip
        }
    }
    
}

