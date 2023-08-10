//
//	Client.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Client : NSObject, NSCoding{

	var accountVerified : Int!
	var avatar : String!
	var clientId : Int!
	var clientUuid : String!
	var contactPhone : String!
	var dateCreated : String!
	var dateModified : String!
	var emailAddress : String!
	var firstName : String!
	var ipAddress : String!
	var lastLogin : String!
	var lastName : String!
	var merchantId : Int!
	var mobileVerificationCode : Int!
	var path : String!
	var phonePrefix : String!
	var resetPasswordRequest : Int!
	var socialId : String!
	var socialStrategy : String!
	var socialToken : AnyObject!
	var status : String!
	var token : String!
	var verifyCodeRequested : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accountVerified = dictionary["account_verified"] as? Int
		avatar = dictionary["avatar"] as? String
		clientId = dictionary["client_id"] as? Int
		clientUuid = dictionary["client_uuid"] as? String
		contactPhone = dictionary["contact_phone"] as? String
		dateCreated = dictionary["date_created"] as? String
		dateModified = dictionary["date_modified"] as? String
		emailAddress = dictionary["email_address"] as? String
		firstName = dictionary["first_name"] as? String
		ipAddress = dictionary["ip_address"] as? String
		lastLogin = dictionary["last_login"] as? String
		lastName = dictionary["last_name"] as? String
		merchantId = dictionary["merchant_id"] as? Int
		mobileVerificationCode = dictionary["mobile_verification_code"] as? Int
		path = dictionary["path"] as? String
		phonePrefix = dictionary["phone_prefix"] as? String
		resetPasswordRequest = dictionary["reset_password_request"] as? Int
		socialId = dictionary["social_id"] as? String
		socialStrategy = dictionary["social_strategy"] as? String
		socialToken = dictionary["social_token"] as? AnyObject
		status = dictionary["status"] as? String
		token = dictionary["token"] as? String
		verifyCodeRequested = dictionary["verify_code_requested"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accountVerified != nil{
			dictionary["account_verified"] = accountVerified
		}
		if avatar != nil{
			dictionary["avatar"] = avatar
		}
		if clientId != nil{
			dictionary["client_id"] = clientId
		}
		if clientUuid != nil{
			dictionary["client_uuid"] = clientUuid
		}
		if contactPhone != nil{
			dictionary["contact_phone"] = contactPhone
		}
		if dateCreated != nil{
			dictionary["date_created"] = dateCreated
		}
		if dateModified != nil{
			dictionary["date_modified"] = dateModified
		}
		if emailAddress != nil{
			dictionary["email_address"] = emailAddress
		}
		if firstName != nil{
			dictionary["first_name"] = firstName
		}
		if ipAddress != nil{
			dictionary["ip_address"] = ipAddress
		}
		if lastLogin != nil{
			dictionary["last_login"] = lastLogin
		}
		if lastName != nil{
			dictionary["last_name"] = lastName
		}
		if merchantId != nil{
			dictionary["merchant_id"] = merchantId
		}
		if mobileVerificationCode != nil{
			dictionary["mobile_verification_code"] = mobileVerificationCode
		}
		if path != nil{
			dictionary["path"] = path
		}
		if phonePrefix != nil{
			dictionary["phone_prefix"] = phonePrefix
		}
		if resetPasswordRequest != nil{
			dictionary["reset_password_request"] = resetPasswordRequest
		}
		if socialId != nil{
			dictionary["social_id"] = socialId
		}
		if socialStrategy != nil{
			dictionary["social_strategy"] = socialStrategy
		}
		if socialToken != nil{
			dictionary["social_token"] = socialToken
		}
		if status != nil{
			dictionary["status"] = status
		}
		if token != nil{
			dictionary["token"] = token
		}
		if verifyCodeRequested != nil{
			dictionary["verify_code_requested"] = verifyCodeRequested
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accountVerified = aDecoder.decodeObject(forKey: "account_verified") as? Int
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         clientId = aDecoder.decodeObject(forKey: "client_id") as? Int
         clientUuid = aDecoder.decodeObject(forKey: "client_uuid") as? String
         contactPhone = aDecoder.decodeObject(forKey: "contact_phone") as? String
         dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
         dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
         emailAddress = aDecoder.decodeObject(forKey: "email_address") as? String
         firstName = aDecoder.decodeObject(forKey: "first_name") as? String
         ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
         lastLogin = aDecoder.decodeObject(forKey: "last_login") as? String
         lastName = aDecoder.decodeObject(forKey: "last_name") as? String
         merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
         mobileVerificationCode = aDecoder.decodeObject(forKey: "mobile_verification_code") as? Int
         path = aDecoder.decodeObject(forKey: "path") as? String
         phonePrefix = aDecoder.decodeObject(forKey: "phone_prefix") as? String
         resetPasswordRequest = aDecoder.decodeObject(forKey: "reset_password_request") as? Int
         socialId = aDecoder.decodeObject(forKey: "social_id") as? String
         socialStrategy = aDecoder.decodeObject(forKey: "social_strategy") as? String
         socialToken = aDecoder.decodeObject(forKey: "social_token") as? AnyObject
         status = aDecoder.decodeObject(forKey: "status") as? String
         token = aDecoder.decodeObject(forKey: "token") as? String
         verifyCodeRequested = aDecoder.decodeObject(forKey: "verify_code_requested") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accountVerified != nil{
			aCoder.encode(accountVerified, forKey: "account_verified")
		}
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if clientId != nil{
			aCoder.encode(clientId, forKey: "client_id")
		}
		if clientUuid != nil{
			aCoder.encode(clientUuid, forKey: "client_uuid")
		}
		if contactPhone != nil{
			aCoder.encode(contactPhone, forKey: "contact_phone")
		}
		if dateCreated != nil{
			aCoder.encode(dateCreated, forKey: "date_created")
		}
		if dateModified != nil{
			aCoder.encode(dateModified, forKey: "date_modified")
		}
		if emailAddress != nil{
			aCoder.encode(emailAddress, forKey: "email_address")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "first_name")
		}
		if ipAddress != nil{
			aCoder.encode(ipAddress, forKey: "ip_address")
		}
		if lastLogin != nil{
			aCoder.encode(lastLogin, forKey: "last_login")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "last_name")
		}
		if merchantId != nil{
			aCoder.encode(merchantId, forKey: "merchant_id")
		}
		if mobileVerificationCode != nil{
			aCoder.encode(mobileVerificationCode, forKey: "mobile_verification_code")
		}
		if path != nil{
			aCoder.encode(path, forKey: "path")
		}
		if phonePrefix != nil{
			aCoder.encode(phonePrefix, forKey: "phone_prefix")
		}
		if resetPasswordRequest != nil{
			aCoder.encode(resetPasswordRequest, forKey: "reset_password_request")
		}
		if socialId != nil{
			aCoder.encode(socialId, forKey: "social_id")
		}
		if socialStrategy != nil{
			aCoder.encode(socialStrategy, forKey: "social_strategy")
		}
		if socialToken != nil{
			aCoder.encode(socialToken, forKey: "social_token")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if token != nil{
			aCoder.encode(token, forKey: "token")
		}
		if verifyCodeRequested != nil{
			aCoder.encode(verifyCodeRequested, forKey: "verify_code_requested")
		}

	}

}