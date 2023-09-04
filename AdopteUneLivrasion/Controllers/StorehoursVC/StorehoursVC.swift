//
//  StorehoursVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 10/08/2023.
//

import UIKit

class StorehoursVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var Storehoursmodel = [StoreHoursModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchhours()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 60) / 2 // Adjust spacing as needed
        layout.itemSize = CGSize(width: cellWidth, height: 100)
        layout.minimumInteritemSpacing = 10 // Adjust spacing as needed
        collectionView.collectionViewLayout = layout
    }
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addbtn(_ sender : UIButton)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddstorehoursVC") as! AddstorehoursVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func fetchhours()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/opening_hours")!,timeoutInterval: Double.infinity)
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
                            self.Storehoursmodel.append(StoreHoursModel(fromDictionary: jsonItem))
                        }
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
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
extension StorehoursVC : UICollectionViewDataSource , UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Storehoursmodel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HoursCVC
        cell.mainlbl.text = Storehoursmodel[indexPath.row].day
        cell.status.text = Storehoursmodel[indexPath.row].status
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH : mm"
        
        if let startTimeDate = inputFormatter.date(from: Storehoursmodel[indexPath.row].startTime),
           let endTimeDate = inputFormatter.date(from: Storehoursmodel[indexPath.row].endTime) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "h:mm a"
            
            let formattedStartTime = outputFormatter.string(from: startTimeDate)
            let formattedEndTime = outputFormatter.string(from: endTimeDate)
            
            cell.date.text = formattedStartTime + "  " + formattedEndTime
        } else {
            print("Invalid time format")
        }
        
        return cell
    }
    
    
    
}
