//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class StatsModel : NSObject, NSCoding{

	var monthlyCancelled : Int!
	var monthlyEarning : Int!
	var monthlyRefunded : Int!
	var totalEarning : String!
	var totalOrder : Int!
	var weeklyEarning : Int!
	var weeklySale : Int!
	var yearlySalesByMonths : YearlySalesByMonth!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		monthlyCancelled = dictionary["monthly_cancelled"] as? Int
		monthlyEarning = dictionary["monthly_earning"] as? Int
		monthlyRefunded = dictionary["monthly_refunded"] as? Int
		totalEarning = dictionary["total_earning"] as? String
		totalOrder = dictionary["total_order"] as? Int
		weeklyEarning = dictionary["weekly_earning"] as? Int
		weeklySale = dictionary["weekly_sale"] as? Int
		if let yearlySalesByMonthsData = dictionary["yearly_sales_by_months"] as? [String:Any]{
			yearlySalesByMonths = YearlySalesByMonth(fromDictionary: yearlySalesByMonthsData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if monthlyCancelled != nil{
			dictionary["monthly_cancelled"] = monthlyCancelled
		}
		if monthlyEarning != nil{
			dictionary["monthly_earning"] = monthlyEarning
		}
		if monthlyRefunded != nil{
			dictionary["monthly_refunded"] = monthlyRefunded
		}
		if totalEarning != nil{
			dictionary["total_earning"] = totalEarning
		}
		if totalOrder != nil{
			dictionary["total_order"] = totalOrder
		}
		if weeklyEarning != nil{
			dictionary["weekly_earning"] = weeklyEarning
		}
		if weeklySale != nil{
			dictionary["weekly_sale"] = weeklySale
		}
		if yearlySalesByMonths != nil{
			dictionary["yearly_sales_by_months"] = yearlySalesByMonths.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         monthlyCancelled = aDecoder.decodeObject(forKey: "monthly_cancelled") as? Int
         monthlyEarning = aDecoder.decodeObject(forKey: "monthly_earning") as? Int
         monthlyRefunded = aDecoder.decodeObject(forKey: "monthly_refunded") as? Int
         totalEarning = aDecoder.decodeObject(forKey: "total_earning") as? String
         totalOrder = aDecoder.decodeObject(forKey: "total_order") as? Int
         weeklyEarning = aDecoder.decodeObject(forKey: "weekly_earning") as? Int
         weeklySale = aDecoder.decodeObject(forKey: "weekly_sale") as? Int
         yearlySalesByMonths = aDecoder.decodeObject(forKey: "yearly_sales_by_months") as? YearlySalesByMonth

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if monthlyCancelled != nil{
			aCoder.encode(monthlyCancelled, forKey: "monthly_cancelled")
		}
		if monthlyEarning != nil{
			aCoder.encode(monthlyEarning, forKey: "monthly_earning")
		}
		if monthlyRefunded != nil{
			aCoder.encode(monthlyRefunded, forKey: "monthly_refunded")
		}
		if totalEarning != nil{
			aCoder.encode(totalEarning, forKey: "total_earning")
		}
		if totalOrder != nil{
			aCoder.encode(totalOrder, forKey: "total_order")
		}
		if weeklyEarning != nil{
			aCoder.encode(weeklyEarning, forKey: "weekly_earning")
		}
		if weeklySale != nil{
			aCoder.encode(weeklySale, forKey: "weekly_sale")
		}
		if yearlySalesByMonths != nil{
			aCoder.encode(yearlySalesByMonths, forKey: "yearly_sales_by_months")
		}

	}

}
