//
//  OrderscustomersTVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 24/07/2023.
//

import UIKit

class OrderscustomersTVC: UITableViewCell {

    @IBOutlet weak var paidstatus : UIButton!
    @IBOutlet weak var ordernumber : UILabel!
    @IBOutlet weak var deliverystatus : UIButton!
    @IBOutlet weak var deliveredStatus : UIButton!
    @IBOutlet weak var time : UILabel!
    @IBOutlet weak var itemsCount : UILabel!

//    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
