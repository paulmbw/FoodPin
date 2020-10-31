//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Paul Waweru on 31/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
