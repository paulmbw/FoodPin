//
//  MapViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 02/11/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//


import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var restuarant = Restaurant()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }

    override func viewDidLoad() {
        mapView.delegate = self
        mapView.showsTraffic = true
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
    /**
     Whenever an annotation is needed for a map view, this method is called.
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        /**
         There is the default user location annotation when you open maps. We check if the current annotation is this type,
         we return nil as we want to use our own annotation
         */
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        /**
         For improved performance, we want to use an exisiting annotation view instread of creating one.When it is no longer used
         e.g. when we navigate away from the annoration view, it fets cached
         */
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        /**
         if, for example you are navigating to the map screen for the first time, we create the annotation view
         */
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "😋"
        annotationView?.markerTintColor = UIColor.orange
        
        return annotationView
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
