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
    
    static func setDefaultAvatar(displayName: String, avatarString: String? = nil, avatarImage: UIImage? = nil, isRound: Bool = false, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.white, avatarView: AvatarViewController) {
        
        let avatarData = AvatarViewData(displayName: displayName, avatarString: avatarString, avatarImage: avatarImage, isRound: isRound, borderWidth: borderWidth, borderColor: borderColor)
        avatarView.configureAvatarView(avatarViewData: avatarData)
    }
}
