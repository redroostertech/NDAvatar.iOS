//
//  ViewController.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import NDAvatarView


class SingleAvatarViewController:
    UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource,
    UITextFieldDelegate,
    UIPopoverPresentationControllerDelegate,
    ColorPickerDelegate
{
   
    var setToShowPic: Bool?
    var borderWidthArray = [Int](0...15)
    var borderWidth: Int?
    var cornerRadiusArray = [Int](0...100)
    var cornerRadius: Int?
    
    let borderPickerView = UIPickerView()
    let radiusPickerView = UIPickerView()
    
    @IBOutlet var avatarView: AvatarViewController!
    
    @IBOutlet weak var showProfilePic: UISwitch!
    
    @IBOutlet weak var showBorderSwitch: UISwitch!
    @IBOutlet weak var borderWidthStack: UIStackView!
    @IBOutlet weak var borderWidthTextField: UITextField!
    @IBOutlet weak var borderColorStack: UIStackView!
    @IBOutlet weak var borderColorView: UIViewX!
    @IBOutlet weak var chooseBorderColor: UIButton!
    
    @IBOutlet weak var roundCornersSwitch: UISwitch!
    @IBOutlet weak var cornerRadiusTextField: UITextField!
    
    @IBOutlet weak var roundMaskSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProfilePicture()
        avatarView.avatarFrame.borderWidth = 2
        avatarView.avatarFrame.cornerRadius = 30
        setToShowPic = true
        
        createPickerView()
        dismissPickerView()
        
    }
    
    // Override the iPhone behavior that presents a popover as fullscreen
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
    
    @IBAction func showProfilePicTapped(_ sender: Any) {
        
        if showProfilePic.isOn == true {
            showProfilePicture()
        } else {
            showProfilePic.isOn = false
            showInitials()
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
            borderWidthTextField.isEnabled = true
            chooseBorderColor.isEnabled = true
        }
        if showBorderSwitch.isOn == false {
            avatarView.borderWidth = 0
            borderWidthTextField.isEnabled = false
            chooseBorderColor.isEnabled = false
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
    
    @IBAction func chooseBorderColorTapped(_ sender: UIButton) {
        let pickerStoryboard = UIStoryboard.init(name: "ColorPickerPopover", bundle: nil)
        let popoverVC = pickerStoryboard.instantiateViewController(withIdentifier: "colorPickerPopover") as! ColorPickerViewController
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 284, height: 446)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
            popoverController.permittedArrowDirections = .any
            popoverVC.colorPickerDelegate = self
            popoverVC.dismiss(animated: true, completion: nil)
        }
        present(popoverVC, animated: true, completion: nil)
        
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
        avatarView.avatarImageView?.dataSource = data
        borderColorView.backgroundColor = UIColor.white
        
    }
    
    func showInitials() {
        let data = NeoneData()
        avatarView.avatarImageView.dataSource = data
        borderColorView.backgroundColor = UIColor.white
    }
    
    //ColorPickerDelegate
    func colorSelected(color: UIColor) {
        avatarView.borderColor = color
        borderColorView.backgroundColor = color
    }
    
    
}

extension SingleAvatarViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        var count = 1
        
        if pickerView == borderPickerView {
            count = 1
        }
        
        if pickerView == radiusPickerView {
            count = 1
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var count = 0
        
        if pickerView == borderPickerView {
            count = borderWidthArray.count
            
        }
        
        if pickerView == radiusPickerView {
            count = cornerRadiusArray.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var rowTitle = ""
        
        if pickerView == borderPickerView {
            let title = String(row)
            rowTitle = title
        }
        
        if pickerView == radiusPickerView {
            let title = String(row)
            rowTitle = title
        }
        return rowTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == borderPickerView {
            borderWidth = borderWidthArray[row]
            let textTitle = String(row)
            borderWidthTextField.text = textTitle
            avatarView.borderWidth = CGFloat(row)
        }
        
        if pickerView == radiusPickerView {
            cornerRadius = cornerRadiusArray[row]
            let textTitle = String(row)
            cornerRadiusTextField.text = textTitle
            avatarView.cornerRoundness = CGFloat(row)
        }
    }
    
    func createPickerView() {
        
        borderPickerView.delegate = self
        radiusPickerView.delegate = self
        borderWidthTextField.inputView = borderPickerView
        cornerRadiusTextField.inputView = radiusPickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        borderWidthTextField.inputAccessoryView = toolBar
        cornerRadiusTextField.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
    }
}



//    func addViewProgramatically() {
//        struct DataSource: AvatarImageViewDataSource {}
//        let avatarImageView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        avatarImageView.dataSource = DataSource()
//        view.addSubview(avatarImageView)
//
//    }
