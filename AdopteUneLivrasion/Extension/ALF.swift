
import Foundation
import UIKit
import Alamofire
import SwiftUI
import SwiftyJSON



typealias SuccessBlock = (_ response: AnyObject) -> Void
typealias FailureBlock = (_ response: AnyObject) -> Void

class ALF: NSObject {

    static let shared = ALF()
    
    private func urlString(subUrl: String) -> String {
        return "http://api.adopteunelivraison.bruncheat.fr\(subUrl)"
     }
   
    
    
    /****************************  ***********************************/
    /******************* GET Method with PARAMS **********************/
    /****************************  ***********************************/

    func doPutData(parameters: Dictionary<String, Any>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.putMethodWithParams(parameters: parameters, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }
    private func putMethodWithParams(parameters: Dictionary<String, Any>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){
        var headers: HTTPHeaders?
// let token =  "sgjnI5G3LDc8z4bf2cMC7CViMOfgPpHTdDBUfqMGlzAAlvKZENXj5buvusMzaTJ9y81Uo577z6vjs9juc59gvQph8ZgEudwv3xPHQ1LAwmpsjOciZyns9P5JIdbMoYwtVzvSHOdTVToW2cQNNqhuzouFywa9Gpd7g2XFuQ0RYHyyg34SYGgmcpyhKjFFpswZFlRrAVufrJ0h9zjDc6wpH79rPzp2zbh56jgPZ37LWO278VrtXaNemtpKIE4xF16oUZYRJxPQwcT85VqJ0E7uVuZB60LfAqUZ6iRK7Cer4ArU3AixapE9I9y5jx77Vdel5p8kpDws7kTJ0iXpoKjh7M7UKn1MeESXCdDhDBY8WIHUts2hDsPTbOo0DhEkBqIgJo0BfeDSH0WFewbUxeCKelPk5vqy178CuBdJxiSjTY0YKbTxytOtMEj3B6lHcyjpXC3IAgbrIqLyWJp136VGLHnJlRgiZV1az46pT9mqVBhO7kF3XlVZ"

        
        let token = Utility.getUser()?.accesstoken ?? ""
        if token == ""
        {
            headers = ["Content-Type" : "application/json" ]
        }
        else
        {
            headers = ["Content-Type" : "application/json" , "accesstoken" : token]
        }
        
                
        

        print(headers)
        let manager = Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30

        manager.request(forMethod, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
       
            switch response.result {
                case .success(let value):
                    success(value as AnyObject)
                case .failure(let error):
                    print(error)
                    fail(error as AnyObject)
            }
        }

    }

    func doPostData(parameters: Dictionary<String, AnyObject>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.postMethodWithParams(parameters: parameters, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }
    private func postMethodWithParams(parameters: Dictionary<String, AnyObject>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){
        var headers: HTTPHeaders?
        let token = Utility.getUser()?.accesstoken ?? ""
        if token == ""
        {
           // headers = ["Content-Type" : "application/json" ]
        }
        else
        {
            headers = ["Content-Type" : "application/x-www-form-urlencoded" , "accesstoken" : token]
        }

//        print(headers)
        let manager = Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30

        manager.request(forMethod, method: .post, parameters: parameters,  headers: headers).responseJSON { response in
       
            switch response.result {
                case .success(let value):
                    success(value as AnyObject)
                case .failure(let error):
                    print(error)
                    fail(error as AnyObject)
            }
        }

    }
    func doPostDataWithMedia(parameters: Dictionary<String, AnyObject>, method: String, data: URL?, name: String, fileType: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        
        self.postMethodWithParamsAndMedia(parameters: parameters, forMethod: self.urlString(subUrl: method), filename: data, name: name, mimeType: fileType, success: success, fail: fail)
    }
    
   private func postMethodWithParamsAndMedia(parameters: Dictionary<String, AnyObject>, forMethod: String, filename: URL?, name: String, mimeType: String, success: @escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(forMethod)
        let manager = Session.default
        var headers: HTTPHeaders?
        
        let token = Utility.getUser()?.accesstoken ?? ""
        if token == "" {
            headers = ["Content-Type" : "application/json" ]
        } else {
            headers = ["Content-Type" : "application/json" , "accesstoken" : token]
        }
        print(filename!)
        
        AF.upload(multipartFormData: { multiPart in
            if let urlString = filename {
                let contentData = try! Data(contentsOf: urlString.asURL())
                let data: Data = contentData
                let exten = name
                multiPart.append(data, withName: "file", fileName: name, mimeType: mimeType)
                for (key, value) in parameters {
                    multiPart.append(((value as? String)?.data(using: .utf8))!, withName: key)
                }
            }
            if !(parameters.isEmpty) {
                for (key, value) in parameters {
                    print("key: \(key) -> val: \(value)")
                    if let dic = value as? Dictionary<String,Any> {
                        print(key)
                        print(value)
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
                            let str = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                            multiPart.append(str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                        } catch {
                            print(error.localizedDescription)
                        }
                    } else {
                        multiPart.append(value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue).rawValue)!, withName: key)
                    }
                }
            }
            print(multiPart)
        }, to: forMethod, method: .post, headers: headers).uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let status = json["status"].intValue
                if status == 401 {
                    Utility.shared.hideSpinner()
                    return
                }
                success(value as AnyObject)
            case .failure(let error):
                print(error)
                fail(error as AnyObject)
            }
        }
    }

//////////////////
    ///
    ///
    func doPostDataWithImagedic(parameters: Dictionary<String, AnyObject>, method: String, image: UIImage?,image_name: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
    
    self.postMethodWithParamsAndImagedic(parameters: parameters, forMethod: self.urlString(subUrl: method), image: image,image_name: image_name, success: success, fail: fail)
}


private func postMethodWithParamsAndImagedic(parameters: Dictionary<String, AnyObject>, forMethod: String, image: UIImage?,image_name: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){

    let manager = Session.default
    manager.session.configuration.timeoutIntervalForRequest = 10

    var headers: HTTPHeaders?

    let token = Utility.getUser()?.accesstoken ?? ""
    if token == ""
    {
        headers = ["Content-Type" : "application/json" ]
    }
    else
    {
        headers = ["Content-Type" : "application/json" , "accesstoken" : token]
    }
    print(headers)
    AF.upload(multipartFormData: { multiPart in
        print(parameters)
        print(image as Any)
        if image != nil {

            let imgData = image?.pngData()
//                let data = UIImagePNGRepresentation(image!) as NSData?
            print(imgData?.count)

            multiPart.append(imgData!, withName: image_name, fileName: "\(image_name).jpg", mimeType: "image/jpg")

        }
        if !(parameters.isEmpty) {
            for (key, value) in parameters {
                print("key: \(key) -> val: \(value)")
                if let dic = value as? Dictionary<String,AnyObject>{
                    print(key)
                    print(value)
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
                        let str = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                        
                        multiPart.append(str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                    } catch {
                        print(error.localizedDescription)
                    }

                }else{
                    multiPart.append(value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue).rawValue)!, withName: key)
                }

            }
        }
        print(multiPart)
    }, to: forMethod, method: .post , headers: headers)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
            //self.delegate.back(status: progress.fractionCompleted)
        })
        .responseJSON { (response) in
            switch response.result {
                case .success(let value):
                    success(value as AnyObject)
                case .failure(let error):
                    print(error)
                    fail(error as AnyObject)
            }
    }

}
    ///
    ///
    ///////////////////////
    func doPostDataWithImage(parameters: [String:String], method: String, image: UIImage?,image_name: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {

        self.postMethodWithParamsAndImage(parameters: parameters, forMethod: self.urlString(subUrl: method), image: image,image_name: image_name, success: success, fail: fail)
    }


    private func postMethodWithParamsAndImage(parameters: [String:String], forMethod: String, image: UIImage?,image_name: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){

        let manager = Session.default
        manager.session.configuration.timeoutIntervalForRequest = 10

        var headers: HTTPHeaders?

        let token = Utility.getUser()?.accesstoken ?? ""
        if token == ""
        {
            headers = ["Content-Type" : "application/json" ]
        }
        else
        {
            headers = ["Content-Type" : "application/json" , "accesstoken" : token]
        }
        print(headers)
        AF.upload(multipartFormData: { multiPart in
            print(parameters)
            print(image as Any)
            if image != nil {

                let imgData = image?.pngData()
//                let data = UIImagePNGRepresentation(image!) as NSData?
                print(imgData?.count)

                multiPart.append(imgData!, withName: image_name, fileName: "\(image_name).jpg", mimeType: "image/jpg")

            }
            if !(parameters.isEmpty) {
                for (key, value) in parameters {
                    print("key: \(key) -> val: \(value)")
                    if let dic = value as? Dictionary<String,AnyObject>{
                        print(key)
                        print(value)
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
                            let str = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                            
                            multiPart.append(str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                        } catch {
                            print(error.localizedDescription)
                        }

                    }else{
                        multiPart.append(value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                    }

                }
            }
            print(multiPart)
        }, to: forMethod, method: .post , headers: headers)
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
                print("Upload Progress: \(progress.fractionCompleted)")
                //self.delegate.back(status: progress.fractionCompleted)
            })
            .responseJSON { (response) in
                switch response.result {
                    case .success(let value):
                        success(value as AnyObject)
                    case .failure(let error):
                        print(error)
                        fail(error as AnyObject)
                }
        }

    }
    
    func doGetData(parameters: Dictionary<String, AnyObject>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.getMethodWithParams(parameters: parameters as Dictionary<String, AnyObject>, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }

    private func getMethodWithParams(parameters: Dictionary<String, AnyObject>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){

        var headers: HTTPHeaders?

        let token = Utility.getUser()?.accesstoken ?? ""
        if token == ""
        {
            headers = ["Content-Type" : "application/json" ]
        }
        else
        {
            headers = ["Content-Type" : "application/json" , "accesstoken" : token]
        }
        let manager = Session.default

        manager.session.configuration.timeoutIntervalForRequest = 30
        print(parameters)

        manager.request(forMethod, method: .get, parameters: parameters, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let value):

                success(value as AnyObject)
            case .failure(let error):
                print(error)
                fail(error as AnyObject)
            }

        }

    }
    func doDeleteData(parameters: Dictionary<String, AnyObject>, method: String, success:@escaping SuccessBlock, fail: @escaping FailureBlock) {
        print(parameters)
        self.deleteMethodWithParams(parameters: parameters as Dictionary<String, AnyObject>, forMethod: self.urlString(subUrl: method), success: success, fail: fail)
    }

    private func deleteMethodWithParams(parameters: Dictionary<String, AnyObject>, forMethod: String, success:@escaping SuccessBlock, fail:@escaping FailureBlock){

        var headers: HTTPHeaders?

        let token = Utility.getUser()?.accesstoken ?? ""
        if token == ""
        {
            headers = ["Content-Type" : "application/json" ]
        }
        else
        {
            headers = ["Content-Type" : "application/json" , "accesstoken" : token]
        }
        let manager = Session.default

        manager.session.configuration.timeoutIntervalForRequest = 30
        print(parameters)

        manager.request(forMethod, method: .delete, parameters: parameters, headers: headers).responseJSON { response in

            switch response.result {
            case .success(let value):

                success(value as AnyObject)
            case .failure(let error):
                print(error)
                fail(error as AnyObject)
            }

        }

    }
    }
