//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 21/09/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    let restaurantNames: [String] = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    let restaurantImages: [String] = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited: [Bool] = Array(repeating: false, count: 21)
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /**
        Returns the number of rows based on the data available. In this case, return the number of elements in hte
        restaurentImages array
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    /**
     This is called for each element. This tells swift, for each element in the list of rows, get the cell (or the row) and set the text and image 
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none

        return cell
    }
    
    /**
        Code is execuded when a row is pressed
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I have been selected")
        // create an option menu
        let optionMenu = UIAlertController(title: nil, message: "What would you like to do?", preferredStyle: .actionSheet)
        
        // below is to fix the bug in iPad wherein the alert controller is not used, instead the pop over controller is used
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // add options to the menue
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // This is a closure you can pass to other methods
        let callActionHandler = {
            (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet. Please try again alter", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call 07340339473", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let buttonTitle = self.restaurantIsVisited[indexPath.row] ? "Check out" : "Check in"
        
        // sets the accessory type of the cell to checked
        let checkinAction = UIAlertAction(title: buttonTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
            if(self.restaurantIsVisited[indexPath.row]) {
                cell?.accessoryView = nil
                self.restaurantIsVisited[indexPath.row] = false
            } else {

                let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
                
                imageView.image = UIImage(named: "heart-tick")
                
                cell?.accessoryView = imageView
                self.restaurantIsVisited[indexPath.row] = true
            }
        })
        
        
        // add option to optionMenu
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(checkinAction)
        
        // show the menu
        present(optionMenu, animated: true, completion: nil)
        
        // deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
