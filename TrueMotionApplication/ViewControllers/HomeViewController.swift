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
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var leftView: UIView!
    let descriptionArray = ["Location sharing", "Roadside Assiatance", "Settings", "FAQ", "Support"]
    let menuViewTableDescriptions = "String missing!"
    
    @IBOutlet weak var leftStackViewLeadingConstraint: NSLayoutConstraint!
    var menuViewLeadingConstraint: NSLayoutConstraint!
    var menuViewDismissButtonLeadingConstraint: NSLayoutConstraint!
    var isMenuViewAppeared = false{
        didSet{
            self.menuViewStackViewLeadingConstraint.constant = self.menuViewStackViewLeadingConstraint.constant == 0 ? -450 : 0
            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
                
            }
        }
    }
    
    @IBOutlet weak var menuViewStackViewLeadingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuButton()
        setUpGroupButton()
        setUpMenuViewTableView()
        setUpMenuViewContraints()
    }
    func setUpMenuViewContraints(){
        menuViewStackViewLeadingConstraint.constant = -514
    }
    
    func setUpMenuViewTableView(){
        let menuTableViewCellNib : UINib = UINib(nibName: MenuTableViewCell.identifier, bundle: .main)
        menuTableView.register(menuTableViewCellNib, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    func setUpMenuButton(){
        self.menuButton.layer.cornerRadius = 0.5 * self.menuButton.frame.width
        self.menuButton.clipsToBounds = true
    }
    
    func setUpGroupButton(){
        self.groupButton.layer.cornerRadius = 0.18 * self.groupButton.frame.width
        self.groupButton.clipsToBounds = true 
    }
    func toggleMenuViewAppearance(){
        self.isMenuViewAppeared.toggle()
        self.menuButton.alpha = self.menuButton.alpha == 0 ? 1 : 0
        self.menuButton.isEnabled.toggle()
    }

    @IBAction func didPressedMenuViewPhotoButton(_ sender: UIButton) {
    }
    @IBAction func didPressedMenuViewEditProfileButton(_ sender: UIButton) {
    }
    @IBAction func didPressedMenuViewDismissButton(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
    
    @IBAction func didPressedMenuButton(_ sender: UIButton) {
        toggleMenuViewAppearance()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier) as! MenuTableViewCell
        cell.descrip = descriptionArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
