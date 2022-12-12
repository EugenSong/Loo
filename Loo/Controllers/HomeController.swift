//
//  HomeController.swift
//  Loo
//
//  Created by Eugene Song on 12/2/22.
//

import UIKit

class HomeController: UIViewController {

    // ~1 - Properties
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()
        
        createAddressLabel()
        
        view.backgroundColor = .white
        
    }
    
    // ~3 - Helpers
    
    func createNavController(rootViewController: UIViewController) -> UINavigationController {
        
        // template to inbed NavController
        let nav = UINavigationController(rootViewController: rootViewController)
        correctNavTransparency()
        return nav
    }
    
    func correctNavTransparency() {
        // correct the transparency bug for Navigation bars
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        navigationBarAppearance.backgroundColor = .lightGray
    }
    
    // temp button to segue into restroom list
    func createButton() {
        
        // init button
        let button = UIButton(type: .system)
        
        // init button position, title, target
        button.frame = CGRect(x: 20, y: 100, width: 100, height: 50)
        button.setTitle("Search for bathroom", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // imbed button into view
        view.addSubview(button)
    }
    
    @objc func buttonAction() {
        // init an ExplorerController and push onto nav stack
        let vc = RestroomExplorerController()
        navigationController?.pushViewController(vc, animated: true)
        }
    
    func createAddressLabel() {
        let label = UILabel(frame: CGRect(x: 100, y: 150, width: 150, height: 100))
        label.textAlignment = .center
        label.text = "Enter An Address"
        self.view.addSubview(label)
        
    }

}


