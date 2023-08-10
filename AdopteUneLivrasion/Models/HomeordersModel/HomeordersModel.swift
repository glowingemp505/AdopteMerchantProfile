//
//  HomeordersModel.swift
//  AdopteUneLivrasion
//
//  Created by Sameer Amjad on 24/07/2023.
//

import Foundation

class HomeordersModel : NSObject, NSCoding{

    var adjustmentCommission : String!
        var adjustmentTotal : String!
        var baseCurrencyCode : String!
        var client : Client!
        var clientId : Int!
        var commission : String!
        var commissionBased : String!
        var commissionOriginal : String!
        var commissionType : String!
        var commissionValue : String!
        var courierTip : String!
        var dateCancelled : AnyObject!
        var dateCreated : String!
        var dateForHumans : String!
        var dateModified : String!
        var deliveredAt : AnyObject!
        var deliveryDate : String!
        var deliveryFee : String!
        var deliveryStatus : String!
        var deliveryTime : String!
        var deliveryTimeEnd : String!
        var driverId : Int!
        var earningApprove : Int!
        var exchangeRate : String!
        var formattedAddress : String!
        var ipAddress : String!
        var isCritical : Int!
        var isView : Int!
        var items : [AnyObject]!
        var merchantEarning : String!
        var merchantEarningOriginal : String!
        var merchantId : Int!
        var offerDiscount : String!
        var offerTotal : String!
        var orderId : Int!
        var orderUuid : String!
        var packagingFee : String!
        var paymentCode : String!
        var paymentStatus : String!
        var points : String!
        var promoCode : String!
        var promoTotal : String!
        var requestFrom : String!
        var serviceCode : String!
        var serviceFee : String!
        var status : String!
        var subTotal : String!
        var subTotalLessDiscount : String!
        var tax : String!
        var taxTotal : String!
        var taxType : String!
        var total : String!
        var totalDiscount : String!
        var totalOriginal : String!
        var useCurrencyCode : String!
        var vehicleId : Int!
        var whentoDeliver : String!


        /**
         * Instantiate the instance using the passed dictionary values to set the properties values
         */
        init(fromDictionary dictionary: [String:Any]){
            adjustmentCommission = dictionary["adjustment_commission"] as? String
            adjustmentTotal = dictionary["adjustment_total"] as? String
            baseCurrencyCode = dictionary["base_currency_code"] as? String
            if let clientData = dictionary["client"] as? [String:Any]{
                client = Client(fromDictionary: clientData)
            }
            clientId = dictionary["client_id"] as? Int
            commission = dictionary["commission"] as? String
            commissionBased = dictionary["commission_based"] as? String
            commissionOriginal = dictionary["commission_original"] as? String
            commissionType = dictionary["commission_type"] as? String
            commissionValue = dictionary["commission_value"] as? String
            courierTip = dictionary["courier_tip"] as? String
            dateCancelled = dictionary["date_cancelled"] as? AnyObject
            dateCreated = dictionary["date_created"] as? String
            dateForHumans = dictionary["date_for_humans"] as? String
            dateModified = dictionary["date_modified"] as? String
            deliveredAt = dictionary["delivered_at"] as? AnyObject
            deliveryDate = dictionary["delivery_date"] as? String
            deliveryFee = dictionary["delivery_fee"] as? String
            deliveryStatus = dictionary["delivery_status"] as? String
            deliveryTime = dictionary["delivery_time"] as? String
            deliveryTimeEnd = dictionary["delivery_time_end"] as? String
            driverId = dictionary["driver_id"] as? Int
            earningApprove = dictionary["earning_approve"] as? Int
            exchangeRate = dictionary["exchange_rate"] as? String
            formattedAddress = dictionary["formatted_address"] as? String
            ipAddress = dictionary["ip_address"] as? String
            isCritical = dictionary["is_critical"] as? Int
            isView = dictionary["is_view"] as? Int
            items = dictionary["items"] as? [AnyObject]
            merchantEarning = dictionary["merchant_earning"] as? String
            merchantEarningOriginal = dictionary["merchant_earning_original"] as? String
            merchantId = dictionary["merchant_id"] as? Int
            offerDiscount = dictionary["offer_discount"] as? String
            offerTotal = dictionary["offer_total"] as? String
            orderId = dictionary["order_id"] as? Int
            orderUuid = dictionary["order_uuid"] as? String
            packagingFee = dictionary["packaging_fee"] as? String
            paymentCode = dictionary["payment_code"] as? String
            paymentStatus = dictionary["payment_status"] as? String
            points = dictionary["points"] as? String
            promoCode = dictionary["promo_code"] as? String
            promoTotal = dictionary["promo_total"] as? String
            requestFrom = dictionary["request_from"] as? String
            serviceCode = dictionary["service_code"] as? String
            serviceFee = dictionary["service_fee"] as? String
            status = dictionary["status"] as? String
            subTotal = dictionary["sub_total"] as? String
            subTotalLessDiscount = dictionary["sub_total_less_discount"] as? String
            tax = dictionary["tax"] as? String
            taxTotal = dictionary["tax_total"] as? String
            taxType = dictionary["tax_type"] as? String
            total = dictionary["total"] as? String
            totalDiscount = dictionary["total_discount"] as? String
            totalOriginal = dictionary["total_original"] as? String
            useCurrencyCode = dictionary["use_currency_code"] as? String
            vehicleId = dictionary["vehicle_id"] as? Int
            whentoDeliver = dictionary["whento_deliver"] as? String
        }

        /**
         * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
         */
        func toDictionary() -> [String:Any]
        {
            var dictionary = [String:Any]()
            if adjustmentCommission != nil{
                dictionary["adjustment_commission"] = adjustmentCommission
            }
            if adjustmentTotal != nil{
                dictionary["adjustment_total"] = adjustmentTotal
            }
            if baseCurrencyCode != nil{
                dictionary["base_currency_code"] = baseCurrencyCode
            }
            if client != nil{
                dictionary["client"] = client.toDictionary()
            }
            if clientId != nil{
                dictionary["client_id"] = clientId
            }
            if commission != nil{
                dictionary["commission"] = commission
            }
            if commissionBased != nil{
                dictionary["commission_based"] = commissionBased
            }
            if commissionOriginal != nil{
                dictionary["commission_original"] = commissionOriginal
            }
            if commissionType != nil{
                dictionary["commission_type"] = commissionType
            }
            if commissionValue != nil{
                dictionary["commission_value"] = commissionValue
            }
            if courierTip != nil{
                dictionary["courier_tip"] = courierTip
            }
            if dateCancelled != nil{
                dictionary["date_cancelled"] = dateCancelled
            }
            if dateCreated != nil{
                dictionary["date_created"] = dateCreated
            }
            if dateForHumans != nil{
                dictionary["date_for_humans"] = dateForHumans
            }
            if dateModified != nil{
                dictionary["date_modified"] = dateModified
            }
            if deliveredAt != nil{
                dictionary["delivered_at"] = deliveredAt
            }
            if deliveryDate != nil{
                dictionary["delivery_date"] = deliveryDate
            }
            if deliveryFee != nil{
                dictionary["delivery_fee"] = deliveryFee
            }
            if deliveryStatus != nil{
                dictionary["delivery_status"] = deliveryStatus
            }
            if deliveryTime != nil{
                dictionary["delivery_time"] = deliveryTime
            }
            if deliveryTimeEnd != nil{
                dictionary["delivery_time_end"] = deliveryTimeEnd
            }
            if driverId != nil{
                dictionary["driver_id"] = driverId
            }
            if earningApprove != nil{
                dictionary["earning_approve"] = earningApprove
            }
            if exchangeRate != nil{
                dictionary["exchange_rate"] = exchangeRate
            }
            if formattedAddress != nil{
                dictionary["formatted_address"] = formattedAddress
            }
            if ipAddress != nil{
                dictionary["ip_address"] = ipAddress
            }
            if isCritical != nil{
                dictionary["is_critical"] = isCritical
            }
            if isView != nil{
                dictionary["is_view"] = isView
            }
            if items != nil{
                dictionary["items"] = items
            }
            if merchantEarning != nil{
                dictionary["merchant_earning"] = merchantEarning
            }
            if merchantEarningOriginal != nil{
                dictionary["merchant_earning_original"] = merchantEarningOriginal
            }
            if merchantId != nil{
                dictionary["merchant_id"] = merchantId
            }
            if offerDiscount != nil{
                dictionary["offer_discount"] = offerDiscount
            }
            if offerTotal != nil{
                dictionary["offer_total"] = offerTotal
            }
            if orderId != nil{
                dictionary["order_id"] = orderId
            }
            if orderUuid != nil{
                dictionary["order_uuid"] = orderUuid
            }
            if packagingFee != nil{
                dictionary["packaging_fee"] = packagingFee
            }
            if paymentCode != nil{
                dictionary["payment_code"] = paymentCode
            }
            if paymentStatus != nil{
                dictionary["payment_status"] = paymentStatus
            }
            if points != nil{
                dictionary["points"] = points
            }
            if promoCode != nil{
                dictionary["promo_code"] = promoCode
            }
            if promoTotal != nil{
                dictionary["promo_total"] = promoTotal
            }
            if requestFrom != nil{
                dictionary["request_from"] = requestFrom
            }
            if serviceCode != nil{
                dictionary["service_code"] = serviceCode
            }
            if serviceFee != nil{
                dictionary["service_fee"] = serviceFee
            }
            if status != nil{
                dictionary["status"] = status
            }
            if subTotal != nil{
                dictionary["sub_total"] = subTotal
            }
            if subTotalLessDiscount != nil{
                dictionary["sub_total_less_discount"] = subTotalLessDiscount
            }
            if tax != nil{
                dictionary["tax"] = tax
            }
            if taxTotal != nil{
                dictionary["tax_total"] = taxTotal
            }
            if taxType != nil{
                dictionary["tax_type"] = taxType
            }
            if total != nil{
                dictionary["total"] = total
            }
            if totalDiscount != nil{
                dictionary["total_discount"] = totalDiscount
            }
            if totalOriginal != nil{
                dictionary["total_original"] = totalOriginal
            }
            if useCurrencyCode != nil{
                dictionary["use_currency_code"] = useCurrencyCode
            }
            if vehicleId != nil{
                dictionary["vehicle_id"] = vehicleId
            }
            if whentoDeliver != nil{
                dictionary["whento_deliver"] = whentoDeliver
            }
            return dictionary
        }

        /**
        * NSCoding required initializer.
        * Fills the data from the passed decoder
        */
        @objc required init(coder aDecoder: NSCoder)
        {
             adjustmentCommission = aDecoder.decodeObject(forKey: "adjustment_commission") as? String
             adjustmentTotal = aDecoder.decodeObject(forKey: "adjustment_total") as? String
             baseCurrencyCode = aDecoder.decodeObject(forKey: "base_currency_code") as? String
             client = aDecoder.decodeObject(forKey: "client") as? Client
             clientId = aDecoder.decodeObject(forKey: "client_id") as? Int
             commission = aDecoder.decodeObject(forKey: "commission") as? String
             commissionBased = aDecoder.decodeObject(forKey: "commission_based") as? String
             commissionOriginal = aDecoder.decodeObject(forKey: "commission_original") as? String
             commissionType = aDecoder.decodeObject(forKey: "commission_type") as? String
             commissionValue = aDecoder.decodeObject(forKey: "commission_value") as? String
             courierTip = aDecoder.decodeObject(forKey: "courier_tip") as? String
             dateCancelled = aDecoder.decodeObject(forKey: "date_cancelled") as? AnyObject
             dateCreated = aDecoder.decodeObject(forKey: "date_created") as? String
             dateForHumans = aDecoder.decodeObject(forKey: "date_for_humans") as? String
             dateModified = aDecoder.decodeObject(forKey: "date_modified") as? String
             deliveredAt = aDecoder.decodeObject(forKey: "delivered_at") as? AnyObject
             deliveryDate = aDecoder.decodeObject(forKey: "delivery_date") as? String
             deliveryFee = aDecoder.decodeObject(forKey: "delivery_fee") as? String
             deliveryStatus = aDecoder.decodeObject(forKey: "delivery_status") as? String
             deliveryTime = aDecoder.decodeObject(forKey: "delivery_time") as? String
             deliveryTimeEnd = aDecoder.decodeObject(forKey: "delivery_time_end") as? String
             driverId = aDecoder.decodeObject(forKey: "driver_id") as? Int
             earningApprove = aDecoder.decodeObject(forKey: "earning_approve") as? Int
             exchangeRate = aDecoder.decodeObject(forKey: "exchange_rate") as? String
             formattedAddress = aDecoder.decodeObject(forKey: "formatted_address") as? String
             ipAddress = aDecoder.decodeObject(forKey: "ip_address") as? String
             isCritical = aDecoder.decodeObject(forKey: "is_critical") as? Int
             isView = aDecoder.decodeObject(forKey: "is_view") as? Int
             items = aDecoder.decodeObject(forKey: "items") as? [AnyObject]
             merchantEarning = aDecoder.decodeObject(forKey: "merchant_earning") as? String
             merchantEarningOriginal = aDecoder.decodeObject(forKey: "merchant_earning_original") as? String
             merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? Int
             offerDiscount = aDecoder.decodeObject(forKey: "offer_discount") as? String
             offerTotal = aDecoder.decodeObject(forKey: "offer_total") as? String
             orderId = aDecoder.decodeObject(forKey: "order_id") as? Int
             orderUuid = aDecoder.decodeObject(forKey: "order_uuid") as? String
             packagingFee = aDecoder.decodeObject(forKey: "packaging_fee") as? String
             paymentCode = aDecoder.decodeObject(forKey: "payment_code") as? String
             paymentStatus = aDecoder.decodeObject(forKey: "payment_status") as? String
             points = aDecoder.decodeObject(forKey: "points") as? String
             promoCode = aDecoder.decodeObject(forKey: "promo_code") as? String
             promoTotal = aDecoder.decodeObject(forKey: "promo_total") as? String
             requestFrom = aDecoder.decodeObject(forKey: "request_from") as? String
             serviceCode = aDecoder.decodeObject(forKey: "service_code") as? String
             serviceFee = aDecoder.decodeObject(forKey: "service_fee") as? String
             status = aDecoder.decodeObject(forKey: "status") as? String
             subTotal = aDecoder.decodeObject(forKey: "sub_total") as? String
             subTotalLessDiscount = aDecoder.decodeObject(forKey: "sub_total_less_discount") as? String
             tax = aDecoder.decodeObject(forKey: "tax") as? String
             taxTotal = aDecoder.decodeObject(forKey: "tax_total") as? String
             taxType = aDecoder.decodeObject(forKey: "tax_type") as? String
             total = aDecoder.decodeObject(forKey: "total") as? String
             totalDiscount = aDecoder.decodeObject(forKey: "total_discount") as? String
             totalOriginal = aDecoder.decodeObject(forKey: "total_original") as? String
             useCurrencyCode = aDecoder.decodeObject(forKey: "use_currency_code") as? String
             vehicleId = aDecoder.decodeObject(forKey: "vehicle_id") as? Int
             whentoDeliver = aDecoder.decodeObject(forKey: "whento_deliver") as? String

        }

        /**
        * NSCoding required method.
        * Encodes mode properties into the decoder
        */
        @objc func encode(with aCoder: NSCoder)
        {
            if adjustmentCommission != nil{
                aCoder.encode(adjustmentCommission, forKey: "adjustment_commission")
            }
            if adjustmentTotal != nil{
                aCoder.encode(adjustmentTotal, forKey: "adjustment_total")
            }
            if baseCurrencyCode != nil{
                aCoder.encode(baseCurrencyCode, forKey: "base_currency_code")
            }
            if client != nil{
                aCoder.encode(client, forKey: "client")
            }
            if clientId != nil{
                aCoder.encode(clientId, forKey: "client_id")
            }
            if commission != nil{
                aCoder.encode(commission, forKey: "commission")
            }
            if commissionBased != nil{
                aCoder.encode(commissionBased, forKey: "commission_based")
            }
            if commissionOriginal != nil{
                aCoder.encode(commissionOriginal, forKey: "commission_original")
            }
            if commissionType != nil{
                aCoder.encode(commissionType, forKey: "commission_type")
            }
            if commissionValue != nil{
                aCoder.encode(commissionValue, forKey: "commission_value")
            }
            if courierTip != nil{
                aCoder.encode(courierTip, forKey: "courier_tip")
            }
            if dateCancelled != nil{
                aCoder.encode(dateCancelled, forKey: "date_cancelled")
            }
            if dateCreated != nil{
                aCoder.encode(dateCreated, forKey: "date_created")
            }
            if dateForHumans != nil{
                aCoder.encode(dateForHumans, forKey: "date_for_humans")
            }
            if dateModified != nil{
                aCoder.encode(dateModified, forKey: "date_modified")
            }
            if deliveredAt != nil{
                aCoder.encode(deliveredAt, forKey: "delivered_at")
            }
            if deliveryDate != nil{
                aCoder.encode(deliveryDate, forKey: "delivery_date")
            }
            if deliveryFee != nil{
                aCoder.encode(deliveryFee, forKey: "delivery_fee")
            }
            if deliveryStatus != nil{
                aCoder.encode(deliveryStatus, forKey: "delivery_status")
            }
            if deliveryTime != nil{
                aCoder.encode(deliveryTime, forKey: "delivery_time")
            }
            if deliveryTimeEnd != nil{
                aCoder.encode(deliveryTimeEnd, forKey: "delivery_time_end")
            }
            if driverId != nil{
                aCoder.encode(driverId, forKey: "driver_id")
            }
            if earningApprove != nil{
                aCoder.encode(earningApprove, forKey: "earning_approve")
            }
            if exchangeRate != nil{
                aCoder.encode(exchangeRate, forKey: "exchange_rate")
            }
            if formattedAddress != nil{
                aCoder.encode(formattedAddress, forKey: "formatted_address")
            }
            if ipAddress != nil{
                aCoder.encode(ipAddress, forKey: "ip_address")
            }
            if isCritical != nil{
                aCoder.encode(isCritical, forKey: "is_critical")
            }
            if isView != nil{
                aCoder.encode(isView, forKey: "is_view")
            }
            if items != nil{
                aCoder.encode(items, forKey: "items")
            }
            if merchantEarning != nil{
                aCoder.encode(merchantEarning, forKey: "merchant_earning")
            }
            if merchantEarningOriginal != nil{
                aCoder.encode(merchantEarningOriginal, forKey: "merchant_earning_original")
            }
            if merchantId != nil{
                aCoder.encode(merchantId, forKey: "merchant_id")
            }
            if offerDiscount != nil{
                aCoder.encode(offerDiscount, forKey: "offer_discount")
            }
            if offerTotal != nil{
                aCoder.encode(offerTotal, forKey: "offer_total")
            }
            if orderId != nil{
                aCoder.encode(orderId, forKey: "order_id")
            }
            if orderUuid != nil{
                aCoder.encode(orderUuid, forKey: "order_uuid")
            }
            if packagingFee != nil{
                aCoder.encode(packagingFee, forKey: "packaging_fee")
            }
            if paymentCode != nil{
                aCoder.encode(paymentCode, forKey: "payment_code")
            }
            if paymentStatus != nil{
                aCoder.encode(paymentStatus, forKey: "payment_status")
            }
            if points != nil{
                aCoder.encode(points, forKey: "points")
            }
            if promoCode != nil{
                aCoder.encode(promoCode, forKey: "promo_code")
            }
            if promoTotal != nil{
                aCoder.encode(promoTotal, forKey: "promo_total")
            }
            if requestFrom != nil{
                aCoder.encode(requestFrom, forKey: "request_from")
            }
            if serviceCode != nil{
                aCoder.encode(serviceCode, forKey: "service_code")
            }
            if serviceFee != nil{
                aCoder.encode(serviceFee, forKey: "service_fee")
            }
            if status != nil{
                aCoder.encode(status, forKey: "status")
            }
            if subTotal != nil{
                aCoder.encode(subTotal, forKey: "sub_total")
            }
            if subTotalLessDiscount != nil{
                aCoder.encode(subTotalLessDiscount, forKey: "sub_total_less_discount")
            }
            if tax != nil{
                aCoder.encode(tax, forKey: "tax")
            }
            if taxTotal != nil{
                aCoder.encode(taxTotal, forKey: "tax_total")
            }
            if taxType != nil{
                aCoder.encode(taxType, forKey: "tax_type")
            }
            if total != nil{
                aCoder.encode(total, forKey: "total")
            }
            if totalDiscount != nil{
                aCoder.encode(totalDiscount, forKey: "total_discount")
            }
            if totalOriginal != nil{
                aCoder.encode(totalOriginal, forKey: "total_original")
            }
            if useCurrencyCode != nil{
                aCoder.encode(useCurrencyCode, forKey: "use_currency_code")
            }
            if vehicleId != nil{
                aCoder.encode(vehicleId, forKey: "vehicle_id")
            }
            if whentoDeliver != nil{
                aCoder.encode(whentoDeliver, forKey: "whento_deliver")
            }

        }

    }
