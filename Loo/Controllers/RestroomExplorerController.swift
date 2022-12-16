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
    let tableView = UITableView()
    
    let customBackgroundColor = UIColor("#c2ccd3").cgColor
    let cellBackgroundColor = UIColor("#d1d7df").cgColor
    
    var lati: Double?
    var longi: Double?
    
    // note for future: excluding tableViews and including them within 'override func loadView()' is said to be more proper and leaving API fetches in viewDidLoad()
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Restrooms"
        
        getRestroomsAPIData()
        setupTableView()
        
        tableView.backgroundColor = UIColor(cgColor: customBackgroundColor)
        
    }
    
    // ~3 - Helpers
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    
    }
    
    // create helper-API-fetch to transfer and store data from RestroomAPI file to Controller
    func getRestroomsAPIData() {
        RestroomAPI.getRestroomAPI(lat: lati!, lon: longi!) { (restrooms) in
            guard let restrooms = restrooms else { return }
            
            self.restroomsArray = restrooms
            
//            print("getRestroomsAPIData() called")
//            print(self.restroomsArray)
            
            // The issue might be generated because you're trying to update the table in a background thread. All UI Updates must be done in main thread !!
            // DispatchQueue.main.async waits for first action to be completed before running inside block
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

// extension of Current VC to implement tableView datasource / delegate methods
extension RestroomExplorerController: UITableViewDelegate, UITableViewDataSource {
    
    // data source method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restroomsArray.count
    }
    
    // delegate method
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(String(describing: restroomsArray[indexPath.row].name!))"
        cell.backgroundColor = UIColor(cgColor: cellBackgroundColor)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
        // init destin VC and push to execute a segue, programmatically
        let myRestroomDetailsController = RestroomDetailsController()
        navigationController?.pushViewController(myRestroomDetailsController, animated: true)
        
        // to pass data, use normal segue syntax with existing var at destination vc
        myRestroomDetailsController.name = restroomsArray[indexPath.row].name
        myRestroomDetailsController.street = restroomsArray[indexPath.row].street
        myRestroomDetailsController.comment = restroomsArray[indexPath.row].comment
        myRestroomDetailsController.directions = restroomsArray[indexPath.row].directions
        myRestroomDetailsController.upvote = restroomsArray[indexPath.row].upvote
        myRestroomDetailsController.downvote = restroomsArray[indexPath.row].downvote
        myRestroomDetailsController.latitude = restroomsArray[indexPath.row].latitude
        myRestroomDetailsController.longitude = restroomsArray[indexPath.row].longitude
    }
    
    // Create a standard header that includes the returned text.
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Closest"
    }

    // Create a standard footer that includes the returned text.
    func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return "Farthest"
    }
    
    // clip the tableView x-y coordinate to the size of current root view controller
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
