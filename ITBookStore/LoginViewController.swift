//
//  ViewController.swift
//  ITBookStore
//
//  Created by Ankita Pabbi on 2019-07-10.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
        {
        didSet {
            self.txtEmail.tintColor = UIColor.lightGray
            if let image = UIImage(named: "usericon"){
            self.txtEmail.setIcon(image)
            }
        }
    }
    
    @IBOutlet weak var txtPassword: UITextField!
        {
        didSet {
            self.txtPassword.tintColor = UIColor.lightGray
            if let image = UIImage(named: "passwordicon"){
                self.txtPassword.setIcon(image)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

