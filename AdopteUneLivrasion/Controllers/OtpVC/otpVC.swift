//
//  otpVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 22/08/2023.
//

import UIKit

class otpVC: BaseVC {

    @IBOutlet weak var oldpasslbl : UILabel!
    @IBOutlet weak var oldpasslblTF : UITextField!
    @IBOutlet weak var oldpasslblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passlbl : UILabel!
    @IBOutlet weak var passlblTF : UITextField!
    @IBOutlet weak var passlblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passlbl2 : UILabel!
    @IBOutlet weak var passlblTF2 : UITextField!
    @IBOutlet weak var passlblTopConstraint2: NSLayoutConstraint!
    var email = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        oldpasslbl.isUserInteractionEnabled = true
        passlbl.isUserInteractionEnabled = true
        passlbl2.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(labelTapped1(_:)))
        oldpasslbl.addGestureRecognizer(tapGesture1)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(labelTapped2(_:)))
        passlbl.addGestureRecognizer(tapGesture2)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(labelTapped3(_:)))
        passlbl2.addGestureRecognizer(tapGesture3)
        
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    @objc func labelTapped1(_ sender: UITapGestureRecognizer) {
        oldpasslblTopConstraint.constant = 12
        oldpasslblTF.isUserInteractionEnabled = true
        oldpasslblTF.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func labelTapped2(_ sender: UITapGestureRecognizer) {
        passlblTopConstraint.constant = 12
        passlblTF.isUserInteractionEnabled = true
        passlblTF.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func labelTapped3(_ sender: UITapGestureRecognizer) {
        passlblTopConstraint2.constant = 12
        passlblTF2.isUserInteractionEnabled = true
        passlblTF2.becomeFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func UpdateBtn (_ sender :UIButton)
    {
        updatepassword()
    }
    func updatepassword()
    {
        
            Utility.shared.showSpinner()
            let parameters = [
              [
                "key": "email",
                "value": email,
                "type": "text"
              ],
              [
                "key": "otp",
                "value": oldpasslblTF.text,
                "type": "text"
              ],
              [
                "key": "password",
                "value": passlblTF.text,
                "type": "text"
              ],
              [
                "key": "password_confirmation",
                "value": passlblTF2.text,
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

            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/reset-password")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "POST"
            request.httpBody = postData

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    if let error = error {
                        print("Error: \(error)")
                        Utility.shared.hideSpinner()
                    }
                    return
                }
                Utility.shared.hideSpinner()
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        print(json) // The parsed JSON data
                        DispatchQueue.main.async {
                            self.showTool(msg: json["message"] as! String, state: .error) // Call showTool on the main thread
                            
                            if json["status_code"] as! Int == 200
                            {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    self.navigationController?.popToRootViewController(animated: true)
                                }
                            }
                          
                        }
                        
                    } else {
                        let responseString = String(data: data, encoding: .utf8)
                        print("Response: \(responseString ?? "No response data")")
                        Utility.shared.hideSpinner()
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                    Utility.shared.hideSpinner()
                }
            }
            
            task.resume()


        }
    
}
