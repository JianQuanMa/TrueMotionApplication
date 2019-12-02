//
//  ProfileViewController.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/22/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var profileVCTableView: UITableView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navItem: UINavigationItem!
    var bButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonAction(sender:)))
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.leftItemsSupplementBackButton = true
        navItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(backButtonAction(sender:)))
    }
    
    func setUpBarButtonItems(){
        self.bButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonAction(sender:)))
    }

    @objc func backButtonAction(sender: UIButton!) {
      dismiss(animated: true)
    }
    @IBAction func didPressedPhotoButton(_ sender: UIButton) {
    }
    @IBAction func didPressedChangePhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func didPressedBackButton(_ sender: UIBarButtonItem) {
    //    action: #selector(profileVCTableView.back(sender:))
    }
    @IBAction func didPressedSaveButton(_ sender: UIBarButtonItem) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
