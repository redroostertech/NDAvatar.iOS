//
//  ViewController.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import AvatarImageView


class SingleAvatarViewController: UIViewController {
    
    var setToShowPic: Bool?
    
    @IBOutlet var avatarView: AvatarViewController!
    
    @IBOutlet weak var setToButton: UIButton!
    @IBOutlet weak var roundMaskSwitch: UISwitch!
    @IBOutlet weak var showBorderSwitch: UISwitch!
    @IBOutlet weak var roundCornersSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        showProfilePicture()
        setToShowPic = true
}
    
    @IBAction func setToTapped(_ sender: Any) {
        if setToShowPic == true {
            setToShowPic = false
            setToButton.setTitle("Show Profile Pic", for: .normal)
            showInitials()
            
        } else {
            setToShowPic = true
            setToButton.setTitle("Show Initials", for: .normal)
            showProfilePicture()
        }
    }
    
    @IBAction func maskSwitchTapped(_ sender: Any) {
        
        if roundMaskSwitch.isOn == true{
            avatarView.setToRound()
        }
        if roundMaskSwitch.isOn == false{
            avatarView.setToDefault()
        }
    }
    
    
    @IBAction func borderSwitchTapped(_ sender: Any) {
        
        if showBorderSwitch.isOn == true {
            avatarView.borderWidth = 2
            avatarView.borderColor = UIColor.white
        }
        if showBorderSwitch.isOn == false {
            avatarView.borderWidth = 0
        }
    }
    
    @IBAction func roundCornersSwitchTapped(_ sender: Any) {
        
        if roundCornersSwitch.isOn == true {
          avatarView.cornerRoundness = 30
        }
        if roundCornersSwitch.isOn == false {
            avatarView.cornerRoundness = 0
        }
        
    }
    
    
    
    //    func addViewProgramatically() {
//        struct DataSource: AvatarImageViewDataSource {}
//        let avatarImageView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        avatarImageView.dataSource = DataSource()
//        view.addSubview(avatarImageView)
//
//    }
    
//    func configureRoundAvatar() {
//        struct Config: AvatarImageViewConfiguration { var shape: Shape = .circle }
//        avatarView.avatarImageView.configuration = Config()
//    }
    
    func configureHexagonAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .mask(image: UIImage(named: "hexagon")!) }
        avatarView.avatarImageView.configuration = Config()
    }
    
    func configureRoundAvatarWithCustomFont() {
        struct Config: AvatarImageViewConfiguration {
            var shape: Shape = .circle
            var fontName: String? = "Futura-Medium"
            
        }
        avatarView.avatarImageView.configuration = Config()
    }
    
    func showProfilePicture() {
        var data = ExampleData()
        data.avatar = UIImage(named: "profile_pic")!
        avatarView.avatarImageView.dataSource = data
       
    }
    
    func showInitials() {
        avatarView.avatarImageView.dataSource = ExampleData()
    }
}

