//
//  HomeController.swift
//  Loo
//
//  Created by Eugene Song on 12/2/22.
//

import UIKit
import MapKit
import CoreLocation
import UIColor_Hex_Swift


class HomeController: UIViewController {
    
    // ~1 - Properties
    let locationManger = CLLocationManager()
    
    let field = UITextField()
    let label = UILabel()
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(field)
        self.view.addSubview(label)
        
        createButton()
        
        createAddressTextField()
        createAddressLabel()
        
        let customBackgroundColor = UIColor("#c2ccd3").cgColor
        
        view.backgroundColor = UIColor(cgColor: customBackgroundColor)
        
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
        
        label.textAlignment = .center
        label.text = "Enter An Address"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // use NSLayoutConstraint.activate([]) and Anchors to set constraints, programmatically
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: field.topAnchor),
            label.widthAnchor.constraint(equalTo: field.widthAnchor)
            
        ])
        
    }
    
    func createAddressTextField() {
        
        field.placeholder = "Insert Address..."
        field.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            field.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            field.heightAnchor.constraint(equalToConstant: 50),
            field.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
}


