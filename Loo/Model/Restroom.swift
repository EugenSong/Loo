//
//  Restroom.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import Foundation

// struct w/ Codable protocol to use JSONDecoder() in API.swift
struct Restroom: Codable {
    
    // init properties
    let name: String?
    let street: String?
    let city: String?
    let accessible: Bool?
    let directions: String?
    let comment: String?
    let latitude: Float?
    let longitude: Float?
    let downvote: Int?
    let upvote: Int?
    let approved: Bool?
    
    // Restroom Initializer
    init(dict: [String:Any]) {
        name = dict["name"] as? String
        street = dict["street"] as? String
        city = dict["city"] as? String
        accessible = dict["accessible"] as? Bool
        directions = dict["directions"] as? String
        comment = dict["comment"] as? String
        latitude = dict["latitude"] as? Float
        longitude = dict["longitude"] as? Float
        downvote = dict["downvote"] as? Int
        upvote = dict["upvote"] as? Int
        approved = dict["approved"] as? Bool
    }
    
}
