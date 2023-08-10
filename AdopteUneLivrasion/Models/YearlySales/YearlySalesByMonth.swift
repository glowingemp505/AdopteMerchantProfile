//
//	YearlySalesByMonth.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class YearlySalesByMonth : NSObject, NSCoding{

	var april : Int!
	var august : Int!
	var december : Int!
	var february : Int!
	var january : Int!
	var july : Int!
	var june : Int!
	var march : Int!
	var may : Int!
	var november : Int!
	var october : Int!
	var september : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		april = dictionary["April"] as? Int
		august = dictionary["August"] as? Int
		december = dictionary["December"] as? Int
		february = dictionary["February"] as? Int
		january = dictionary["January"] as? Int
		july = dictionary["July"] as? Int
		june = dictionary["June"] as? Int
		march = dictionary["March"] as? Int
		may = dictionary["May"] as? Int
		november = dictionary["November"] as? Int
		october = dictionary["October"] as? Int
		september = dictionary["September"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if april != nil{
			dictionary["April"] = april
		}
		if august != nil{
			dictionary["August"] = august
		}
		if december != nil{
			dictionary["December"] = december
		}
		if february != nil{
			dictionary["February"] = february
		}
		if january != nil{
			dictionary["January"] = january
		}
		if july != nil{
			dictionary["July"] = july
		}
		if june != nil{
			dictionary["June"] = june
		}
		if march != nil{
			dictionary["March"] = march
		}
		if may != nil{
			dictionary["May"] = may
		}
		if november != nil{
			dictionary["November"] = november
		}
		if october != nil{
			dictionary["October"] = october
		}
		if september != nil{
			dictionary["September"] = september
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         april = aDecoder.decodeObject(forKey: "April") as? Int
         august = aDecoder.decodeObject(forKey: "August") as? Int
         december = aDecoder.decodeObject(forKey: "December") as? Int
         february = aDecoder.decodeObject(forKey: "February") as? Int
         january = aDecoder.decodeObject(forKey: "January") as? Int
         july = aDecoder.decodeObject(forKey: "July") as? Int
         june = aDecoder.decodeObject(forKey: "June") as? Int
         march = aDecoder.decodeObject(forKey: "March") as? Int
         may = aDecoder.decodeObject(forKey: "May") as? Int
         november = aDecoder.decodeObject(forKey: "November") as? Int
         october = aDecoder.decodeObject(forKey: "October") as? Int
         september = aDecoder.decodeObject(forKey: "September") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if april != nil{
			aCoder.encode(april, forKey: "April")
		}
		if august != nil{
			aCoder.encode(august, forKey: "August")
		}
		if december != nil{
			aCoder.encode(december, forKey: "December")
		}
		if february != nil{
			aCoder.encode(february, forKey: "February")
		}
		if january != nil{
			aCoder.encode(january, forKey: "January")
		}
		if july != nil{
			aCoder.encode(july, forKey: "July")
		}
		if june != nil{
			aCoder.encode(june, forKey: "June")
		}
		if march != nil{
			aCoder.encode(march, forKey: "March")
		}
		if may != nil{
			aCoder.encode(may, forKey: "May")
		}
		if november != nil{
			aCoder.encode(november, forKey: "November")
		}
		if october != nil{
			aCoder.encode(october, forKey: "October")
		}
		if september != nil{
			aCoder.encode(september, forKey: "September")
		}

	}

}