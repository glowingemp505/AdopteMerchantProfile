//
//	CategoryModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CategoryModel : NSObject, NSCoding{
    
    var availableAtSpecific : Int!
    var catId : Int!
    var categoryDescription : String!
    var categoryName : String!
    var dateCreated : String!
    var dateModified : String!
    var icon : String!
    var iconPath : String!
    var ipAddress : String!
    var itemsCount : Int!
    var merchantId : Int!
    var path : String!
    var photo : String!
    var sequence : Int!
    var status : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        availableAtSpecific = dictionary["available_at_specific"] as? Int
        catId = dictionary["cat_id"] as? Int
        categoryDescription = dictionary["category_description"] as? String
        categoryName = dictionary["category_name"] as? String
        dateCreated = dictionary["date_created"] as? String
        dateModified = dictionary["date_modified"] as? String
        icon = dictionary["icon"] as? String
        iconPath = dictionary["icon_path"] as? String
        ipAddress = dictionary["ip_address"] as? String
        itemsCount = dictionary["items_count"] as? Int
        merchantId = dictionary["merchant_id"] as? Int
        path = dictionary["path"] as? String
        photo = dictionary["photo"] as? String
        sequence = dictionary["sequence"] as? Int
        status = dictionary["status"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if availableAtSpecific != nil{
            dictionary["available_at_specific"] = availableAtSpecific
        }
        if catId != nil{
            dictionary["cat_id"] = catId
        }
        if categoryDescription != nil{
            dictionary["category_description"] = categoryDescription
        }
        if categoryName != nil{
            dictionary["category_name"] = categoryName
        }
        if dateCreated != nil{
            dictionary["date_created"] = dateCreated
        }
        if dateModified != nil{
            dictionary["date_modified"] = dateModified
        }
        if icon != nil{
            dictionary["icon"] = icon
        }
        if iconPath != nil{
            dictionary["icon_path"] = iconPath
        }
        if ipAddress != nil{
            dictionary["ip_address"] = ipAddress
        }
        if itemsCount != nil{
            dictionary["items_count"] = itemsCount
        }
        if merchantId != nil{
            dictionary["merchant_id"] = merchantId
        }
        if path != nil{
            dictionary["path"] = path
        }
        if photo != nil{
            dictionary["photo"] = photo
        }
        if sequence != nil{
            dictionary["sequence"] = sequence
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        availableAtSpecific = aDecoder.decodeObject(forKey: "available_at_specific") as? Int
        catId = aDecoder.decodeObject(forKey: "cat_id") as? Int
        categoryDescription = aDecoder.decodeObject(forKey: "category_description") as? String
        categoryName = aDecoder.decodeObject(forKey: "category_name") as? String
        dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
        dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
        icon = aDecoder.decodeObject(forKey: "icon") as? String
        iconPath = aDecoder.decodeObject(forKey: "icon_path") as? String
        ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
        itemsCount = aDecoder.decodeObject(forKey: "items_count") as? Int
        merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
        path = aDecoder.decodeObject(forKey: "path") as? String
        photo = aDecoder.decodeObject(forKey: "photo") as? String
        sequence = aDecoder.decodeObject(forKey: "sequence") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if availableAtSpecific != nil{
            aCoder.encode(availableAtSpecific, forKey: "available_at_specific")
        }
        if catId != nil{
            aCoder.encode(catId, forKey: "cat_id")
        }
        if categoryDescription != nil{
            aCoder.encode(categoryDescription, forKey: "category_description")
        }
        if categoryName != nil{
            aCoder.encode(categoryName, forKey: "category_name")
        }
        if dateCreated != nil{
            aCoder.encode(dateCreated, forKey: "date_created")
        }
        if dateModified != nil{
            aCoder.encode(dateModified, forKey: "date_modified")
        }
        if icon != nil{
            aCoder.encode(icon, forKey: "icon")
        }
        if iconPath != nil{
            aCoder.encode(iconPath, forKey: "icon_path")
        }
        if ipAddress != nil{
            aCoder.encode(ipAddress, forKey: "ip_address")
        }
        if itemsCount != nil{
            aCoder.encode(itemsCount, forKey: "items_count")
        }
        if merchantId != nil{
            aCoder.encode(merchantId, forKey: "merchant_id")
        }
        if path != nil{
            aCoder.encode(path, forKey: "path")
        }
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if sequence != nil{
            aCoder.encode(sequence, forKey: "sequence")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        
    }
    
}
