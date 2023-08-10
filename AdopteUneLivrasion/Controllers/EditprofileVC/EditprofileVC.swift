//
//  EditprofileVC.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 08/07/2023.
//

import UIKit

class EditprofileVC: BaseVC {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTXT: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var profileimg: UIImageView!
    var profimg = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        fetchprofile()
        
    }
    
    @IBAction func BackBtn(_ sender : UIButton)
    {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func UpdateBtn (_ sender :UIButton)
    {
        updateprofile()
    }
    func fetchprofile()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            Utility.shared.showSpinner()
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/users")!,timeoutInterval: Double.infinity)
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            
            // Your API request code goes here...
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                Utility.shared.hideSpinner()
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let dataObject = json["data"] as? [String: Any],
                       let firstName = dataObject["first_name"] as? String {
                        DispatchQueue.main.async {
                            self.firstNameTextField.text = firstName
                            self.emailTextField.text = dataObject["last_name"] as? String
                            self.phoneNumberTextField.text = dataObject["contact_number"] as? String
                            self.emailTXT.text =  dataObject["contact_email"] as? String
                            let img =  dataObject["profile_photo"] as? String
                            let urlString = "http://adopteunelivraison.bruncheat.fr/upload/13/"
                            if let imgFilename = img {
                                let fullURLString = urlString + imgFilename
                                print(fullURLString)
                                if let url = URL(string: fullURLString) {
                                    DispatchQueue.global().async {
                                        if let data = try? Data(contentsOf: url) {
                                            DispatchQueue.main.async {
                                                let image = UIImage(data: data)
                                                print(image)
                                                self.profileimg.image = image
                                            }
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                    Utility.shared.hideSpinner()
                }
            }
            
            task.resume()
            
            
        }
    }
    func updateprofile()
    {
        if let accessToken = Utility.getUser()?.accesstoken {
            Utility.shared.showSpinner()
            let parameters = [
                [
                    "key": "first_name",
                    "value": emailTextField.text,
                    "type": "text"
                ],
                [
                    "key": "last_name",
                    "value": firstNameTextField.text,
                    "type": "text"
                ],
                [
                    "key": "contact_email",
                    "value":  emailTXT.text,
                    "type": "text"
                ],
                [
                                "key": "profile_photo",
                                "value": profimg,
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
            
            var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/users")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                Utility.shared.hideSpinner()
                print(String(data: data, encoding: .utf8)!)
            }
            
            task.resume()
        }
    }

        
        @IBAction func selectProfileImage(_ sender: UIButton) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    
    func uploadpic(image: UIImage, progressHandler: @escaping (Double) -> Void, completion: @escaping (Result<String, Error>) -> Void) {
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""

        // Append other parameters if needed...

        // Append the image data
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"file\"; filename=\"profile_photo.jpeg\"\r\n"
            body += "Content-Type: image/jpeg\r\n\r\n"
            body += imageData.base64EncodedString() + "\r\n"
        }

        body += "--\(boundary)--\r\n"
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://api.adopteunelivraison.bruncheat.fr/api/merchants/file_upload")!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer 261|DzpA6ZxvXm2GkYjPwE3tfN365Ver61XdUTVJiuBz", forHTTPHeaderField: "Authorization")
        request.addValue("o2s-chl=a794d41f632d178fac70a921becad1c9", forHTTPHeaderField: "Cookie")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        let task = session.uploadTask(with: request, from: nil) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Data is nil.", code: -1, userInfo: nil)))
                return
            }
           
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let dataObject = jsonResponse["data"] as? [String: Any],
                   let file = dataObject["file"] as? String {
                    print(dataObject["path"] as? String)
                    // Save the 'file' value into 'a'
                    completion(.success(file))
                } else {
                    completion(.failure(NSError(domain: "Error parsing JSON response.", code: -1, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    }


extension EditprofileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // This method is called when the user selects an image or takes a photo.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Set the selected image to your UIImageView or store it in your data model.
            profileimg.image = selectedImage
            
            
            // Call the uploadpic() function and pass the selected image.
            uploadpic(image: selectedImage, progressHandler: { progress in
                // Update your UI with the progress (e.g., progress bar)
                print("Upload Progress: \(progress)")
            }) { result in
                switch result {
                case .success(let file):
                    // File upload success, handle the file value (e.g., store it, display it)
                    print("File Uploaded: \(file)")
                    self.profimg = file
                case .failure(let error):
                    // File upload failed, handle the error appropriately
                    print("Error Uploading File: \(error)")
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }

    
    // This method is called if the user cancels the image picker.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
extension EditprofileVC: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        DispatchQueue.main.async {
            // Call the progress handler on the main thread to update UI
            print (Float(progress))
           // self.progressView.progress = Float(progress)
        }
    }
}
