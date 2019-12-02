//
//  UserDataModel.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 12/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit
import MapKit

enum GroupDataModel{
    case name
    case owner
    case members
}

struct UserDataModel{
    let name: String
    let photo: UIImage?
    let location: MKUserLocation
    let groups: [GroupDataModel]
    
}
