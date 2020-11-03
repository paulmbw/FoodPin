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
    
    func configure(location: String) {
        // get the location
        let geocoder = CLGeocoder()
        print("this is the geocoder \(geocoder)")
        
        print("This is the location \(location)")
        
        // this is what translates the address as a text to specific latitude and logitude values
        geocoder.geocodeAddressString(location, completionHandler: {
            placemarks, error in
            // if there is an error, we return
            if let error = error {
                print("There was a problem \(error.localizedDescription)")
                return
            }
            
            // if there are placemakrs, use the placemarks
            if let placemarks = placemarks {
                // get the first placemark
                let placemark = placemarks[0]
                
                // add the annotation
                let annotation = MKPointAnnotation()
                
                // if there is a location on the placemark, use it
                if let location = placemark.location {
                    // display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // this sets the initial zoom level to 250m radius
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                    
                }
            }
        })
    }

}
