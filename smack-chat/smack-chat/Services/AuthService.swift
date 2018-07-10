//
//  AuthService.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let body : [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
//    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
//
//        let lowerCaseEmail = email.lowercased()
//        let body : [String: Any] = [
//            "email": lowerCaseEmail,
//            "password": password
//        ]
//
//        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
//
//            if response.result.error == nil {
//                let resultDict = response.result.value as? Dictionary<String, Any> {
//                    if let emailDict = resultDict["user"] as? String {
//                        self.userEmail = emailDict
//                    }
//                    if let tokenDict = resultDict["token"] as? String {
//                        self.authToken = tokenDict
//                    }
//                }
//
//
//
//                completion(true)
//            } else {
//                completion(false)
//                debugPrint(response.result.error as Any)
//            }
//        }
//    }
}
