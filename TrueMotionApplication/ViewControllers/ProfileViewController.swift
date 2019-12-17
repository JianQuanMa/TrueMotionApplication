//
//  ProfileViewController.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/22/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AccountDataViewModelDelegate{
    func updateView() {
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
    
    @IBOutlet weak var userPhoto: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var profileVCTableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navItem: UINavigationItem!
    var isChangedPhoto = false
    var tempPhoto = UIImage() {
        didSet{
            DispatchQueue.main.async {
                self.userPhoto.setImage(self.tempPhoto.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
    }
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
    
    func showChangePhotoAlert(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            self.getPhoto(from: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            self.getPhoto(from: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func getPhoto(from sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController,animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        tempPhoto = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.isChangedPhoto = true
        self.dismiss(animated: true)
    }
    
    
    
    
    
    @IBAction func didPressedPhotoButton(_ sender: UIButton) {
        showChangePhotoAlert()
    }
    @IBAction func didPressedChangePhotoButton(_ sender: UIButton) {
        showChangePhotoAlert()
    }
    
    @IBAction func didPressedBackButton(_ sender: UIBarButtonItem) {
        //    action: #selector(profileVCTableView.back(sender:))
    }
    @IBAction func didPressedSaveButton(_ sender: UIBarButtonItem) {
        //TODO: save the image to the user data model
        accountDataModelShared.userDataModel.photo = tempPhoto
        self.isChangedPhoto = false
        self.dismiss(animated: true)
    }
    
}
