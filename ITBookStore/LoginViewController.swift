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

    
     var loggedIn = false
    //var validEmail = false
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var txtEmail: UITextField!
        {
        didSet {
            self.txtEmail.tintColor = UIColor.black
            if let image = UIImage(named: "usericon"){
            self.txtEmail.setIcon(image)
            }
        }
    }
    
    @IBOutlet weak var txtPassword: UITextField!
        {
        didSet {
            self.txtPassword.tintColor = UIColor.black
            if let image = UIImage(named: "passwordicon"){
                self.txtPassword.setIcon(image)
            }
        }
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        var email = self.txtEmail.text!
        var password = self.txtPassword.text!
        
       
        let userDefault = UserDefaults.standard
        
        if let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: plist)
            {
                if let users = dict["Users"] as? [[String:Any]]
                {
                    for user in users
                    {
                        
                       // if email.validateEmail(){
                       //     print("valid email")
                        
                            if ( (email == (user["userEmail"] as! String)) && (password == (user["password"] as! String)) ){
                                
                                
                                if self.switchRememberMe.isOn
                                {
                                    userDefault.setValue(self.txtEmail.text, forKey: "userEmail")
                                    userDefault.set(self.txtPassword.text, forKey: "userPassword")
                                    
                                    
                                    
                                }
                                else
                                {
                                    userDefault.removeObject(forKey: "userEmail")
                                    userDefault.removeObject(forKey: "userPassword")
                                    
                                }
                                self.performSegue(withIdentifier: "toTheMenu", sender: nil)
                                loggedIn = true
                           // }
                           
                            
                        }else{
                            
                        }
                    }
                }
            }
        }
         //   else{
           //     print("invalid email")

            
        if !loggedIn{
//            if email.validateEmail(){
//
//            let alert = UIAlertController(title: "Error", message: "User Email is incorrect", preferredStyle: UIAlertController.Style.alert)
//
//            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//            let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
//            alert.addAction(actionOk)
//            alert.addAction(actionCanel)
//            self .present(alert, animated: true ,completion: nil)
//            }
//             else {
                let alert = UIAlertController(title: "Error", message: "User Email / Password Incorrect", preferredStyle: UIAlertController.Style.alert)
                
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(actionOk)
                alert.addAction(actionCanel)
                self .present(alert, animated: true ,completion: nil)
            }
        }
    
   //keyboard disappear user touches on screen
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


