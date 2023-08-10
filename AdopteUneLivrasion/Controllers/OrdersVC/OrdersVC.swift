//
//  OrdersVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 16/06/2023.
//

import UIKit

class OrdersVC: UIViewController {

    @IBOutlet weak var orderview : UIView!
    @IBOutlet weak var backgroundView : UIView!
    @IBOutlet weak var acceptbackgroundView : UIButton!
    @IBOutlet weak var acceptView : UIView!
    @IBOutlet weak var colOrders : UICollectionView!
    @IBOutlet weak var tblOrderscustomers : UITableView!
    
    var statusmodel = [OrderstatusModel]()
    var homeordersmodel = [HomeordersModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        fetchorderStatus()
        fetchOrders()
    }
    
    func fetchorderStatus(){
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/order_statuses")!,timeoutInterval: Double.infinity)
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
                            self.statusmodel.append(OrderstatusModel(fromDictionary: jsonItem))
                            
                        }
                        DispatchQueue.main.async {
                            self.colOrders.reloadData()
                        }
                        
                        // Perform UI updates or any other processing with the appended data here
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
    func fetchOrders(){
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/orders")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
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
                            self.homeordersmodel.append(HomeordersModel(fromDictionary: jsonItem))
                        }
                        DispatchQueue.main.async {
                            self.tblOrderscustomers.reloadData()
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
    @IBAction func Closeorderview (_ sender : UIButton)
    {
        self.tabBarController?.tabBar.isHidden = false
        orderview.isHidden = true
        backgroundView.isHidden = true
    }
    @IBAction func rejectBtn (_ sender : UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RejectVC") as! RejectVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func acceptBtn (_ sender : UIButton)
    {
        acceptbackgroundView.isHidden = false
        acceptView.isHidden = false
    }
    @IBAction func cancelacceptBtn (_ sender : UIButton)
    {
        acceptbackgroundView.isHidden = true
        acceptView.isHidden = true
    }
    @IBAction func lessacceptBtn (_ sender : UIButton)
    {
        acceptbackgroundView.isHidden = true
        acceptView.isHidden = true
    }

}
extension OrdersVC: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statusmodel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrdersCVC
        if let labelText = statusmodel[indexPath.row].descriptionField {
            if let firstCharacter = labelText.first {
                let capitalizedFirstLetter = String(firstCharacter).uppercased()
                let remainingString = String(labelText.dropFirst())
                let finalLabelText = capitalizedFirstLetter + remainingString
                cell.lbl.text = finalLabelText
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let labelText = statusmodel[indexPath.row].descriptionField
        let labelWidth = calculateLabelWidth(for: labelText ?? "")
        let cellHeight: CGFloat = 40 // Set the desired height of the cell
        return CGSize(width: labelWidth, height: cellHeight)
           
       
    }
    func calculateLabelWidth(for text: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 14) // Customize the font as needed
        let label = UILabel()
        label.font = font
        label.text = text
        label.sizeToFit()
        let labelWidth = label.frame.width
        return labelWidth
    }
    
}
extension OrdersVC : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeordersmodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? OrderscustomersTVC
        cell?.paidstatus.setTitle(homeordersmodel[indexPath.row].paymentStatus, for: .normal)
        cell?.deliveredStatus.setTitle(homeordersmodel[indexPath.row].deliveryStatus, for: .normal)
        cell?.deliverystatus.setTitle(homeordersmodel[indexPath.row].deliveryStatus, for: .normal)
        cell?.ordernumber.text = "Order #\(homeordersmodel[indexPath.row].orderId!)"
        cell?.time.text = homeordersmodel[indexPath.row].dateForHumans
        cell?.itemsCount.text = String(homeordersmodel[indexPath.row].items.count) + " Items for " + homeordersmodel[indexPath.row].client.firstName + " " + homeordersmodel[indexPath.row].client.lastName
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tabBarController?.tabBar.isHidden = true
        orderview.isHidden = false
        backgroundView.isHidden = false
        
    }
    
}
