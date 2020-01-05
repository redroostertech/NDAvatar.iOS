//
//  AvatarViewController.swift
//  AvatarImageView
//
//  Created by Dave Glassco on 1/5/20.
//

import UIKit

@IBDesignable
public class AvatarViewController: UIView {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet public var avatarImageView: AvatarImageView!
    
//    var color: UIColor? {
//        didSet {
//            avatarView.backgroundColor = color
//        }
//    }
    
    //MARK: - Initializers and Overrides
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        if let bundle = Bundle(identifier: "com.neone.avatarview") {
            bundle.loadNibNamed("AvatarView", owner: self, options: nil)
            addSubview(avatarView)
            avatarView.frame = self.bounds
            avatarView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
        
    }
    
    public override func awakeFromNib() {
    super.awakeFromNib()
    
     
    }

}
