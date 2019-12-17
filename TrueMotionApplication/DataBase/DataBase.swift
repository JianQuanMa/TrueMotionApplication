//
//  DataBase.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 12/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
import CoreLocation
import MapKit

enum Constants {
    static let boston = CLLocationCoordinate2D(latitude: 42.360081, longitude: -71.058884)
    static let newYork = CLLocationCoordinate2D(latitude: 40.712776, longitude: -74.005974)
    static let me = "Jian Ma"
    static let sanFran = CLLocationCoordinate2D(latitude: 37.774929, longitude: -122.419418)
}

final class DataBase {
    
    private(set) var users: [UserDataModel]
    
    static let shared = DataBase(users: [
        .init(name: Constants.me, photo: nil, location: Constants.sanFran, groups: [.members]),
        .init(name: "second user", photo: nil, location: Constants.newYork, groups: [.members]),
        .init(name: "third user", photo: nil, location: Constants.boston, groups: [.members]),

    ])
    
    private init(users: [UserDataModel]) {
        self.users = users
    }
    
    static var primaryUser: UserDataModel? {
        return shared.users.first(where: {
            $0.name == Constants.me
        })
    }
}

class UserAnnotation: NSObject, MKAnnotation {
    
    let user: UserDataModel
    
    var coordinate: CLLocationCoordinate2D {
        return user.location
    }
    
    init(user: UserDataModel) {
        self.user = user
    }
    
    var subtitle: String? {
        return user.name
    }
    
}
