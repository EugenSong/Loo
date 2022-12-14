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
    
    let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let streetLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let commentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let directionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let upvoteLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let downvoteLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
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
        
        nameLabel.textAlignment = .center
        nameLabel.text = name!
        self.view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: view.topAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createStreetComponent() {
        
        streetLabel.textAlignment = .center
        streetLabel.text = street!
        self.view.addSubview(streetLabel)
        
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            streetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            streetLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            streetLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            streetLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createCommentComponent() {
        commentLabel.center = CGPoint(x: 100, y: 300)
        commentLabel.textAlignment = .center
        commentLabel.text = comment!
        self.view.addSubview(commentLabel)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: view.topAnchor),
            commentLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createDirectionComponent() {
        directionLabel.center = CGPoint(x: 100, y: 350)
        directionLabel.textAlignment = .center
        directionLabel.text = directions!
        self.view.addSubview(directionLabel)
        
        directionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            directionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            directionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: view.topAnchor),
            directionLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createUpvoteComponent() {
        upvoteLabel.center = CGPoint(x: 100, y: 400)
        upvoteLabel.textAlignment = .center
        upvoteLabel.text = String(upvote!)
        self.view.addSubview(upvoteLabel)
        
        upvoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upvoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upvoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: view.topAnchor),
            upvoteLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createDownvoteComponent() {
        downvoteLabel.center = CGPoint(x: 100, y: 450)
        downvoteLabel.textAlignment = .center
        downvoteLabel.text = String(downvote!)
        self.view.addSubview(downvoteLabel)
        
        downvoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            downvoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downvoteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: view.topAnchor),
            downvoteLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
}
