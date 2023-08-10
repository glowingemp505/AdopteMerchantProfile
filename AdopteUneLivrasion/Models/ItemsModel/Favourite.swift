//
//	Favourite.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Favourite : NSObject, NSCoding{

	var catId : Int!
	var clientId : Int!
	var dateCreated : String!
	var dateModified : String!
	var favType : String!
	var id : Int!
	var ipAddress : String!
	var itemId : Int!
	var merchantId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		catId = dictionary["cat_id"] as? Int
		clientId = dictionary["client_id"] as? Int
		dateCreated = dictionary["date_created"] as? String
		dateModified = dictionary["date_modified"] as? String
		favType = dictionary["fav_type"] as? String
		id = dictionary["id"] as? Int
		ipAddress = dictionary["ip_address"] as? String
		itemId = dictionary["item_id"] as? Int
		merchantId = dictionary["merchant_id"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if catId != nil{
			dictionary["cat_id"] = catId
		}
		if clientId != nil{
			dictionary["client_id"] = clientId
		}
		if dateCreated != nil{
			dictionary["date_created"] = dateCreated
		}
		if dateModified != nil{
			dictionary["date_modified"] = dateModified
		}
		if favType != nil{
			dictionary["fav_type"] = favType
		}
		if id != nil{
			dictionary["id"] = id
		}
		if ipAddress != nil{
			dictionary["ip_address"] = ipAddress
		}
		if itemId != nil{
			dictionary["item_id"] = itemId
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         catId = aDecoder.decodeObject(forKey: "cat_id") as? Int
         clientId = aDecoder.decodeObject(forKey: "client_id") as? Int
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         favType = aDecoder.decodeObject(forKey: "fav_type") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
         itemId = aDecoder.decodeObject(forKey: "item_id") as? Int
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if catId != nil{
			aCoder.encode(catId, forKey: "cat_id")
		}
		if clientId != nil{
			aCoder.encode(clientId, forKey: "client_id")
		}
		if dateCreated != nil{
			aCoder.encode(dateCreated, forKey: "date_created")
		}
		if dateModified != nil{
			aCoder.encode(dateModified, forKey: "date_modified")
		}
		if favType != nil{
			aCoder.encode(favType, forKey: "fav_type")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if ipAddress != nil{
			aCoder.encode(ipAddress, forKey: "ip_address")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}

	}

}