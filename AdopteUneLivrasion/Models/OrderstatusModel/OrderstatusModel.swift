//
//  OrderstatusModel.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 23/07/2023.
//

import Foundation

class OrderstatusModel : NSObject, NSCoding{

    var backgroundColorHex : String!
    var dateCreated : String!
    var dateModified : String!
    var descriptionField : String!
    var fontColorHex : String!
    var groupName : String!
    var ipAddress : String!
    var merchantId : Int!
    var statsId : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        backgroundColorHex = dictionary["background_color_hex"] as? String
        dateCreated = dictionary["date_created"] as? String
        dateModified = dictionary["date_modified"] as? String
        descriptionField = dictionary["description"] as? String
        fontColorHex = dictionary["font_color_hex"] as? String
        groupName = dictionary["group_name"] as? String
        ipAddress = dictionary["ip_address"] as? String
        merchantId = dictionary["merchant_id"] as? Int
        statsId = dictionary["stats_id"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if backgroundColorHex != nil{
            dictionary["background_color_hex"] = backgroundColorHex
        }
        if dateCreated != nil{
            dictionary["date_created"] = dateCreated
        }
        if dateModified != nil{
            dictionary["date_modified"] = dateModified
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if fontColorHex != nil{
            dictionary["font_color_hex"] = fontColorHex
        }
        if groupName != nil{
            dictionary["group_name"] = groupName
        }
        if ipAddress != nil{
            dictionary["ip_address"] = ipAddress
        }
        if merchantId != nil{
            dictionary["merchant_id"] = merchantId
        }
        if statsId != nil{
            dictionary["stats_id"] = statsId
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         backgroundColorHex = aDecoder.decodeObject(forKey: "background_color_hex") as? String
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         fontColorHex = aDecoder.decodeObject(forKey: "font_color_hex") as? String
         groupName = aDecoder.decodeObject(forKey: "group_name") as? String
         ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         statsId = aDecoder.decodeObject(forKey: "stats_id") as? Int

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if backgroundColorHex != nil{
            aCoder.encode(backgroundColorHex, forKey: "background_color_hex")
        }
        if dateCreated != nil{
            aCoder.encode(dateCreated, forKey: "date_created")
        }
        if dateModified != nil{
            aCoder.encode(dateModified, forKey: "date_modified")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if fontColorHex != nil{
            aCoder.encode(fontColorHex, forKey: "font_color_hex")
        }
        if groupName != nil{
            aCoder.encode(groupName, forKey: "group_name")
        }
        if ipAddress != nil{
            aCoder.encode(ipAddress, forKey: "ip_address")
        }
        if merchantId != nil{
            aCoder.encode(merchantId, forKey: "merchant_id")
        }
        if statsId != nil{
            aCoder.encode(statsId, forKey: "stats_id")
        }

    }

}
