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
//        performSegue(withIdentifier: UNWIND, sender: nil)
        guard let email = emailTxt.text , emailTxt.text != "" else {
            return
        }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print ("registered user!")
            }
        }
    }
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    @IBAction func chooseBGColorPressed(_ sender: Any) {
    }
}
