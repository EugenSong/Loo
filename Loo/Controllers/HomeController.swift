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
        
        view.backgroundColor = .white
        
    }
    
    // ~3 - Helpers
    func configureViewController() {
    }
    
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
    func createButton () {
        
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
        print("Button pressed")
        // init an ExplorerController and push onto nav stack
        let vc = RestroomExplorerController()
        navigationController?.pushViewController(vc, animated: true)
        
        }
    
    

}


