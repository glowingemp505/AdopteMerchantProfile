import UIKit
import Photos
import SystemConfiguration

typealias OkBlock = () -> Void
typealias cancelBlock = () -> Void



class Utility: NSObject
{
    static let shared = Utility()
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    
    
    class func isValidEmail(testStr:String) -> Bool
    {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    class func isCompany() -> Bool {
        
        if (UserDefaults.standard.object(forKey: "user_type")  as! String == "1") {
            return true
        }else  {
            return false
        }
        
    }
    class func getUser() -> UserModel?{
        if user() != nil {
            let usr = UserModel(fromDictionary: user()!)
            return usr
        }
        return nil
        
    }
    class func user() -> [String: AnyObject]?{
//        if let usr = UserDefaults.standard.object(forKey: "user") as? [String: AnyObject] {
        if let usr = getDictionary(key: "user") as? [String: AnyObject] {
            return usr
        }
        return nil
    }
    class func saveUser(dic: [String: AnyObject]){
        UserDefaults.standard.setValue(dic, forKey: "user")
    }
    
    public func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true

        manager.requestImageData(for: asset, options: option) { data, str, _, _ in

            if let data = data {
                thumbnail = UIImage(data: data)!
            }
        }
    
        return thumbnail
        
    }
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
    
    class func saveDictionary(dict: Dictionary<String, AnyObject>, key: String){
         let preferences = UserDefaults.standard
         let encodedData = NSKeyedArchiver.archivedData(withRootObject: dict)
         preferences.set(encodedData, forKey: key)
     
    }
        
    class func getDictionary(key: String) -> Dictionary<String, AnyObject>? {
         let preferences = UserDefaults.standard
         if preferences.object(forKey: key) != nil{
            let decoded: Data = preferences.object(forKey: key)  as! Data
         let decodedDict = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! Dictionary<String, AnyObject>
                
         return decodedDict
       } else {
          
          return nil
       }
    }
    
    public func showActivityIndicatory(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        //        container.backgroundColor = UIColor.init(netHex: 0xffffff).withAlphaComponent(0.3) //UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //        activityIndicator.activityIndicatorViewStyle =
        //            UIActivityIndicatorViewStyle.white
        activityIndicator.color = UIColor(named: "#555555")
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,y :loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        uiView.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    public func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        uiView.isUserInteractionEnabled = true
        container.removeFromSuperview()
    }
    private func setSpinner() {
        
        let window = SceneDelegate.shared().window!
        loadingView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loadingView.clipsToBounds = true
        loadingView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        loadingView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.color = UIColor(hexString: "#ffffff")
        activityIndicator.tintColor = UIColor(hexString: "#ffffff")
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,y :loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        loadingView.center = window.center
        window.addSubview(loadingView)
        window.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    public func showSpinner() {
        DispatchQueue.main.async {
            self.setSpinner()
        }
    }
    public func hideSpinner() {
        DispatchQueue.main.async {
            self.removeSpinner()
        }
    }
    private func removeSpinner() {
        let window = SceneDelegate.shared().window!
        
        activityIndicator.stopAnimating()
        window.isUserInteractionEnabled = true
        //        uiView.isUserInteractionEnabled = true
        loadingView.removeFromSuperview()
    }
    class func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now
        var components = calendar.dateComponents(unitFlags, from: earliest as Date,  to: latest as Date)
//        print(components)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "A hour"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    
    class func isConnectedToNetwork() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                
                SCNetworkReachabilityCreateWithAddress(nil, $0)
                
            }
            
        }) else {
            
            return false
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    class func dateFromStringWithFormat(_ stringDate: String, format: String) -> Date  {
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: stringDate)
        
        return date ?? Date()
    }
    class func dateFromStringConvertToString(_ stringDate: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: stringDate)
        //        dateFormatter.dateFormat =  "hh:mm a"
        //        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "d MMM, yyyy"
        let newDate = dateFormatter.string(from: date!)
        return newDate
    }
    class alert {
        func msg(message: String, title: String = "")
        {
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)

            alertView.addAction(UIAlertAction(title: "Done", style: .default,  handler: someHandler))
            func someHandler(alert: UIAlertAction!) {
            
                
                var navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
              //  navController?.pushViewController(HomeVC, animated: true)
                navController?.popViewController(animated: true)

            }
             
            UIApplication.shared.keyWindow?.rootViewController?.present(alertView, animated: true, completion: nil)
        }
    }
    class func stringFromDateWithFormat(_ date: Date, format: String) -> String  {
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm a"
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func dateFromString(_ stringDate: String) -> Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.date(from: stringDate)
        //        let calendar = Calendar.current
        //        let newDate = calendar.date(byAdding: .hour, value: 5, to: date!)
        return date!
    }
    
    //    class func dateFromString(_ stringDate: String) -> Date  {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    //        let date = dateFormatter.date(from: stringDate)
    //
    //        return date! as Date
    //    }
    
    class func stringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd hh:mm a"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func dateDtringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    class func timeDtringFromDate(_ date: Date) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    class ErrorReporting {
        func showMessage(title: String, msg: String, `on` controller: UIViewController) {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            controller.present(alert, animated: true, completion: nil)
        }
    }
    class func showAlertWithTitle(title: String, withMessage: String, withNavigation: UIViewController) {
        
        let alertController : UIAlertController = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertController.Style.alert)
        let cancelAction : UIAlertAction = UIAlertAction(title: "OK", style: .cancel){
            ACTION -> Void in
        }
        alertController.addAction(cancelAction)
        withNavigation.present(alertController, animated: true, completion: nil)
    }
    class func showAlertWithOK(title: String, withMessage: String, withNavigation: UIViewController, withOkBlock:@escaping OkBlock) {
        
        let alertController : UIAlertController = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertController.Style.alert)
       
        let okAction : UIAlertAction = UIAlertAction(title: "OK", style: .default){
            ACTION -> Void in
            
            withOkBlock()
        }
        
        
        alertController.addAction(okAction)
        print(alertController.view.subviews)
        
        withNavigation.present(alertController, animated: true, completion: nil)
        
       
    }
  
    
    class func showAlertWithCustomBtns(title: String, withMessage: String, okTitle: String, cancelTitle: String, withNavigation: UIViewController, withOkBlock:@escaping OkBlock, withCancelBlock:@escaping cancelBlock) {
        
        let alertController : UIAlertController = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertController.Style.alert)
       
        let okAction : UIAlertAction = UIAlertAction(title: okTitle, style: .default){
            ACTION -> Void in
            
            withOkBlock()
        }
        
        let cancelAction : UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel){
            ACTION -> Void in
            
            withCancelBlock()
        }
        
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        print(alertController.view.subviews)
        
        withNavigation.present(alertController, animated: true, completion: nil)
        
       
    }
    
    static let numberFormater: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .default
        return formatter
    }()
    
}

