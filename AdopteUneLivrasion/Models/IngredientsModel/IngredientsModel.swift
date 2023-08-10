//
//	IngredientsModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class IngredientsModel : NSObject, NSCoding{

        var dateCreated : String!
        var dateModified : String!
        var ingredientsId : Int!
        var ingredientsName : String!
        var ipAddress : String!
        var merchantId : Int!
        var sequence : Int!
        var status : String!


        /**
         * Instantiate the instance using the passed dictionary values to set the properties values
         */
        init(fromDictionary dictionary: [String:Any]){
            dateCreated = dictionary["date_created"] as? String
            dateModified = dictionary["date_modified"] as? String
            ingredientsId = dictionary["ingredients_id"] as? Int
            ingredientsName = dictionary["ingredients_name"] as? String
            ipAddress = dictionary["ip_address"] as? String
            merchantId = dictionary["merchant_id"] as? Int
            sequence = dictionary["sequence"] as? Int
            status = dictionary["status"] as? String
        }

        /**
         * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
         */
        func toDictionary() -> [String:Any]
        {
            var dictionary = [String:Any]()
            if dateCreated != nil{
                dictionary["date_created"] = dateCreated
            }
            if dateModified != nil{
                dictionary["date_modified"] = dateModified
            }
            if ingredientsId != nil{
                dictionary["ingredients_id"] = ingredientsId
            }
            if ingredientsName != nil{
                dictionary["ingredients_name"] = ingredientsName
            }
            if ipAddress != nil{
                dictionary["ip_address"] = ipAddress
            }
            if merchantId != nil{
                dictionary["merchant_id"] = merchantId
            }
            if sequence != nil{
                dictionary["sequence"] = sequence
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
             dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
             dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
             ingredientsId = aDecoder.decodeObject(forKey: "ingredients_id") as? Int
             ingredientsName = aDecoder.decodeObject(forKey: "ingredients_name") as? String
             ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
             merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
             sequence = aDecoder.decodeObject(forKey: "sequence") as? Int
             status = aDecoder.decodeObject(forKey: "status") as? String

        }

        /**
        * NSCoding required method.
        * Encodes mode properties into the decoder
        */
        @objc func encode(with aCoder: NSCoder)
        {
            if dateCreated != nil{
                aCoder.encode(dateCreated, forKey: "date_created")
            }
            if dateModified != nil{
                aCoder.encode(dateModified, forKey: "date_modified")
            }
            if ingredientsId != nil{
                aCoder.encode(ingredientsId, forKey: "ingredients_id")
            }
            if ingredientsName != nil{
                aCoder.encode(ingredientsName, forKey: "ingredients_name")
            }
            if ipAddress != nil{
                aCoder.encode(ipAddress, forKey: "ip_address")
            }
            if merchantId != nil{
                aCoder.encode(merchantId, forKey: "merchant_id")
            }
            if sequence != nil{
                aCoder.encode(sequence, forKey: "sequence")
            }
            if status != nil{
                aCoder.encode(status, forKey: "status")
            }

        }

    }
