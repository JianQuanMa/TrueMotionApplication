//
//  ViewController.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 11/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

protocol LocationServiceDelegate: class, CLLocationManagerDelegate {}
    
final class LocationService {
    static let shared = LocationService()

    private let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        return manager
    }()
    
    
    func start() {
        locationManager.requestLocation()
//        locationManager.startUpdatingLocation()
        checkPermission()
    }
    
    private func checkPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            // do map stuff like showing the users location here
            break
        case .denied:
            // don't do anything or show a pop up
            break
        case .notDetermined:
            // we can prompt the user
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // don't do anything
            break
        @unknown default:
            break
        }
    }
    
    weak var delegate: LocationServiceDelegate? {
        didSet {
            locationManager.delegate = delegate
        }
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var groupButton: UIButton!
    @IBOutlet private weak var menuTableView: UITableView!
    @IBOutlet private weak var leftView: UIView!
    @IBOutlet private weak var homeMapView: MKMapView!
    @IBOutlet weak var leftStackViewLeadingConstraint: NSLayoutConstraint!
    private struct MenuCellModel {
        let title: String
    }
    
    private let descriptionArray: [MenuCellModel] = [
        "Location sharing",
        "Roadside Assiatance",
        "Settings",
        "FAQ",
        "Support"
    ].map(MenuCellModel.init)
    
    var isMenuViewAppeared = false {
        didSet {
            self.menuViewStackViewLeadingConstraint.constant = self.menuViewStackViewLeadingConstraint.constant == 0 ? -450 : 0
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
                
            }
        }
    }
        
    // TODO: - injection
    private let locationManager: LocationService = .shared
    
    @IBOutlet weak var menuViewStackViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up uis
        setUpMenuButton()
        setUpGroupButton()
        setUpMenuViewTabtleView()
        setUpMenuViewContraints()
        
        checkLocationPermission()
        updateAnnotationsOnMapView()
    }
    

    private func checkLocationPermission() {
        locationManager.delegate = self
        locationManager.start()
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
    
    // MARK: - Helpers
    
    private func setUpMenuViewContraints(){
        menuViewStackViewLeadingConstraint.constant = -514
    }
    
    private func setUpMenuViewTabtleView(){
        let menuTableViewCellNib : UINib = UINib(nibName: MenuTableViewCell.identifier, bundle: .main)
        menuTableView.isScrollEnabled = false
        menuTableView.register(menuTableViewCellNib, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    private func setUpMenuButton() {
        self.menuButton.layer.cornerRadius = 0.5 * self.menuButton.frame.width
        self.menuButton.clipsToBounds = true
    }
    
    private func setUpGroupButton() {
        self.groupButton.layer.cornerRadius = 0.18 * self.groupButton.frame.width
        self.groupButton.clipsToBounds = true
    }
    
    private func toggleMenuViewAppearance() {
        self.isMenuViewAppeared.toggle()
        self.menuButton.isEnabled.toggle()
        self.menuButton.alpha = self.menuButton.alpha == 0 ? 1 : 0
    }
    
    private func updateAnnotationsOnMapView(cleanse: Bool = false) {
        if cleanse {
            homeMapView.removeAnnotations(homeMapView.annotations)
        }
        let annotations = DataBase.shared.users.map(UserAnnotation.init)
      //  homeMapView.addAnnotations(annotations)
    }

}

extension HomeViewController: LocationServiceDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("-=- auth status did change \(status)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        print("-=- db state before \(DataBase.primaryUser?.location)")
//
//        if let firstLocation = locations.first, let primaryUser = DataBase.primaryUser {
//            primaryUser.location = firstLocation.coordinate
//            updateAnnotationsOnMapView(cleanse: true)
//
//        }
//
        print("-=- db state after \(DataBase.primaryUser?.location)")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("-=- ERROR: location manager failed to fetch")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier) as! MenuTableViewCell
        cell.menuTitle = descriptionArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
