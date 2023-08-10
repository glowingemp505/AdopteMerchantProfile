//
//  ForgotVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 15/06/2023.
//

import UIKit

class ForgotVC: UIViewController {

    @IBOutlet weak var namelbl : UILabel!
    @IBOutlet weak var namelblTF : UITextField!
    @IBOutlet weak var namelblTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelbl.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        namelbl.addGestureRecognizer(tapGesture)
        self.navigationController?.isNavigationBarHidden = true
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        namelblTopConstraint.constant = 12
        namelblTF.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
