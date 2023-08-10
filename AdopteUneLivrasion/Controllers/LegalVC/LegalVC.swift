//
//  LegalVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 08/07/2023.
//

import UIKit

class LegalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
   
    }
    
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func UpdateBtn (_ sender :UIButton)
    {
       
    }
    


}
