//
//  Localdatamanager.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 12/16/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import CoreData

final class Coremanager{
    private init(){}
    static let sharedCoreManager = Coremanager()
    
    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocalDataManager")
        container.loadPersistentStores(completionHandler: { (_, err) in
            if let error = err{
                fatalError(error.localizedDescription)
            }
        })
        return container
    }()
    
    
}
