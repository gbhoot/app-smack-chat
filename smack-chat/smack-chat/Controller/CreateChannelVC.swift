//
//  CreateChannel.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/11/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelNameTxt: UITextField!
    @IBOutlet weak var channelDescriptionTxt: UITextField!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var createChannelBtn: RoundedButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        createChannelBtn.isEnabled = false
        exitBtn.isEnabled = false
        
        guard let channelName = channelNameTxt.text , channelNameTxt.text != "" else { return }
        guard let channelDesc = channelDescriptionTxt.text else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func setupView() {
        spinner.isHidden = true
        createChannelBtn.isEnabled = true
        exitBtn.isEnabled = true
        
        channelNameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: PLACEHOLDER_TEXT])
        channelDescriptionTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: PLACEHOLDER_TEXT])
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(CreateChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
