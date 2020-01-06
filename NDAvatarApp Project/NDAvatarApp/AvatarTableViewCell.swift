//
//  AvatarTableViewCell.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import NDAvatarView

struct TableAvatarImageConfig: AvatarImageViewConfiguration {
    let shape: Shape = .circle
}

class AvatarTableViewCell: UITableViewCell {    
    
    @IBOutlet weak var avatarView: AvatarViewController! {
        didSet {
            avatarView.avatarImageView.configuration = TableAvatarImageConfig()
        }
    }
    
}
