//
//	ItemMeta.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ItemMeta : NSObject, NSCoding{

	var id : Int!
	var itemId : Int!
	var merchantId : Int!
	var metaId : String!
	var metaName : String!
	var metaValue : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? Int
		itemId = dictionary["item_id"] as? Int
		merchantId = dictionary["merchant_id"] as? Int
		metaId = dictionary["meta_id"] as? String
		metaName = dictionary["meta_name"] as? String
		metaValue = dictionary["meta_value"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if id != nil{
			dictionary["id"] = id
		}
		if itemId != nil{
			dictionary["item_id"] = itemId
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		if metaId != nil{
			dictionary["meta_id"] = metaId
		}
		if metaName != nil{
			dictionary["meta_name"] = metaName
		}
		if metaValue != nil{
			dictionary["meta_value"] = metaValue
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? Int
         itemId = aDecoder.decodeObject(forKey: "item_id") as? Int
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         metaId = aDecoder.decodeObject(forKey: "meta_id") as? String
         metaName = aDecoder.decodeObject(forKey: "meta_name") as? String
         metaValue = aDecoder.decodeObject(forKey: "meta_value") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}
		if metaId != nil{
			aCoder.encode(metaId, forKey: "meta_id")
		}
		if metaName != nil{
			aCoder.encode(metaName, forKey: "meta_name")
		}
		if metaValue != nil{
			aCoder.encode(metaValue, forKey: "meta_value")
		}

	}

}