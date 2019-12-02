//
//  MenuViewController.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/21/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController{
    
    @IBOutlet weak var trueMotionImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var menuTableView: UITableView!
    let descriptionArray = ["Location sharing", "Roadside Assiatance", "Settings", "FAQ", "Support"]
    override func viewDidLoad() {
        let menuTableViewCellNib : UINib = UINib(nibName: MenuTableViewCell.identifier, bundle: .main)
        menuTableView.register(menuTableViewCellNib, forCellReuseIdentifier: MenuTableViewCell.identifier)
        super.viewDidLoad()
    }
    
    @IBAction func didTappedCameraButton(_ sender: UIButton) {
    }
    @IBAction func didTappedEditProfileButton(_ sender: UIButton) {
    }
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
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
