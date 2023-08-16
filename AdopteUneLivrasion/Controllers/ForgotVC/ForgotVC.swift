//
//  ForgotVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 15/06/2023.
//

import UIKit

class ForgotVC: BaseVC {
    
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
    
    @IBAction func resetPassword(_ sender : UIButton)
    {
        if namelblTF.text != ""
        {
            let parameters = [
                [
                    "key": "email",
                    "value": namelblTF.text,
                    "type": "text"
                ],
                [
                    "key": "user_type",
                    "value": "merchants",
                    "type": "text"
                ]] as [[String: Any]]
            
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
            
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/forgot-password")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                print(String(data: data, encoding: .utf8)!)
                
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let message = jsonResponse["message"] as? String {
                        DispatchQueue.main.async { [weak self] in
                            self?.showTool(msg: message, state: .error)
                        }
                        
                    }
                } catch {
                    print("Error parsing API response: \(error)")
                }
                
            }
            task.resume()
            
        }
        else
        {
            showTool(msg: "Email Required", state: .error)
        }
        
    }
}
