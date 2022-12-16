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


class HomeController: UIViewController, CLLocationManagerDelegate {
    
    // ~1 - Properties
    let locationManager = CLLocationManager()
    let field = UITextField()
    let label = UILabel()
    let button = UIButton(type: .custom)
    let customBackgroundColor = UIColor("#c2ccd3").cgColor
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.global().async {
            if (CLLocationManager.locationServicesEnabled() ) {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
            }
        }
        
        self.view.addSubview(button)
        createButton()
        
//        self.view.addSubview(label)
//        self.view.addSubview(field)
//        createAddressLabel()
//        createAddressTextField()
        
        view.backgroundColor = UIColor(cgColor: customBackgroundColor)
    }
    
    // ~3 - Helpers
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitude = locValue.latitude
        longitude = locValue.longitude
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
    func createButton() {
        
        let customButtonColor = UIColor("#869095").cgColor
        
        // init button title, target
        button.setTitle("Search Restrooms Near Me", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: customButtonColor)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        
        // button constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 270),
            button.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc func buttonAction() {
        // init an ExplorerController and push onto nav stack
        let vc = RestroomExplorerController()

        navigationController?.pushViewController(vc, animated: true)
        
        // pass user current coordinates to explorerVC
        vc.lati = latitude
        vc.longi = longitude
    }
    
    // *** SAVE FOR FUTURE: CUSTOM ADDRESS LABEL ***
    func createAddressLabel() {
        
        let addressLabelColor = UIColor("#869095").cgColor
        
        label.textAlignment = .center
        label.text = "Search Restrooms Near Me"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(cgColor: addressLabelColor)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        // use NSLayoutConstraint.activate([]) and Anchors to set constraints, programmatically
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: field.topAnchor, constant: -10),
            label.widthAnchor.constraint(equalTo: field.widthAnchor)
            
        ])
        
    }
    
    // *** SAVE FOR FUTURE: CUSTOM ADDRESS FIELD ***
    func createAddressTextField() {

        field.placeholder = "Type Address..."
        field.backgroundColor = .white
        field.setLeftPaddingPoints(10)

        field.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            field.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            field.heightAnchor.constraint(equalToConstant: 50),
            field.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}

// *** SAVE FOR FUTURE USE: Extension for UITextField padding ***
// UITextField extension to utilize a padding in textfield
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


