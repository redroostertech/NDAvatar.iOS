//
//  AvatarImageExampleData.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import Foundation
import UIKit

struct ExampleData: AvatarImageViewDataSource {
    var name: String
    var avatar: UIImage?
    
    init() {
        name = ExampleData.randomName()
    }
    
    static func randomName() -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let charSetArray = charSet.map { String($0) }
        
        var string = ""
        
        for _ in 0..<5 {
            string += charSetArray[Int(arc4random()) % charSetArray.count]
        }
        
        string += " "
        
        for _ in 0..<5 {
            string += charSetArray[Int(arc4random()) % charSetArray.count]
        }
        
        return string
    }
}

struct NeoneData: AvatarImageViewDataSource {
    var name: String
    var avatar: UIImage?
    var bgColor: UIColor?
    
    init() {
        name = "D G"
        let neoneOrange = hexStringToUIColor(hex: "F88220")
        bgColor = neoneOrange
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
