//
//  MenumainTVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 03/07/2023.
//

import UIKit
protocol MenumainTVCDelegate: class {
    func editButtonTapped()
}


class MenumainTVC: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    // Declare your second table view
    
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var headerlbl : UILabel!
    @IBOutlet weak var editCategory : UIButton!
    @IBOutlet weak var totalitems : UILabel!
    @IBOutlet weak var secondTableView : UITableView!
    var itemmodel = [ItemsModel]()
    
    var categoryid = 0
    
    
    weak var delegate: MenumainTVCDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure the second table view
        secondTableView.delegate = self
        secondTableView.dataSource = self
  
    }
    func datafetch(completion: @escaping () -> Void) {
    
        if let accessToken = Utility.getUser()?.accesstoken {
            Utility.shared.showSpinner()
            let parameters = [
            ] as [[String: Any]]
            
            let boundary = "Boundary-\(UUID().uuidString)"
            var body = ""
            var error: Error? = nil
            for param in parameters {
                if param["disabled"] != nil { continue }
                let paramName = param["key"]!
                body += "--\(boundary)\r\n"
                body += "Content-Disposition:form-data; name=\"\(paramName)\""
                if param["contentType"] != nil {
                    body += "\r\nContent-Type: \(param["contentType"] as! String)"
                }
                let paramType = param["type"] as! String
                if paramType == "text" {
                    let paramValue = param["value"] as! String
                    body += "\r\n\r\n\(paramValue)\r\n"
                } else {
                    let paramSrc = param["src"] as! String
                    do {
                        let fileData = try NSData(contentsOfFile: paramSrc, options: []) as Data
                        let fileContent = String(data: fileData, encoding: .utf8)!
                        body += "; filename=\"\(paramSrc)\"\r\n"
                        + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
                    } catch {
                        // Handle the error here
                        print("Error reading file data: \(error)")
                        // Optionally, you can return or take appropriate action if needed.
                    }
                }
            }
            body += "--\(boundary)--\r\n";
            let postData = body.data(using: .utf8)
            
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/items?category_id=\(categoryid)")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "GET"
           // request.httpBody = postData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data else {
                            print(String(describing: error))
                            Utility.shared.hideSpinner()
                            return
                        }
                        print(String(data: data, encoding: .utf8)!)
                        do {
                            Utility.shared.hideSpinner()
                            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                               let dataArray = jsonObject["data"] as? [[String: Any]] {

                                // Clear the previous data in itemmodel before appending new data
                                self.itemmodel.removeAll()

                                for jsonItem in dataArray {
                                    self.itemmodel.append(ItemsModel(fromDictionary: jsonItem))
                                }

                                DispatchQueue.main.async {
                                    self.secondTableView.reloadData() // Reload the second table view with the new data
                                }
                            } else {
                                print("Error: Unable to parse JSON data.")
                            }
                        } catch {
                            Utility.shared.hideSpinner()
                            print("Error decoding response data: \(error)")
                        }
                        Utility.shared.hideSpinner()
                        completion()
                    }

                    task.resume()
                }
    }
}

extension MenumainTVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemmodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! MenufoodTVC
        cell.editbtn.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        if itemmodel.count != 0
        {
            cell.mainlbl.text = itemmodel[indexPath.row].itemName
            
        }
        
        
        return cell
       }

       @objc func editButtonTapped(_ sender: UIButton) {
           delegate?.editButtonTapped()
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
