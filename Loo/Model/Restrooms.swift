//
//  Restrooms.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import Foundation

struct Restroom: Codable {
    
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
    
}
