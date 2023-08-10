//
//  HomeVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 16/06/2023.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var colWeeks : UICollectionView!
    @IBOutlet weak var colOrders : UICollectionView!
    @IBOutlet weak var colTotalorders : UICollectionView!
    @IBOutlet weak var tblOrderscustomers : UITableView!
    @IBOutlet weak var tblTopcustomers : UITableView!
    @IBOutlet weak var firstprogress : UIProgressView!
    @IBOutlet weak var secondprogress : UIProgressView!
    @IBOutlet weak var thirdprogress : UIProgressView!
    @IBOutlet weak var fourthprogress : UIProgressView!
    @IBOutlet weak var fifthprogress : UIProgressView!
    @IBOutlet weak var firstprogresslbl : UILabel!
    @IBOutlet weak var secondprogresslbl : UILabel!
    @IBOutlet weak var thirdprogresslbl : UILabel!
    @IBOutlet weak var fourthprogresslbl : UILabel!
    @IBOutlet weak var fifthprogresslbl : UILabel!
    @IBOutlet weak var reviewlbl : UILabel!
    
    @IBOutlet weak var earningslbl : UILabel!
    
    var ColorArray = ["#4AC3A2","#9789E8","#FAB54D","#FD734E"]
    var ColorArray2 = ["#4AC3A2","#9789E8","#FAB54D"]
    var TitileLbl = ["Sales this week","Earning this week","Your monthly earning"]
    var TitileLbl2 = ["Total Orders","Total Cancel","Total refund"]
    var ordersLbl = ["All","Processing","Ready","Completed"]
    var statsModels: StatsModel?
    var statusmodel = [OrderstatusModel]()
    var homeordersmodel = [HomeordersModel]()
    
    var check = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        firstprogress.heightAnchor.constraint(equalToConstant: 12).isActive = true
        secondprogress.heightAnchor.constraint(equalToConstant: 12).isActive = true
        thirdprogress.heightAnchor.constraint(equalToConstant: 12).isActive = true
        fourthprogress.heightAnchor.constraint(equalToConstant: 12).isActive = true
        fifthprogress.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        fetchdata()
        fetchReview()
        fetchorderStatus()
        fetchOrders()
    }
    
    func fetchdata() {
        if let accessToken = Utility.getUser()?.accesstoken {
            Utility.shared.showSpinner()
            
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/order_stats")!, timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                Utility.shared.hideSpinner()
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        print(jsonResponse)
                        let statsModel = StatsModel(fromDictionary: jsonResponse)
                        
                        // Assign the fetched statsModel directly to the statsModel property
                        self.statsModels = statsModel
                        
                        
                        DispatchQueue.main.async {
                            self.earningslbl.text = "$" + (self.statsModels?.totalEarning ?? "")
                            UserDefaults.standard.set(self.earningslbl.text, forKey: "earnings")
                            self.check = 1
                            self.colWeeks.reloadData()
                            self.colOrders.reloadData()
                            self.colTotalorders.reloadData()
                            self.tblOrderscustomers.reloadData()
                            self.tblTopcustomers.reloadData()
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
    func fetchReview(){
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/review_stats")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                          let data = jsonResponse["data"] as? [String: Any],
                          let stats = data["stats"] as? [String: Double],
                          let monthlyReviews = data["monthly_reviews"] as? Int {

                        
                        
                        DispatchQueue.main.async {
                            self.reviewlbl.text = "This month you got \(monthlyReviews) review"
                            
                            self.firstprogress.progress = Float(stats["1 Star"] ?? 0) / 100.0
                            self.firstprogresslbl.text = "\(stats["1 Star"] ?? 0)%"
                            
                            self.secondprogress.progress = Float(stats["2 Star"] ?? 0) / 100.0
                            self.secondprogresslbl.text = "\(stats["2 Star"] ?? 0)%"
                            
                            self.thirdprogress.progress = Float(stats["3 Star"] ?? 0) / 100.0
                            self.thirdprogresslbl.text = "\(stats["3 Star"] ?? 0)%"
                            
                            self.fourthprogress.progress = Float(stats["4 Star"] ?? 0) / 100.0
                            self.fourthprogresslbl.text = "\(stats["4 Star"] ?? 0)%"
                            
                            self.fifthprogress.progress = Float(stats["5 Star"] ?? 0) / 100.0
                            self.fifthprogresslbl.text = "\(stats["5 Star"] ?? 0)%"
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
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if check == 1
        {
            if collectionView == colWeeks
            {
                return 3
            }
            else if collectionView == colOrders
            {
                return statusmodel.count
            }
            else if collectionView == colTotalorders
            {
                return 3
            }
            else
            {
                return 0
            }
        }
        else
        {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colWeeks
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeearningCVC
            cell.backview.backgroundColor = UIColor(hexString: ColorArray[indexPath.row])
            cell.lbl.text = TitileLbl[indexPath.row]
            if indexPath.row == 0
            {
                
                cell.pricelbl.text  = String(statsModels!.weeklySale)
                
            }
            else if indexPath.row == 1
            {
                cell.pricelbl.text  = String(statsModels!.weeklyEarning)
            }
            else
            {
                cell.pricelbl.text  = String(statsModels!.monthlyEarning)
            }
            return cell
        }
        else if collectionView == colTotalorders
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HometotalOrdersCVC
            cell.backview.backgroundColor = UIColor(hexString: ColorArray2[indexPath.row])
            cell.lbl.text = TitileLbl2[indexPath.row]
            if indexPath.row == 0
            {
                
                cell.pricelbl.text  = String(statsModels!.totalOrder)
                UserDefaults.standard.set(cell.pricelbl.text, forKey: "totalorders")
                
            }
            else if indexPath.row == 1
            {
                cell.pricelbl.text  = String(statsModels!.monthlyCancelled)
            }
            else
            {
                cell.pricelbl.text  = String(statsModels!.monthlyRefunded)
            }
            
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeOrdersCVC
            
            
            
            if let labelText = statusmodel[indexPath.row].descriptionField {
                if let firstCharacter = labelText.first {
                    let capitalizedFirstLetter = String(firstCharacter).uppercased()
                    let remainingString = String(labelText.dropFirst())
                    let finalLabelText = capitalizedFirstLetter + remainingString
                    cell.ordersLbl.text = finalLabelText
                }
            }
            
            
            
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colOrders {
            //let item = // Get the item data at indexPath
            
            let labelText = statusmodel[indexPath.row].descriptionField
            let labelWidth = calculateLabelWidth(for: labelText ?? "")
            let cellHeight: CGFloat = 40 // Set the desired height of the cell
            return CGSize(width: labelWidth, height: cellHeight)
        }
        else if  collectionView ==  colTotalorders {
            return CGSize(width: 120, height: 80)
        }
        else {
            return CGSize(width: 160, height: 75)
        }
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

extension HomeVC :UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblOrderscustomers
        {
            return homeordersmodel.count
        }
        else
        {
            return 6
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblOrderscustomers
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? OrderscustomersTVC
            cell?.paidstatus.setTitle(homeordersmodel[indexPath.row].paymentStatus, for: .normal)
            cell?.deliveredStatus.setTitle(homeordersmodel[indexPath.row].deliveryStatus, for: .normal)
            cell?.deliverystatus.setTitle(homeordersmodel[indexPath.row].deliveryStatus, for: .normal)
            cell?.ordernumber.text = "Order #\(homeordersmodel[indexPath.row].orderId!)"
            cell?.time.text = homeordersmodel[indexPath.row].dateForHumans
            cell?.itemsCount.text = String(homeordersmodel[indexPath.row].items.count) + " Items for " + homeordersmodel[indexPath.row].client.firstName + " " + homeordersmodel[indexPath.row].client.lastName
            
            
            return cell!
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
            return cell!
        }
    }
    
}
