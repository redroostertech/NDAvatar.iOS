//
//  SaveImageUtility.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 11/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import UIKit
import XCTest
@testable import AvatarImageView

// THIS SHOULD NOT RUN AS PART OF A NORMAL TEST RUN. It is meant to be used to save generated images to then compare them in unit tests.
// This test case is disabled in the scheme.
class SaveImageUtility: XCTestCase {
    
    func testSaveImage() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: CGRectMake(0, 0, 100, 100))
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
//        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let imageData = UIImagePNGRepresentation(imageFrom(avatarImageView))
        let simluatorDesktopPath = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .UserDomainMask, true).first!
        let splitPath = simluatorDesktopPath.componentsSeparatedByString("/")
        let path = "/\(splitPath[1])/\(splitPath[2])/Desktop/image.png"
        
        NSFileManager.defaultManager().createFileAtPath(path, contents: imageData, attributes: nil)
    }
    
    func imageFrom(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        let context = UIGraphicsGetCurrentContext()!
        view.layer.renderInContext(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}