//
//  File.swift
//  daretheapp
//
//  Created by Sameer Amjad on 14/02/2023.
//

import Foundation
class UserModel : NSObject, NSCoding{
    
    
    var accesstoken : String!
        var address : String!
        var closeStore : Int!
        var commisionBased : String!
        var commisionType : String!
        var contactEmail : String!
        var contactName : String!
        var contactPhone : String!
        var deliveryDistanceCovered : Int!
        var descriptionField : AnyObject!
        var distanceUnit : String!
        var freeDelivery : Int!
        var headerImage : String!
        var invoiceTerms : Int!
        var isFeatured : Int!
        var isReady : Int!
        var logo : String!
        var membershipExpired : AnyObject!
        var merchantId : Int!
        var merchantType : Int!
        var merchantUuid : String!
        var orders : [AnyObject]!
        var packageId : Int!
        var path : String!
        var path2 : String!
        var pauseOrdering : Int!
        var restaurantName : String!
        var restaurantPhone : String!
        var restaurantSlug : String!
        var reviews : [AnyObject]!
        var shortDescription : AnyObject!
        var totalOrders : Int!
        var totalRating : Int!


        /**
         * Instantiate the instance using the passed dictionary values to set the properties values
         */
        init(fromDictionary dictionary: [String:Any]){
            accesstoken = dictionary["access_token"] as? String
            address = dictionary["address"] as? String
            closeStore = dictionary["close_store"] as? Int
            commisionBased = dictionary["commision_based"] as? String
            commisionType = dictionary["commision_type"] as? String
            contactEmail = dictionary["contact_email"] as? String
            contactName = dictionary["contact_name"] as? String
            contactPhone = dictionary["contact_phone"] as? String
            deliveryDistanceCovered = dictionary["delivery_distance_covered"] as? Int
            descriptionField = dictionary["description"] as? AnyObject
            distanceUnit = dictionary["distance_unit"] as? String
            freeDelivery = dictionary["free_delivery"] as? Int
            headerImage = dictionary["header_image"] as? String
            invoiceTerms = dictionary["invoice_terms"] as? Int
            isFeatured = dictionary["is_featured"] as? Int
            isReady = dictionary["is_ready"] as? Int
            logo = dictionary["logo"] as? String
            membershipExpired = dictionary["membership_expired"] as? AnyObject
            merchantId = dictionary["merchant_id"] as? Int
            merchantType = dictionary["merchant_type"] as? Int
            merchantUuid = dictionary["merchant_uuid"] as? String
            orders = dictionary["orders"] as? [AnyObject]
            packageId = dictionary["package_id"] as? Int
            path = dictionary["path"] as? String
            path2 = dictionary["path2"] as? String
            pauseOrdering = dictionary["pause_ordering"] as? Int
            restaurantName = dictionary["restaurant_name"] as? String
            restaurantPhone = dictionary["restaurant_phone"] as? String
            restaurantSlug = dictionary["restaurant_slug"] as? String
            reviews = dictionary["reviews"] as? [AnyObject]
            shortDescription = dictionary["short_description"] as? AnyObject
            totalOrders = dictionary["total_orders"] as? Int
            totalRating = dictionary["total_rating"] as? Int
        }

        /**
         * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
         */
        func toDictionary() -> [String:Any]
        {
            var dictionary = [String:Any]()
            if accesstoken != nil{
                dictionary["access_token"] = accesstoken
            }
            if address != nil{
                dictionary["address"] = address
            }
            if closeStore != nil{
                dictionary["close_store"] = closeStore
            }
            if commisionBased != nil{
                dictionary["commision_based"] = commisionBased
            }
            if commisionType != nil{
                dictionary["commision_type"] = commisionType
            }
            if contactEmail != nil{
                dictionary["contact_email"] = contactEmail
            }
            if contactName != nil{
                dictionary["contact_name"] = contactName
            }
            if contactPhone != nil{
                dictionary["contact_phone"] = contactPhone
            }
            if deliveryDistanceCovered != nil{
                dictionary["delivery_distance_covered"] = deliveryDistanceCovered
            }
            if descriptionField != nil{
                dictionary["description"] = descriptionField
            }
            if distanceUnit != nil{
                dictionary["distance_unit"] = distanceUnit
            }
            if freeDelivery != nil{
                dictionary["free_delivery"] = freeDelivery
            }
            if headerImage != nil{
                dictionary["header_image"] = headerImage
            }
            if invoiceTerms != nil{
                dictionary["invoice_terms"] = invoiceTerms
            }
            if isFeatured != nil{
                dictionary["is_featured"] = isFeatured
            }
            if isReady != nil{
                dictionary["is_ready"] = isReady
            }
            if logo != nil{
                dictionary["logo"] = logo
            }
            if membershipExpired != nil{
                dictionary["membership_expired"] = membershipExpired
            }
            if merchantId != nil{
                dictionary["merchant_id"] = merchantId
            }
            if merchantType != nil{
                dictionary["merchant_type"] = merchantType
            }
            if merchantUuid != nil{
                dictionary["merchant_uuid"] = merchantUuid
            }
            if orders != nil{
                dictionary["orders"] = orders
            }
            if packageId != nil{
                dictionary["package_id"] = packageId
            }
            if path != nil{
                dictionary["path"] = path
            }
            if path2 != nil{
                dictionary["path2"] = path2
            }
            if pauseOrdering != nil{
                dictionary["pause_ordering"] = pauseOrdering
            }
            if restaurantName != nil{
                dictionary["restaurant_name"] = restaurantName
            }
            if restaurantPhone != nil{
                dictionary["restaurant_phone"] = restaurantPhone
            }
            if restaurantSlug != nil{
                dictionary["restaurant_slug"] = restaurantSlug
            }
            if reviews != nil{
                dictionary["reviews"] = reviews
            }
            if shortDescription != nil{
                dictionary["short_description"] = shortDescription
            }
            if totalOrders != nil{
                dictionary["total_orders"] = totalOrders
            }
            if totalRating != nil{
                dictionary["total_rating"] = totalRating
            }
            return dictionary
        }

        /**
        * NSCoding required initializer.
        * Fills the data from the passed decoder
        */
        @objc required init(coder aDecoder: NSCoder)
        {
             accesstoken = aDecoder.decodeObject(forKey: "access_token") as? String
             address = aDecoder.decodeObject(forKey: "address") as? String
             closeStore = aDecoder.decodeObject(forKey: "close_store") as? Int
             commisionBased = aDecoder.decodeObject(forKey: "commision_based") as? String
             commisionType = aDecoder.decodeObject(forKey: "commision_type") as? String
             contactEmail = aDecoder.decodeObject(forKey: "contact_email") as? String
             contactName = aDecoder.decodeObject(forKey: "contact_name") as? String
             contactPhone = aDecoder.decodeObject(forKey: "contact_phone") as? String
             deliveryDistanceCovered = aDecoder.decodeObject(forKey: "delivery_distance_covered") as? Int
             descriptionField = aDecoder.decodeObject(forKey: "description") as? AnyObject
             distanceUnit = aDecoder.decodeObject(forKey: "distance_unit") as? String
             freeDelivery = aDecoder.decodeObject(forKey: "free_delivery") as? Int
             headerImage = aDecoder.decodeObject(forKey: "header_image") as? String
             invoiceTerms = aDecoder.decodeObject(forKey: "invoice_terms") as? Int
             isFeatured = aDecoder.decodeObject(forKey: "is_featured") as? Int
             isReady = aDecoder.decodeObject(forKey: "is_ready") as? Int
             logo = aDecoder.decodeObject(forKey: "logo") as? String
             membershipExpired = aDecoder.decodeObject(forKey: "membership_expired") as? AnyObject
             merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
             merchantType = aDecoder.decodeObject(forKey: "merchant_type") as? Int
             merchantUuid = aDecoder.decodeObject(forKey: "merchant_uuid") as? String
             orders = aDecoder.decodeObject(forKey: "orders") as? [AnyObject]
             packageId = aDecoder.decodeObject(forKey: "package_id") as? Int
             path = aDecoder.decodeObject(forKey: "path") as? String
             path2 = aDecoder.decodeObject(forKey: "path2") as? String
             pauseOrdering = aDecoder.decodeObject(forKey: "pause_ordering") as? Int
             restaurantName = aDecoder.decodeObject(forKey: "restaurant_name") as? String
             restaurantPhone = aDecoder.decodeObject(forKey: "restaurant_phone") as? String
             restaurantSlug = aDecoder.decodeObject(forKey: "restaurant_slug") as? String
             reviews = aDecoder.decodeObject(forKey: "reviews") as? [AnyObject]
             shortDescription = aDecoder.decodeObject(forKey: "short_description") as? AnyObject
             totalOrders = aDecoder.decodeObject(forKey: "total_orders") as? Int
             totalRating = aDecoder.decodeObject(forKey: "total_rating") as? Int

        }

        /**
        * NSCoding required method.
        * Encodes mode properties into the decoder
        */
        @objc func encode(with aCoder: NSCoder)
        {
            if accesstoken != nil{
                aCoder.encode(accesstoken, forKey: "access_token")
            }
            if address != nil{
                aCoder.encode(address, forKey: "address")
            }
            if closeStore != nil{
                aCoder.encode(closeStore, forKey: "close_store")
            }
            if commisionBased != nil{
                aCoder.encode(commisionBased, forKey: "commision_based")
            }
            if commisionType != nil{
                aCoder.encode(commisionType, forKey: "commision_type")
            }
            if contactEmail != nil{
                aCoder.encode(contactEmail, forKey: "contact_email")
            }
            if contactName != nil{
                aCoder.encode(contactName, forKey: "contact_name")
            }
            if contactPhone != nil{
                aCoder.encode(contactPhone, forKey: "contact_phone")
            }
            if deliveryDistanceCovered != nil{
                aCoder.encode(deliveryDistanceCovered, forKey: "delivery_distance_covered")
            }
            if descriptionField != nil{
                aCoder.encode(descriptionField, forKey: "description")
            }
            if distanceUnit != nil{
                aCoder.encode(distanceUnit, forKey: "distance_unit")
            }
            if freeDelivery != nil{
                aCoder.encode(freeDelivery, forKey: "free_delivery")
            }
            if headerImage != nil{
                aCoder.encode(headerImage, forKey: "header_image")
            }
            if invoiceTerms != nil{
                aCoder.encode(invoiceTerms, forKey: "invoice_terms")
            }
            if isFeatured != nil{
                aCoder.encode(isFeatured, forKey: "is_featured")
            }
            if isReady != nil{
                aCoder.encode(isReady, forKey: "is_ready")
            }
            if logo != nil{
                aCoder.encode(logo, forKey: "logo")
            }
            if membershipExpired != nil{
                aCoder.encode(membershipExpired, forKey: "membership_expired")
            }
            if merchantId != nil{
                aCoder.encode(merchantId, forKey: "merchant_id")
            }
            if merchantType != nil{
                aCoder.encode(merchantType, forKey: "merchant_type")
            }
            if merchantUuid != nil{
                aCoder.encode(merchantUuid, forKey: "merchant_uuid")
            }
            if orders != nil{
                aCoder.encode(orders, forKey: "orders")
            }
            if packageId != nil{
                aCoder.encode(packageId, forKey: "package_id")
            }
            if path != nil{
                aCoder.encode(path, forKey: "path")
            }
            if path2 != nil{
                aCoder.encode(path2, forKey: "path2")
            }
            if pauseOrdering != nil{
                aCoder.encode(pauseOrdering, forKey: "pause_ordering")
            }
            if restaurantName != nil{
                aCoder.encode(restaurantName, forKey: "restaurant_name")
            }
            if restaurantPhone != nil{
                aCoder.encode(restaurantPhone, forKey: "restaurant_phone")
            }
            if restaurantSlug != nil{
                aCoder.encode(restaurantSlug, forKey: "restaurant_slug")
            }
            if reviews != nil{
                aCoder.encode(reviews, forKey: "reviews")
            }
            if shortDescription != nil{
                aCoder.encode(shortDescription, forKey: "short_description")
            }
            if totalOrders != nil{
                aCoder.encode(totalOrders, forKey: "total_orders")
            }
            if totalRating != nil{
                aCoder.encode(totalRating, forKey: "total_rating")
            }

        }

    }
