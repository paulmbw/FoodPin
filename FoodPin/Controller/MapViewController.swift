//
//  MapViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 02/11/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//


import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var restuarant = Restaurant()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // remember this gets called when we navigate to the view controller (or to this screen)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restuarant.location, completionHandler: { placemarks, error in
            if let error = error {
                print("There was an error \(error)")
                return
            }
            
            if let placemarks = placemarks {
                // get the placemarkrs
                let placemark = placemarks[0]
                
                // add the annotation
                let annotation = MKPointAnnotation()
                // give the annotation a title
                annotation.title = self.restuarant.name
                
                // give the annotation a subtitle
                annotation.subtitle = self.restuarant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    // annotation is shown, but it is not selected. so we need to selected it so it is larger
                    // without this, the annotation will still be shown in a small size (its initial state)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
