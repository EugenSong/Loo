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
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        RestroomAPI.getRestroomAPI(lat: 34.052339, lon: -118.239505)

    }
    
    // ~3 - Helpers
    

}
