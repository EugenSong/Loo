//
//  RestroomAPI.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import Foundation

struct RestroomAPI {
    
    let restrooms: [Restroom]? = []
    
    // how to grab API
    static func getRestroomAPI(lat: Float, lon: Float) {
        
        // declare URL
        guard let url = URL(string: "https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=5&offset=0&lat=\(lat)&lng=\(lon)") else {
            return
        }
        
        // create task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // create instance of JSONDecoder
            let decoder = JSONDecoder()
            
            // check for nil data then decode
            if let data = data {
                do {
                    let tasks = try decoder.decode([Restroom].self, from: data)
                    tasks.forEach { restroom in
                        print(restroom.name!)
                        print(restroom)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
