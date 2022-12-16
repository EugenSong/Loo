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
    
    let customBackgroundColor = UIColor("#c2ccd3").cgColor
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(cgColor: customBackgroundColor)

//        print("the location of restroom is at \(name!)")
//        print("comment is \(comment!)")
//        print("directions are \(directions!)")
//        print("number of upvotes is \(upvote!)")
//        print("number of downvotes is \(downvote!)")
        
        createAllDetailComponents()
        createMap()
        
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
        
        map.mapType = .standard
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        map.overrideUserInterfaceStyle = .dark
        map.layer.cornerRadius = 15
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(map)
        
        // use .safeAreaLayoutGuide to be able to work w/ Safe Area
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: guide.topAnchor),
            map.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -15),
            map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)])
        
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
            nameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createStreetComponent() {
        
        streetLabel.textAlignment = .center
        streetLabel.text = street!
        streetLabel.numberOfLines = 0
        self.view.addSubview(streetLabel)
        
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            streetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            streetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            streetLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func createDirectionComponent() {
        
        directionLabel.textAlignment = .center
        directionLabel.text = "Directions: \(directions!)"
        directionLabel.numberOfLines = 0
        self.view.addSubview(directionLabel)
        
        directionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            directionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            directionLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 5),
            directionLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func createCommentComponent() {
        
        commentLabel.textAlignment = .center
        commentLabel.text = "Comments: \(comment!)"
        commentLabel.numberOfLines = 0
        self.view.addSubview(commentLabel)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentLabel.topAnchor.constraint(equalTo: directionLabel.bottomAnchor, constant: 5),
            commentLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func createUpvoteComponent() {
        
        upvoteLabel.textAlignment = .center
        upvoteLabel.text = "Upvotes: \(String(upvote!))"
        self.view.addSubview(upvoteLabel)
        
        upvoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upvoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upvoteLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 5),
            upvoteLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func createDownvoteComponent() {
        
        downvoteLabel.textAlignment = .center
        downvoteLabel.text = "Downvotes: \(String(downvote!))"
        self.view.addSubview(downvoteLabel)
        
        downvoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            downvoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downvoteLabel.topAnchor.constraint(equalTo: upvoteLabel.bottomAnchor, constant: 5),
            downvoteLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
}
