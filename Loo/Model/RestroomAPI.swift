//
//  RestroomAPI.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import Foundation

struct RestroomAPI {
    
    static func getRestroomAPI () {
        
        guard let url = URL(string: "https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=5&offset=0&lat=34.052339&lng=-118.239505") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                    print(string)
                }
            }
        
        task.resume()
    }
}
