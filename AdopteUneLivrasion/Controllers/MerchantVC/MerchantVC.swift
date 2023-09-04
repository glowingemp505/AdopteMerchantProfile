//
//  MerchantVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 16/06/2023.
//

import UIKit

class MerchantVC: UIViewController {
    
    @IBOutlet weak var BackgroundPayoutview : UIButton!
    @IBOutlet weak var Payoutview : UIView!
    @IBOutlet weak var setPayoutview : UIView!
    @IBOutlet weak var earningsLbl : UILabel!
    @IBOutlet weak var foodLbl : UILabel!
    @IBOutlet weak var tblhistory : UITableView!
    @IBOutlet weak var paidtblhistory : UITableView!
    @IBOutlet weak var resturant_nameLbl: UILabel!
    @IBOutlet weak var resturant_nameTF: UITextField!
    @IBOutlet weak var resturant_nameTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var setPayoutviewConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var Paypalview : UIView!
    @IBOutlet weak var PayalBtnview : UIView!
    @IBOutlet weak var PaypalBtnLbl : UILabel!
    
    @IBOutlet weak var Stripeview : UIView!
    @IBOutlet weak var StripeBtnview : UIView!
    @IBOutlet weak var StripeBtnLbl : UILabel!
    
    @IBOutlet weak var Bankview : UIView!
    @IBOutlet weak var BankBtnview : UIView!
    @IBOutlet weak var BankBtnLbl : UILabel!
    
    
    var transactionmodel = [TransactionModel]()
    var order = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       if order == 0
        {
           PayalBtnview.backgroundColor = UIColor(hexString: "009FE7")
           PaypalBtnLbl.textColor = .white
           Paypalview.isHidden = false
           
       }
        else
        {
            PayalBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
            PaypalBtnLbl.textColor = .black
            Paypalview.isHidden = true
        }
        if order == 1
         {
            StripeBtnview.backgroundColor = UIColor(hexString: "009FE7")
            StripeBtnLbl.textColor = .white
            Stripeview.isHidden = false
            
        }
         else
         {
             StripeBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
             StripeBtnLbl.textColor = .black
             Stripeview.isHidden = true
         }
        if order == 2
         {
            BankBtnview.backgroundColor = UIColor(hexString: "009FE7")
            BankBtnLbl.textColor = .white
            Bankview.isHidden = false
            
        }
         else
         {
             BankBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
             BankBtnLbl.textColor = .black
             Bankview.isHidden = true
         }
        
        addTapGesture(to: resturant_nameLbl, selector: #selector(resturantTapped(_:)))
        BackgroundPayoutview.isHidden = true
        Payoutview.isHidden = true
        setPayoutview.isHidden = true
        earningsLbl.text = UserDefaults.standard.value(forKey: "earnings") as? String
        foodLbl.text = UserDefaults.standard.value(forKey: "totalorders") as? String
        fetchtransaction()
        paidtblhistory.isHidden = true
            }
    func addTapGesture(to label: UILabel, selector: Selector) {
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        label.addGestureRecognizer(tapGesture)
    }
    @objc func resturantTapped(_ sender: UITapGestureRecognizer) {
        resturant_nameTopConstraint.constant = 12
        resturant_nameTF.isUserInteractionEnabled = true
        resturant_nameTF.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        setPayoutview.isHidden = true
        BackgroundPayoutview.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true

    }
    
    @IBAction func paypalBtn (_ sender : UIButton)
    {
        PayalBtnview.backgroundColor = UIColor(hexString: "009FE7")
        PaypalBtnLbl.textColor = .white
        Paypalview.isHidden = false
        order = 0
        StripeBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        StripeBtnLbl.textColor = .black
        Stripeview.isHidden = true
        BankBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        BankBtnLbl.textColor = .black
        Bankview.isHidden = true
        
        
    }
    @IBAction func stripeBtn (_ sender : UIButton)
    {
        StripeBtnview.backgroundColor = UIColor(hexString: "009FE7")
        StripeBtnLbl.textColor = .white
        Stripeview.isHidden = false
        order = 1
        BankBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        BankBtnLbl.textColor = .black
        Bankview.isHidden = true
        PayalBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        PaypalBtnLbl.textColor = .black
        Paypalview.isHidden = true
    }
    @IBAction func bankBtn (_ sender : UIButton)
    {
        //F2F2F7
        BankBtnview.backgroundColor = UIColor(hexString: "009FE7")
        BankBtnLbl.textColor = .white
        Bankview.isHidden = false
        order = 2
        PayalBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        PaypalBtnLbl.textColor = .black
        Paypalview.isHidden = true
        StripeBtnview.backgroundColor = UIColor(hexString: "F2F2F7")
        StripeBtnLbl.textColor = .black
        Stripeview.isHidden = true
    }
    
    @IBAction func payoutBtn(_ sender : UIButton)
    {
        BackgroundPayoutview.isHidden = false
        Payoutview.isHidden = false
        setPayoutview.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    
    @IBAction func historyBtn(_ sender : UIButton)
    {
        
        tblhistory.isHidden = false
        paidtblhistory.isHidden = true
        transactionmodel.removeAll()
        fetchtransaction()
        
    }
    
    @IBAction func PiadhistoryBtn(_ sender : UIButton)
    {
        transactionmodel.removeAll()
        paidtblhistory.isHidden = false
        tblhistory.isHidden = true
        fetchpayouttransaction()
        
    }
    
    @IBAction func infoBtn(_ sender : UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InformationVC") as! InformationVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @IBAction func addressBtn(_ sender : UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressVC") as! AddressVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @IBAction func settingsBtn(_ sender : UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction func storehoursBtn(_ sender : UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StorehoursVC") as! StorehoursVC
        self.navigationController?.pushViewController(vc, animated: true)

    }

    @IBAction func setpayoutBtn(_ sender : UIButton)
    {
        BackgroundPayoutview.isHidden = false
        Payoutview.isHidden = true
        setPayoutview.isHidden = false
        //self.tabBarController?.tabBar.isHidden = true
    }
    @IBAction func CloseSetpayout(_ sender : UIButton)
    {
        BackgroundPayoutview.isHidden = true
        Payoutview.isHidden = true
        setPayoutview.isHidden = true
        //self.tabBarController?.tabBar.isHidden = true
    }

    func fetchpayouttransaction()
    
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/utilities/transaction_payout?transaction_type=payout&status=paid")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataArray = jsonObject["data"] as? [[String: Any]] {
                        
                        for jsonItem in dataArray {
                            self.transactionmodel.append(TransactionModel(fromDictionary: jsonItem))
                        }
                        DispatchQueue.main.async {
                            self.paidtblhistory.reloadData()
                        }
                        
                        
                    } else {
                        print("Error: Unable to parse JSON data.")
                    }
                } catch {
                    print("Error decoding response data: \(error)")
                }
            }
            
            task.resume()
            
        }
    }
    func fetchtransaction()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/utilities/transaction_payout")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataArray = jsonObject["data"] as? [[String: Any]] {
                        
                        for jsonItem in dataArray {
                            self.transactionmodel.append(TransactionModel(fromDictionary: jsonItem))
                        }
                        DispatchQueue.main.async {
                            self.tblhistory.reloadData()
                        }
                        
                        
                    } else {
                        print("Error: Unable to parse JSON data.")
                    }
                } catch {
                    print("Error decoding response data: \(error)")
                }
                
                
            }
            
            task.resume()
            
        }
    }
    
}
extension MerchantVC : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblhistory
        {
            return transactionmodel.count
        }
        else
        {
            return transactionmodel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblhistory
        {
            let vc = tableView.dequeueReusableCell(withIdentifier: "cell")
            return vc!
        }
        else
        {
            let vc = tableView.dequeueReusableCell(withIdentifier: "cell")
            return vc!
        }
    }
    
    
}
