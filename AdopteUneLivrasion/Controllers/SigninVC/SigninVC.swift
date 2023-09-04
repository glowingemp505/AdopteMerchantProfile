//
//  SigninVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 15/06/2023.
//

import UIKit

class SigninVC: BaseVC {

    @IBOutlet weak var passwordTF :UITextField!
    @IBOutlet weak var EmailTF : UITextField!
    @IBOutlet weak var eyeimg : UIImageView!
    @IBOutlet weak var namelbl : UILabel!
    @IBOutlet weak var namelblTF : UITextField!
    @IBOutlet weak var namelblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passlbl : UILabel!
    @IBOutlet weak var passlblTF : UITextField!
    @IBOutlet weak var passlblTopConstraint: NSLayoutConstraint!

//    @IBOutlet weak var
    var checkeye = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        passwordTF.isSecureTextEntry = true
        namelbl.isUserInteractionEnabled = true
        passlbl.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        namelbl.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(passTapped(_:)))
        passlbl.addGestureRecognizer(tapGesture2)
        
    }

    
        @objc func labelTapped(_ sender: UITapGestureRecognizer) {
            namelblTopConstraint.constant = 12
            namelblTF.isUserInteractionEnabled = true
            namelblTF.becomeFirstResponder()
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    @objc func passTapped(_ sender: UITapGestureRecognizer) {
        passlblTopConstraint.constant = 12
        passlblTF.isUserInteractionEnabled = true
        passlblTF.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    


    @IBAction func passwordHidebtn(_ sender: UIButton)
    {
        if checkeye == true
    {
         eyeimg.image = UIImage(named: "ic_unhide")
         passwordTF.isSecureTextEntry = false
         checkeye = false
    }
    else
    {
        eyeimg.image = UIImage(named: "ic_hide")
        passwordTF.isSecureTextEntry = true
        checkeye = true
    }
       
    }
    @IBAction func Signinbtn(_ sender: UIButton)
    {
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .SignupVC) as! SignupVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func forgotBtn(_ sender: UIButton)
    {
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewController(withIdentifier: .ForgotVC) as! ForgotVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtn(_ sender: UIButton)
    {
       // SceneDelegate.shared().checkUserLoggedIn2()
        
        Utility.shared.showSpinner()
        var dic = Dictionary<String,AnyObject>()
     
        
        dic["username"] = namelblTF.text as AnyObject
        dic["password"] = passwordTF.text as AnyObject
        dic["login_type"] = "merchants" as AnyObject
        
        ALF.shared.doPostData(parameters: dic, method: "/api/login", success: { (response) in
            Utility.shared.hideSpinner()
            print(response)
            
            if let status = response["status_code"] as? Int {
                        if status == 200 {
                            if let dataAccess = response["data"] as? [String: AnyObject] {
                                let user = UserModel(fromDictionary: dataAccess)
                                user.accesstoken = dataAccess["access_token"] as? String
                                print (user.accesstoken)
                            }
                            if let data = response["data"] as? [String: AnyObject],
                             let userDict = data["user"] as? [String: AnyObject] {
                                
                                let user = UserModel(fromDictionary: userDict)
                                
                                Utility.saveDictionary(dict: data, key: "user")
                            }
                            SceneDelegate.shared().checkUserLoggedIn2()
                    
                } else {
                    self.showTool(msg: response["message"] as! String, state: .error)
                }
            } else {
                self.showTool(msg: response["message"] as! String, state: .error)
            }
            
        }) { (response) in
            Utility.shared.hideSpinner()
            print(response)
        }
        
    }

}
