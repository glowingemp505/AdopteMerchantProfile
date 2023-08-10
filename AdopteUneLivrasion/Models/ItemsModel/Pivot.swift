//
//	Pivot.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Pivot : NSObject, NSCoding{

	var catId : Int!
	var dishId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		catId = dictionary["cat_id"] as? Int
		dishId = dictionary["dish_id"] as? Int
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
		if dishId != nil{
			dictionary["dish_id"] = dishId
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
         dishId = aDecoder.decodeObject(forKey: "dish_id") as? Int

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
		if dishId != nil{
			aCoder.encode(dishId, forKey: "dish_id")
		}

	}

}