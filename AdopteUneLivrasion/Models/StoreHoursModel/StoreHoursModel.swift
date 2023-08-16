//
//	StoreHoursModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class StoreHoursModel : NSObject, NSCoding{

	var customText : String!
	var day : String!
	var dayOfWeek : Int!
	var endTime : String!
	var endTimePm : String!
	var id : Int!
	var lastUpdate : String!
	var merchantId : Int!
	var startTime : String!
	var startTimePm : String!
	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		customText = dictionary["custom_text"] as? String
		day = dictionary["day"] as? String
		dayOfWeek = dictionary["day_of_week"] as? Int
		endTime = dictionary["end_time"] as? String
		endTimePm = dictionary["end_time_pm"] as? String
		id = dictionary["id"] as? Int
		lastUpdate = dictionary["last_update"] as? String
		merchantId = dictionary["merchant_id"] as? Int
		startTime = dictionary["start_time"] as? String
		startTimePm = dictionary["start_time_pm"] as? String
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if customText != nil{
			dictionary["custom_text"] = customText
		}
		if day != nil{
			dictionary["day"] = day
		}
		if dayOfWeek != nil{
			dictionary["day_of_week"] = dayOfWeek
		}
		if endTime != nil{
			dictionary["end_time"] = endTime
		}
		if endTimePm != nil{
			dictionary["end_time_pm"] = endTimePm
		}
		if id != nil{
			dictionary["id"] = id
		}
		if lastUpdate != nil{
			dictionary["last_update"] = lastUpdate
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		if startTime != nil{
			dictionary["start_time"] = startTime
		}
		if startTimePm != nil{
			dictionary["start_time_pm"] = startTimePm
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
         customText = aDecoder.decodeObject(forKey: "custom_text") as? String
         day = aDecoder.decodeObject(forKey: "day") as? String
         dayOfWeek = aDecoder.decodeObject(forKey: "day_of_week") as? Int
         endTime = aDecoder.decodeObject(forKey: "end_time") as? String
         endTimePm = aDecoder.decodeObject(forKey: "end_time_pm") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         lastUpdate = aDecoder.decodeObject(forKey: "last_update") as? String
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         startTime = aDecoder.decodeObject(forKey: "start_time") as? String
         startTimePm = aDecoder.decodeObject(forKey: "start_time_pm") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if customText != nil{
			aCoder.encode(customText, forKey: "custom_text")
		}
		if day != nil{
			aCoder.encode(day, forKey: "day")
		}
		if dayOfWeek != nil{
			aCoder.encode(dayOfWeek, forKey: "day_of_week")
		}
		if endTime != nil{
			aCoder.encode(endTime, forKey: "end_time")
		}
		if endTimePm != nil{
			aCoder.encode(endTimePm, forKey: "end_time_pm")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastUpdate != nil{
			aCoder.encode(lastUpdate, forKey: "last_update")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}
		if startTime != nil{
			aCoder.encode(startTime, forKey: "start_time")
		}
		if startTimePm != nil{
			aCoder.encode(startTimePm, forKey: "start_time_pm")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}