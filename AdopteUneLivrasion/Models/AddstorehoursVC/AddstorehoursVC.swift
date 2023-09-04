//
//  AddstorehoursVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 23/08/2023.
//

import UIKit

class AddstorehoursVC: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
   
}
