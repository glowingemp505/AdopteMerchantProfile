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
    @IBOutlet weak var earningsLbl : UILabel!
    @IBOutlet weak var foodLbl : UILabel!
    @IBOutlet weak var tblhistory : UITableView!
    @IBOutlet weak var paidtblhistory : UITableView!
    var transactionmodel = [TransactionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundPayoutview.isHidden = true
        Payoutview.isHidden = true
        earningsLbl.text = UserDefaults.standard.value(forKey: "earnings") as? String
        foodLbl.text = UserDefaults.standard.value(forKey: "totalorders") as? String
        fetchtransaction()
        paidtblhistory.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    @IBAction func payoutBtn(_ sender : UIButton)
    {
        BackgroundPayoutview.isHidden = false
        Payoutview.isHidden = false
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
