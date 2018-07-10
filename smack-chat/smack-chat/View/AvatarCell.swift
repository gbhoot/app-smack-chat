//
//  AvatarCell.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/10/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    // Outlets
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true // Will make sure the view does not spill outside of the corner radius
    }
}
