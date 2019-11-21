//
//  ViewController.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var groupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuButton()
        setUpGroupButton()
        
    }
    func setUpMenuButton(){
        self.menuButton.layer.cornerRadius = 0.5 * self.menuButton.frame.width
        self.menuButton.clipsToBounds = true
    }
    
    func setUpGroupButton(){
        self.groupButton.layer.cornerRadius = 0.18 * self.groupButton.frame.width
        self.groupButton.clipsToBounds = true 
    }


}

