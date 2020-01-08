//
//  AvatarHelper.swift
//  Neone.net
//
//  Created by Dave Glassco on 8/13/19.
//  Copyright © 2019 Neone. All rights reserved.
//

import Foundation
import NDAvatarView
import UIKit

class AvatarHelper {
    
    static func setDefaultAvatar(displayName: String, avatarString: String? = nil, avatarImage: UIImage? = nil, avatarView: AvatarViewController) {
        
        let avatarData = AvatarViewData(displayName: displayName, avatarString: avatarString, avatarImage: avatarImage, isRound: true, borderWidth: 2, borderColor: UIColor.white)
        avatarView.configureAvatarView(avatarViewData: avatarData)
    }
    
}
