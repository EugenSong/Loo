//
//  RestroomDetailsController.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import UIKit
import MapKit


class RestroomDetailsController: UIViewController, MKMapViewDelegate {
    
    // ~1 - Properties
    
    let map = MKMapView()
    
    var name: String?
    var street: String?
    var comment: String?
    var directions: String?
    
    var upvote: Int?
    var downvote: Int?
    
    var latitude: Float?
    var longitude: Float?
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        createMap()
        
        print("the location of restroom is at \(name!)")
        print("comment is \(comment!)")
        print("directions are \(directions!)")
        print("number of upvotes is \(upvote!)")
        print("number of downvotes is \(downvote!)")
        
        createAllDetailComponents()
    }
    
    // ~3 - Helpers - add constraints
    
    func createMap() {
        // Annotation of map pin to display lat and long + restaurant name and category
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: Double(latitude!), longitude: Double(longitude!))
        annotation1.title = name
        self.map.addAnnotation(annotation1)
        map.centerCoordinate = annotation1.coordinate
        self.map.showAnnotations(self.map.annotations, animated: true)
        
        map.delegate = self
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 490
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        
        map.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        map.mapType = .standard
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        
        self.view.addSubview(map)
    }
    
    func createAllDetailComponents() {
        createNameComponent()
        createStreetComponent()
        createDirectionComponent()
        createCommentComponent()
        createUpvoteComponent()
        createDownvoteComponent()
    }
    
    func createNameComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 80, y: 285)
        label.textAlignment = .center
        label.text = name!
        self.view.addSubview(label)
    }
    
    func createStreetComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 200)
        label.textAlignment = .center
        label.text = street!
        self.view.addSubview(label)
    }
    
    func createCommentComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 300)
        label.textAlignment = .center
        label.text = comment!
        self.view.addSubview(label)
    }
    
    func createDirectionComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 350)
        label.textAlignment = .center
        label.text = directions!
        self.view.addSubview(label)
    }
    
    func createUpvoteComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 400)
        label.textAlignment = .center
        label.text = String(upvote!)
        self.view.addSubview(label)
    }
    
    func createDownvoteComponent() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 100, y: 450)
        label.textAlignment = .center
        label.text = String(downvote!)
        self.view.addSubview(label)
    }
    
    
}
