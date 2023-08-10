//
//  EdititemsVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 11/07/2023.
//

import UIKit

class EdititemsVC: UIViewController {
    
    @IBOutlet weak var Blackbtn : UIButton!
    @IBOutlet weak var categoryView : UIView!
    @IBOutlet weak var featuredView : UIView!
    //@IBOutlet weak var

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    

    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func SubmitBTbn (_ sender :UIButton)
    {
       
    }
    @IBAction func CategoryBTbn (_ sender :UIButton)
    {
        Blackbtn.isHidden = false
        categoryView.isHidden = false
        featuredView.isHidden = true
    }
    @IBAction func FeaturedBTbn (_ sender :UIButton)
    {
        Blackbtn.isHidden = false
        categoryView.isHidden = true
        featuredView.isHidden = false
        
    }

    @IBAction func blackBtt (_ sender :UIButton)
    {
        Blackbtn.isHidden = true
        categoryView.isHidden = true
        featuredView.isHidden = true
    }

}
extension EdititemsVC : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
