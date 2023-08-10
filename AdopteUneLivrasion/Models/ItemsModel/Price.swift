//
//	Price.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Price : NSObject, NSCoding{

	var available : Int!
	var costPrice : Int!
	var createdAt : String!
	var discount : Int!
	var discountEnd : AnyObject!
	var discountStart : AnyObject!
	var discountType : String!
	var itemId : Int!
	var itemSizeId : Int!
	var itemToken : String!
	var lowStock : Int!
	var merchantId : Int!
	var price : Int!
	var sequence : Int!
	var size : Size!
	var sizeId : Int!
	var sku : String!
	var updatedAt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		available = dictionary["available"] as? Int
		costPrice = dictionary["cost_price"] as? Int
		createdAt = dictionary["created_at"] as? String
		discount = dictionary["discount"] as? Int
		discountEnd = dictionary["discount_end"] as? AnyObject
		discountStart = dictionary["discount_start"] as? AnyObject
		discountType = dictionary["discount_type"] as? String
		itemId = dictionary["item_id"] as? Int
		itemSizeId = dictionary["item_size_id"] as? Int
		itemToken = dictionary["item_token"] as? String
		lowStock = dictionary["low_stock"] as? Int
		merchantId = dictionary["merchant_id"] as? Int
		price = dictionary["price"] as? Int
		sequence = dictionary["sequence"] as? Int
		if let sizeData = dictionary["size"] as? [String:Any]{
			size = Size(fromDictionary: sizeData)
		}
		sizeId = dictionary["size_id"] as? Int
		sku = dictionary["sku"] as? String
		updatedAt = dictionary["updated_at"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if available != nil{
			dictionary["available"] = available
		}
		if costPrice != nil{
			dictionary["cost_price"] = costPrice
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if discount != nil{
			dictionary["discount"] = discount
		}
		if discountEnd != nil{
			dictionary["discount_end"] = discountEnd
		}
		if discountStart != nil{
			dictionary["discount_start"] = discountStart
		}
		if discountType != nil{
			dictionary["discount_type"] = discountType
		}
		if itemId != nil{
			dictionary["item_id"] = itemId
		}
		if itemSizeId != nil{
			dictionary["item_size_id"] = itemSizeId
		}
		if itemToken != nil{
			dictionary["item_token"] = itemToken
		}
		if lowStock != nil{
			dictionary["low_stock"] = lowStock
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		if price != nil{
			dictionary["price"] = price
		}
		if sequence != nil{
			dictionary["sequence"] = sequence
		}
		if size != nil{
			dictionary["size"] = size.toDictionary()
		}
		if sizeId != nil{
			dictionary["size_id"] = sizeId
		}
		if sku != nil{
			dictionary["sku"] = sku
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         available = aDecoder.decodeObject(forKey: "available") as? Int
         costPrice = aDecoder.decodeObject(forKey: "cost_price") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         discount = aDecoder.decodeObject(forKey: "discount") as? Int
         discountEnd = aDecoder.decodeObject(forKey: "discount_end") as? AnyObject
         discountStart = aDecoder.decodeObject(forKey: "discount_start") as? AnyObject
         discountType = aDecoder.decodeObject(forKey: "discount_type") as? String
         itemId = aDecoder.decodeObject(forKey: "item_id") as? Int
         itemSizeId = aDecoder.decodeObject(forKey: "item_size_id") as? Int
         itemToken = aDecoder.decodeObject(forKey: "item_token") as? String
         lowStock = aDecoder.decodeObject(forKey: "low_stock") as? Int
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         price = aDecoder.decodeObject(forKey: "price") as? Int
         sequence = aDecoder.decodeObject(forKey: "sequence") as? Int
         size = aDecoder.decodeObject(forKey: "size") as? Size
         sizeId = aDecoder.decodeObject(forKey: "size_id") as? Int
         sku = aDecoder.decodeObject(forKey: "sku") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if available != nil{
			aCoder.encode(available, forKey: "available")
		}
		if costPrice != nil{
			aCoder.encode(costPrice, forKey: "cost_price")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if discount != nil{
			aCoder.encode(discount, forKey: "discount")
		}
		if discountEnd != nil{
			aCoder.encode(discountEnd, forKey: "discount_end")
		}
		if discountStart != nil{
			aCoder.encode(discountStart, forKey: "discount_start")
		}
		if discountType != nil{
			aCoder.encode(discountType, forKey: "discount_type")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if itemSizeId != nil{
			aCoder.encode(itemSizeId, forKey: "item_size_id")
		}
		if itemToken != nil{
			aCoder.encode(itemToken, forKey: "item_token")
		}
		if lowStock != nil{
			aCoder.encode(lowStock, forKey: "low_stock")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if sequence != nil{
			aCoder.encode(sequence, forKey: "sequence")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if sizeId != nil{
			aCoder.encode(sizeId, forKey: "size_id")
		}
		if sku != nil{
			aCoder.encode(sku, forKey: "sku")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}