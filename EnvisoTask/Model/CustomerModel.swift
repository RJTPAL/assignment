//
//  CustomerModel.swift
//  EnvisoTask
//
//  Created by Rajat Pal on 27/01/23.
//

import Foundation

// MARK: - AllDetails
struct AllDetails: Codable {
    let success, message: String
    let allDetails: [AllDetail]

    enum CodingKeys: String, CodingKey {
        case success, message
        case allDetails = "all_details"
    }
}

// MARK: - AllDetail
struct AllDetail: Codable {
    let customers: Customers
    
    let order: Order
    let products: [Product]
    let coupons: Coupons
}

// MARK: - Coupons
struct Coupons: Codable {
    let couponID: Int
    let couponCode: String

    enum CodingKeys: String, CodingKey {
        case couponID = "coupon_id"
        case couponCode = "coupon_code"
    }
}

// MARK: - Customers
struct Customers: Codable {
    let customerID: Int
    let name, email, mobile: String

    enum CodingKeys: String, CodingKey {
        case customerID = "customer_id"
        case name, email, mobile
    }
}

// MARK: - Order
struct Order: Codable {
    let oderID, oderAmount: Int

    enum CodingKeys: String, CodingKey {
        case oderID = "oder_id"
        case oderAmount = "oder_amount"
    }
}

// MARK: - Product
struct Product: Codable {
    let productID: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
    }
}
