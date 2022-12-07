//
//  RestroomAPI.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import Foundation

struct RestroomAPI {
    
    // how to grab API
    static func getRestroomAPI(lat: Float, lon: Float, completion: @escaping ([Restroom]?) -> Void) {
        
        // declare URL
        guard let url = URL(string: "https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=5&offset=0&lat=\(lat)&lng=\(lon)") else {
            return
        }
        
        var restrooms: [Restroom] = []
        
        // create task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // create instance of JSONDecoder
            let decoder = JSONDecoder()
            
            // check for nil data then decode
            if let data = data {
                do {
                    let tasks = try decoder.decode([Restroom].self, from: data)
                    tasks.forEach { restroom in
                        // print(restroom.name!)
                        // print(restroom)
                        restrooms.append(restroom)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            return completion(restrooms)
        }
        task.resume()
    }
}

/*
 *** IMPORTANT CONCEPT ON USING COMPLETION HANDLERS TO FULFILL API DATA FETCHING ***
 
 Q: Why do I need to create an RestroomAPI file? And then create another func to call it again in Controller?
 A: To call the API endpoint and then store data in an array within this file
 A: Then later, in my Controller, create another func and call the completion handler within it to set the array from this file into another array there... ultimate goal: to pass data from API endpoint --> this file medium --> controller  */
