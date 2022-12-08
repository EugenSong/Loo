//
//  RestroomDetailsController.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import UIKit

class RestroomDetailsController: UIViewController {
    
    
    // ~1 - Properties
    var name: String?
    var street: String?
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        print(name!)
        print(street!)
    }
    
    // ~3 - Helpers
    
    

}
