//
//  RestroomExplorerController.swift
//  Loo
//
//  Created by Eugene Song on 12/5/22.
//

import UIKit

class RestroomExplorerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ~1 - Properties
    let api = RestroomAPI()
    var restroomsArray: [Restroom] = []
    
    let tableView = UITableView()
    
    // ~2 - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getRestroomsAPIData()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // ~3 - Helpers
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restroomsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(String(describing: restroomsArray[indexPath.row].name!))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
    
    // create helper-API-fetch to transfer and store data from RestroomAPI file to Controller
    func getRestroomsAPIData() {
        RestroomAPI.getRestroomAPI(lat: 34.052339, lon: -118.239505) { (restrooms) in
            guard let restrooms = restrooms else { return }
            
            self.restroomsArray = restrooms
            print("getRestroomsAPIData() called")
            print(self.restroomsArray)
            print(self.restroomsArray.count)
            
            // The issue might be generated because you're trying to update the table in a background thread. All UI Updates must be done in main thread !!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // clip the tableView x-y coordinate to the size of current root view controller
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
}
