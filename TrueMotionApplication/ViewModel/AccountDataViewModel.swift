//
//  AccountDataViewModel.swift
//  TrueMotionApplication
//
//  Created by Jian Ma on 12/16/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//
protocol AccountDataViewModelDelegate: class {
    func updateView()
}

let accountDataModelShared = AccountDataViewModel.accountDataViewModelShared

final class AccountDataViewModel{
    static let accountDataViewModelShared = AccountDataViewModel()
    private init(){}
    
    weak var accountDataViewModelDelegate: AccountDataViewModelDelegate?
    
    var userDataModel = UserDataModel(name: "Jian", photo: #imageLiteral(resourceName: "icons8-female-user-100.png"), location: Constants.boston.self, groups: []){
        didSet{
            accountDataViewModelDelegate?.updateView()
        }
    }
}
