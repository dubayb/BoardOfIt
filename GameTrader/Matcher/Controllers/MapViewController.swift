//
//  MapViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/24/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseUI
import CoreLocation

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    private let notificationCenter = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self,
                                       selector: #selector(centerMapOnLocation),
                                       name: .nearbyUsersFound,
                                       object: nil)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @objc func centerMapOnLocation(_ notification: Notification) {
        let location = notification.object as! CLLocation
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(location.coordinate.latitude, location.coordinate.longitude))
        
        self.mapView.setRegion(coordinateRegion, animated: true)
        //found region now find users in it
    }

    
}

extension MapViewController : SegueHandlerType {
    enum SegueIdentifier : String {
        case ShowAllowLocation
    }
}
