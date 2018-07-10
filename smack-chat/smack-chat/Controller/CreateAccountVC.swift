//
//  CreateAccountVC.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/7/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
//                print("registered user")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
//                        print("logged in user!", AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarColor: self.avatarColor, avatarName: self.avatarName, completion: { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
//                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func chooseBGColorPressed(_ sender: Any) {
    }
}
