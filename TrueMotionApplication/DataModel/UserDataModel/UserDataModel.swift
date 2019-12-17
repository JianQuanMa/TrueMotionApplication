//
//  UserDataModel.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 12/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit
import CoreLocation

enum GroupDataModel{
    case name
    case owner
    case members
}

class UserDataModel{
    var name: String
    var photo: UIImage?
    var location: CLLocationCoordinate2D
    var groups: [GroupDataModel]
    
    init(name: String, photo: UIImage?, location: CLLocationCoordinate2D, groups: [GroupDataModel]) {
        self.name = name
        self.photo = photo
        self.location = location
        self.groups = groups
    }
}
