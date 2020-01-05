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
    

    
    @IBOutlet var avatarView: AvatarViewController!
    
    
    @IBOutlet var avatarImageView: AvatarImageView! {
        didSet {
            configureRoundAvatar() // Comment this line for a square avatar as that is the default.
            showProfilePicture()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var data = ExampleData()
//        struct Config: AvatarImageViewConfiguration { var shape: Shape = .circle }
//        avatarView.avatarImageView.configuration = Config()
        data.avatar = UIImage(named: "profile_pic")!
        avatarView.avatarImageView?.dataSource = data
        
    }
    
    func addViewProgramatically() {
        struct DataSource: AvatarImageViewDataSource {}
        let avatarImageView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        avatarImageView.dataSource = DataSource()
        view.addSubview(avatarImageView)
        
    }
    
    func configureRoundAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .circle }
        avatarView.avatarImageView.configuration = Config()
    }
    
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

