//
//  UserDataService.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/10/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id             =   ""
    public private(set) var avatarColor     =   ""
    public private(set) var avatarName      =   ""
    public private(set) var email           =   ""
    public private(set) var name            =   ""
    
    func setUserData(ID: String, avatarColor: String , avatarName: String, email: String, name: String) {
        self.id = ID
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
