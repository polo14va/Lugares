//
//  MapViewController.swift
//  Lugares
//
//  Created by Pedro Martinez on 30/9/16.
//  Copyright © 2016 Pedro Martinez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
    
    var place: Place!

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("mapa debe mostrar"+place.name)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(place.location) { [unowned self](placemarks, error) in
            if error == nil{
                //procesar posibles lugares
                for placemarks in placemarks! {
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.place.name
                    annotation.subtitle = self.place.type
                    annotation.coordinate = (placemarks.location?.coordinate)!
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
                
            } else{
                print ("Ha anido un error: \(error?.localizedDescription)")
            }
        }
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
