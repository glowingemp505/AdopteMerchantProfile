//
//	ItemsModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ItemsModel : NSObject, NSCoding{

	var available : Int!
	var availableAtSpecific : Int!
	var categories : [Category]!
	var colorHex : String!
	var cookingRefRequired : Int!
	var dateCreated : String!
	var dateModified : String!
	var favourites : Favourite!
	var ingredientsPreselected : Int!
	var ipAddress : String!
	var isFavourite : Bool!
	var isFeatured : String!
	var itemDescription : String!
	var itemId : Int!
	var itemMeta : ItemMeta!
	var itemName : String!
	var itemShortDescription : String!
	var itemToken : String!
	var merchantId : Int!
	var metaDescription : AnyObject!
	var metaImage : String!
	var metaImagePath : String!
	var metaKeywords : AnyObject!
	var metaTitle : String!
	var nonTaxable : Int!
	var notForSale : Int!
	var packagingFee : Int!
	var packagingIncremental : Int!
	var path : String!
	var photo : String!
	var pointsEarned : Int!
	var pointsEnabled : Int!
	var prices : [Price]!
	var sequence : Int!
	var sku : String!
	var slug : String!
	var status : String!
	var supplierId : Int!
	var trackStock : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		available = dictionary["available"] as? Int
		availableAtSpecific = dictionary["available_at_specific"] as? Int
		categories = [Category]()
		if let categoriesArray = dictionary["categories"] as? [[String:Any]]{
			for dic in categoriesArray{
				let value = Category(fromDictionary: dic)
				categories.append(value)
			}
		}
		colorHex = dictionary["color_hex"] as? String
		cookingRefRequired = dictionary["cooking_ref_required"] as? Int
		dateCreated = dictionary["date_created"] as? String
		dateModified = dictionary["date_modified"] as? String
		if let favouritesData = dictionary["favourites"] as? [String:Any]{
			favourites = Favourite(fromDictionary: favouritesData)
		}
		ingredientsPreselected = dictionary["ingredients_preselected"] as? Int
		ipAddress = dictionary["ip_address"] as? String
		isFavourite = dictionary["is_favourite"] as? Bool
		isFeatured = dictionary["is_featured"] as? String
		itemDescription = dictionary["item_description"] as? String
		itemId = dictionary["item_id"] as? Int
		if let itemMetaData = dictionary["item_meta"] as? [String:Any]{
			itemMeta = ItemMeta(fromDictionary: itemMetaData)
		}
		itemName = dictionary["item_name"] as? String
		itemShortDescription = dictionary["item_short_description"] as? String
		itemToken = dictionary["item_token"] as? String
		merchantId = dictionary["merchant_id"] as? Int
		metaDescription = dictionary["meta_description"] as? AnyObject
		metaImage = dictionary["meta_image"] as? String
		metaImagePath = dictionary["meta_image_path"] as? String
		metaKeywords = dictionary["meta_keywords"] as? AnyObject
		metaTitle = dictionary["meta_title"] as? String
		nonTaxable = dictionary["non_taxable"] as? Int
		notForSale = dictionary["not_for_sale"] as? Int
		packagingFee = dictionary["packaging_fee"] as? Int
		packagingIncremental = dictionary["packaging_incremental"] as? Int
		path = dictionary["path"] as? String
		photo = dictionary["photo"] as? String
		pointsEarned = dictionary["points_earned"] as? Int
		pointsEnabled = dictionary["points_enabled"] as? Int
		prices = [Price]()
		if let pricesArray = dictionary["prices"] as? [[String:Any]]{
			for dic in pricesArray{
				let value = Price(fromDictionary: dic)
				prices.append(value)
			}
		}
		sequence = dictionary["sequence"] as? Int
		sku = dictionary["sku"] as? String
		slug = dictionary["slug"] as? String
		status = dictionary["status"] as? String
		supplierId = dictionary["supplier_id"] as? Int
		trackStock = dictionary["track_stock"] as? Int
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
		if availableAtSpecific != nil{
			dictionary["available_at_specific"] = availableAtSpecific
		}
		if categories != nil{
			var dictionaryElements = [[String:Any]]()
			for categoriesElement in categories {
				dictionaryElements.append(categoriesElement.toDictionary())
			}
			dictionary["categories"] = dictionaryElements
		}
		if colorHex != nil{
			dictionary["color_hex"] = colorHex
		}
		if cookingRefRequired != nil{
			dictionary["cooking_ref_required"] = cookingRefRequired
		}
		if dateCreated != nil{
			dictionary["date_created"] = dateCreated
		}
		if dateModified != nil{
			dictionary["date_modified"] = dateModified
		}
		if favourites != nil{
			dictionary["favourites"] = favourites.toDictionary()
		}
		if ingredientsPreselected != nil{
			dictionary["ingredients_preselected"] = ingredientsPreselected
		}
		if ipAddress != nil{
			dictionary["ip_address"] = ipAddress
		}
		if isFavourite != nil{
			dictionary["is_favourite"] = isFavourite
		}
		if isFeatured != nil{
			dictionary["is_featured"] = isFeatured
		}
		if itemDescription != nil{
			dictionary["item_description"] = itemDescription
		}
		if itemId != nil{
			dictionary["item_id"] = itemId
		}
		if itemMeta != nil{
			dictionary["item_meta"] = itemMeta.toDictionary()
		}
		if itemName != nil{
			dictionary["item_name"] = itemName
		}
		if itemShortDescription != nil{
			dictionary["item_short_description"] = itemShortDescription
		}
		if itemToken != nil{
			dictionary["item_token"] = itemToken
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		if metaDescription != nil{
			dictionary["meta_description"] = metaDescription
		}
		if metaImage != nil{
			dictionary["meta_image"] = metaImage
		}
		if metaImagePath != nil{
			dictionary["meta_image_path"] = metaImagePath
		}
		if metaKeywords != nil{
			dictionary["meta_keywords"] = metaKeywords
		}
		if metaTitle != nil{
			dictionary["meta_title"] = metaTitle
		}
		if nonTaxable != nil{
			dictionary["non_taxable"] = nonTaxable
		}
		if notForSale != nil{
			dictionary["not_for_sale"] = notForSale
		}
		if packagingFee != nil{
			dictionary["packaging_fee"] = packagingFee
		}
		if packagingIncremental != nil{
			dictionary["packaging_incremental"] = packagingIncremental
		}
		if path != nil{
			dictionary["path"] = path
		}
		if photo != nil{
			dictionary["photo"] = photo
		}
		if pointsEarned != nil{
			dictionary["points_earned"] = pointsEarned
		}
		if pointsEnabled != nil{
			dictionary["points_enabled"] = pointsEnabled
		}
		if prices != nil{
			var dictionaryElements = [[String:Any]]()
			for pricesElement in prices {
				dictionaryElements.append(pricesElement.toDictionary())
			}
			dictionary["prices"] = dictionaryElements
		}
		if sequence != nil{
			dictionary["sequence"] = sequence
		}
		if sku != nil{
			dictionary["sku"] = sku
		}
		if slug != nil{
			dictionary["slug"] = slug
		}
		if status != nil{
			dictionary["status"] = status
		}
		if supplierId != nil{
			dictionary["supplier_id"] = supplierId
		}
		if trackStock != nil{
			dictionary["track_stock"] = trackStock
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
         availableAtSpecific = aDecoder.decodeObject(forKey: "available_at_specific") as? Int
         categories = aDecoder.decodeObject(forKey :"categories") as? [Category]
         colorHex = aDecoder.decodeObject(forKey: "color_hex") as? String
         cookingRefRequired = aDecoder.decodeObject(forKey: "cooking_ref_required") as? Int
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         favourites = aDecoder.decodeObject(forKey: "favourites") as? Favourite
         ingredientsPreselected = aDecoder.decodeObject(forKey: "ingredients_preselected") as? Int
         ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
         isFavourite = aDecoder.decodeObject(forKey: "is_favourite") as? Bool
         isFeatured = aDecoder.decodeObject(forKey: "is_featured") as? String
         itemDescription = aDecoder.decodeObject(forKey: "item_description") as? String
         itemId = aDecoder.decodeObject(forKey: "item_id") as? Int
         itemMeta = aDecoder.decodeObject(forKey: "item_meta") as? ItemMeta
         itemName = aDecoder.decodeObject(forKey: "item_name") as? String
         itemShortDescription = aDecoder.decodeObject(forKey: "item_short_description") as? String
         itemToken = aDecoder.decodeObject(forKey: "item_token") as? String
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         metaDescription = aDecoder.decodeObject(forKey: "meta_description") as? AnyObject
         metaImage = aDecoder.decodeObject(forKey: "meta_image") as? String
         metaImagePath = aDecoder.decodeObject(forKey: "meta_image_path") as? String
         metaKeywords = aDecoder.decodeObject(forKey: "meta_keywords") as? AnyObject
         metaTitle = aDecoder.decodeObject(forKey: "meta_title") as? String
         nonTaxable = aDecoder.decodeObject(forKey: "non_taxable") as? Int
         notForSale = aDecoder.decodeObject(forKey: "not_for_sale") as? Int
         packagingFee = aDecoder.decodeObject(forKey: "packaging_fee") as? Int
         packagingIncremental = aDecoder.decodeObject(forKey: "packaging_incremental") as? Int
         path = aDecoder.decodeObject(forKey: "path") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         pointsEarned = aDecoder.decodeObject(forKey: "points_earned") as? Int
         pointsEnabled = aDecoder.decodeObject(forKey: "points_enabled") as? Int
         prices = aDecoder.decodeObject(forKey :"prices") as? [Price]
         sequence = aDecoder.decodeObject(forKey: "sequence") as? Int
         sku = aDecoder.decodeObject(forKey: "sku") as? String
         slug = aDecoder.decodeObject(forKey: "slug") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         supplierId = aDecoder.decodeObject(forKey: "supplier_id") as? Int
         trackStock = aDecoder.decodeObject(forKey: "track_stock") as? Int

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
		if availableAtSpecific != nil{
			aCoder.encode(availableAtSpecific, forKey: "available_at_specific")
		}
		if categories != nil{
			aCoder.encode(categories, forKey: "categories")
		}
		if colorHex != nil{
			aCoder.encode(colorHex, forKey: "color_hex")
		}
		if cookingRefRequired != nil{
			aCoder.encode(cookingRefRequired, forKey: "cooking_ref_required")
		}
		if dateCreated != nil{
			aCoder.encode(dateCreated, forKey: "date_created")
		}
		if dateModified != nil{
			aCoder.encode(dateModified, forKey: "date_modified")
		}
		if favourites != nil{
			aCoder.encode(favourites, forKey: "favourites")
		}
		if ingredientsPreselected != nil{
			aCoder.encode(ingredientsPreselected, forKey: "ingredients_preselected")
		}
		if ipAddress != nil{
			aCoder.encode(ipAddress, forKey: "ip_address")
		}
		if isFavourite != nil{
			aCoder.encode(isFavourite, forKey: "is_favourite")
		}
		if isFeatured != nil{
			aCoder.encode(isFeatured, forKey: "is_featured")
		}
		if itemDescription != nil{
			aCoder.encode(itemDescription, forKey: "item_description")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if itemMeta != nil{
			aCoder.encode(itemMeta, forKey: "item_meta")
		}
		if itemName != nil{
			aCoder.encode(itemName, forKey: "item_name")
		}
		if itemShortDescription != nil{
			aCoder.encode(itemShortDescription, forKey: "item_short_description")
		}
		if itemToken != nil{
			aCoder.encode(itemToken, forKey: "item_token")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}
		if metaDescription != nil{
			aCoder.encode(metaDescription, forKey: "meta_description")
		}
		if metaImage != nil{
			aCoder.encode(metaImage, forKey: "meta_image")
		}
		if metaImagePath != nil{
			aCoder.encode(metaImagePath, forKey: "meta_image_path")
		}
		if metaKeywords != nil{
			aCoder.encode(metaKeywords, forKey: "meta_keywords")
		}
		if metaTitle != nil{
			aCoder.encode(metaTitle, forKey: "meta_title")
		}
		if nonTaxable != nil{
			aCoder.encode(nonTaxable, forKey: "non_taxable")
		}
		if notForSale != nil{
			aCoder.encode(notForSale, forKey: "not_for_sale")
		}
		if packagingFee != nil{
			aCoder.encode(packagingFee, forKey: "packaging_fee")
		}
		if packagingIncremental != nil{
			aCoder.encode(packagingIncremental, forKey: "packaging_incremental")
		}
		if path != nil{
			aCoder.encode(path, forKey: "path")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if pointsEarned != nil{
			aCoder.encode(pointsEarned, forKey: "points_earned")
		}
		if pointsEnabled != nil{
			aCoder.encode(pointsEnabled, forKey: "points_enabled")
		}
		if prices != nil{
			aCoder.encode(prices, forKey: "prices")
		}
		if sequence != nil{
			aCoder.encode(sequence, forKey: "sequence")
		}
		if sku != nil{
			aCoder.encode(sku, forKey: "sku")
		}
		if slug != nil{
			aCoder.encode(slug, forKey: "slug")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if supplierId != nil{
			aCoder.encode(supplierId, forKey: "supplier_id")
		}
		if trackStock != nil{
			aCoder.encode(trackStock, forKey: "track_stock")
		}

	}

}