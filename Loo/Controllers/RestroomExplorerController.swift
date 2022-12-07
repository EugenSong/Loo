//
//  RestroomExplorerController.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import UIKit

class RestroomExplorerController: UIViewController {
    
    // ~1 - Properties
    let api = RestroomAPI()
    
    var restroomsArray: [Restroom] = []
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint

        getRestroomsAPIData()
    }
    
    // ~3 - Helpers
    
    func getRestroomsAPIData() {
        RestroomAPI.getRestroomAPI(lat: 34.052339, lon: -118.239505) { (restrooms) in guard let restrooms = restrooms else { return }
            self.restroomsArray = restrooms
            print("getRestroomsAPIData() called")
            print(self.restroomsArray)
            
        }
    }
}
