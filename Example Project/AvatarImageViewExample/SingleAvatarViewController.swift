//
//  ViewController.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import AvatarImageView


class SingleAvatarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var setToShowPic: Bool?
    var borderWidths = [Int](0...15)
    var borderWidth: Int?

    
    @IBOutlet var avatarView: AvatarViewController!
    
    @IBOutlet weak var setToButton: UIButton!
    @IBOutlet weak var roundMaskSwitch: UISwitch!
    @IBOutlet weak var showBorderSwitch: UISwitch!
    @IBOutlet weak var borderTextField: UITextField!
    @IBOutlet weak var roundCornersSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        showProfilePicture()
        setToShowPic = true
        
        createPickerView()
        dismissPickerView()
       
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
    
    @IBAction func chooseBorderColorTapped(_ sender: Any) {
        
        let popoverVC = storyboard?.instantiateViewController(withIdentifier: "colorPickerPopover") as! ColorPickerViewController
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 284, height: 446)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
            popoverController.permittedArrowDirections = .any
            popoverController.delegate = self
            popoverVC.delegate = self
        }
        present(popoverVC, animated: true, completion: nil)
        
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

extension SingleAvatarViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return borderWidths.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowTitle = String(row)
        return rowTitle
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        borderWidth = borderWidths[row]
        let textTitle = String(row)
        borderTextField.text = textTitle
        
        avatarView.borderWidth = CGFloat(row)
        
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        borderTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        borderTextField.inputAccessoryView = toolBar
    }
    
    @objc func action() {
       view.endEditing(true)
    }

    
    
}
