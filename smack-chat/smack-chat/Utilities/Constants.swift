//
//  Constants.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL                    =   "https://chattychatdelpoy.herokuapp.com/v1/"
let URL_REGISTER                =   "\(BASE_URL)account/register"
let URL_LOGIN                   =   "\(BASE_URL)account/login"
let URL_ADD_USER                =   "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL           =   "\(BASE_URL)user/byEmail/"

// Colors
let PLACEHOLDER_TEXT            =   #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.7764705882, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE  =   Notification.Name("notificationDataChanged")


// Segues
let TO_LOGIN                    =   "toLogin"
let TO_CREATE                   =   "toCreate"
let UNWIND                      =   "unwindToChannel"
let TO_AVATAR_PICKER            =   "toAvatarPicker"


// User Defaults
let TOKEN_KEY                   =   "token"
let LOGGED_IN_KEY               =   "loggedIn"
let USER_EMAIL                  =   "userEmail"

// Headers
let HEADER                      =   [
                                    "Content-Type": "application/json; charset=utf-8"
                                ]
let BEARER_HEADER               =   [
                                    "Authorization": "Bearer \(AuthService.instance.authToken)",
                                    "Content-Type": "application/json; charset=utf-8"
                                ]

