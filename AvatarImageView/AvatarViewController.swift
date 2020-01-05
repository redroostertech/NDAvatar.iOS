//
//  AvatarViewController.swift
//  AvatarImageView
//
//  Created by Dave Glassco on 1/5/20.
//

import UIKit

public class AvatarViewController: UIViewController {

    public init() {
        super.init(nibName: "AvatarView", bundle: Bundle(for: AvatarViewController.self))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
