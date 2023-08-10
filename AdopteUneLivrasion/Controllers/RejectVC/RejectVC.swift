//
//  RejectVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 09/07/2023.
//

import UIKit

class RejectVC: UIViewController {
    
    var rejectlbl = ["Out of items()","Kitchen closed","There is no Possibility of fulfilling the order.","Today we are no longer delivering","Too long waiting time.","No ingredient.","Customer called to cancel","Restaurant too busy","other"]
    @IBOutlet weak var reasonLbl : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reasonLbl.text = ""
    }
    
    @IBAction func crossbtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func closebtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func rejectbtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension RejectVC : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rejectlbl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RejectTVC
        cell.lbl.text = rejectlbl[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reasonLbl.text = rejectlbl[indexPath.row]
    }
    
    
}
