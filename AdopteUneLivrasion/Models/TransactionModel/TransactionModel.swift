//
//	TransactionModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class TransactionModel : NSObject, NSCoding{

	var cardId : Int!
	var ipAddress : String!
	var runningBalance : String!
	var status : String!
	var transactionAmount : String!
	var transactionDate : AnyObject!
	var transactionDescription : String!
	var transactionDescriptionParameters : String!
	var transactionId : Int!
	var transactionType : String!
	var transactionUuid : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		cardId = dictionary["card_id"] as? Int
		ipAddress = dictionary["ip_address"] as? String
		runningBalance = dictionary["running_balance"] as? String
		status = dictionary["status"] as? String
		transactionAmount = dictionary["transaction_amount"] as? String
		transactionDate = dictionary["transaction_date"] as? AnyObject
		transactionDescription = dictionary["transaction_description"] as? String
		transactionDescriptionParameters = dictionary["transaction_description_parameters"] as? String
		transactionId = dictionary["transaction_id"] as? Int
		transactionType = dictionary["transaction_type"] as? String
		transactionUuid = dictionary["transaction_uuid"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cardId != nil{
			dictionary["card_id"] = cardId
		}
		if ipAddress != nil{
			dictionary["ip_address"] = ipAddress
		}
		if runningBalance != nil{
			dictionary["running_balance"] = runningBalance
		}
		if status != nil{
			dictionary["status"] = status
		}
		if transactionAmount != nil{
			dictionary["transaction_amount"] = transactionAmount
		}
		if transactionDate != nil{
			dictionary["transaction_date"] = transactionDate
		}
		if transactionDescription != nil{
			dictionary["transaction_description"] = transactionDescription
		}
		if transactionDescriptionParameters != nil{
			dictionary["transaction_description_parameters"] = transactionDescriptionParameters
		}
		if transactionId != nil{
			dictionary["transaction_id"] = transactionId
		}
		if transactionType != nil{
			dictionary["transaction_type"] = transactionType
		}
		if transactionUuid != nil{
			dictionary["transaction_uuid"] = transactionUuid
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cardId = aDecoder.decodeObject(forKey: "card_id") as? Int
         ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
         runningBalance = aDecoder.decodeObject(forKey: "running_balance") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         transactionAmount = aDecoder.decodeObject(forKey: "transaction_amount") as? String
         transactionDate = aDecoder.decodeObject(forKey: "transaction_date") as? AnyObject
         transactionDescription = aDecoder.decodeObject(forKey: "transaction_description") as? String
         transactionDescriptionParameters = aDecoder.decodeObject(forKey: "transaction_description_parameters") as? String
         transactionId = aDecoder.decodeObject(forKey: "transaction_id") as? Int
         transactionType = aDecoder.decodeObject(forKey: "transaction_type") as? String
         transactionUuid = aDecoder.decodeObject(forKey: "transaction_uuid") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if cardId != nil{
			aCoder.encode(cardId, forKey: "card_id")
		}
		if ipAddress != nil{
			aCoder.encode(ipAddress, forKey: "ip_address")
		}
		if runningBalance != nil{
			aCoder.encode(runningBalance, forKey: "running_balance")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if transactionAmount != nil{
			aCoder.encode(transactionAmount, forKey: "transaction_amount")
		}
		if transactionDate != nil{
			aCoder.encode(transactionDate, forKey: "transaction_date")
		}
		if transactionDescription != nil{
			aCoder.encode(transactionDescription, forKey: "transaction_description")
		}
		if transactionDescriptionParameters != nil{
			aCoder.encode(transactionDescriptionParameters, forKey: "transaction_description_parameters")
		}
		if transactionId != nil{
			aCoder.encode(transactionId, forKey: "transaction_id")
		}
		if transactionType != nil{
			aCoder.encode(transactionType, forKey: "transaction_type")
		}
		if transactionUuid != nil{
			aCoder.encode(transactionUuid, forKey: "transaction_uuid")
		}

	}

}