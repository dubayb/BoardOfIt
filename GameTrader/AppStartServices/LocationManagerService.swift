//
//  LocationManagerService.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/25/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//


import Foundation
import CoreLocation
import UIKit

@objc class LocationService : NSObject  , CLLocationManagerDelegate , Servicing {
    func configure() {
        locationManager.delegate = self
        configureLocationManager()
    }
    var updateLocation = true
    var regionRadius: CLLocationDistance = 1
    static var usersLocation: CLLocation! {
        didSet {
            UserDataBaseService.shared.updateUserLocation(location: usersLocation)
        }
    }
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    static let sharedInstance = LocationService()
    
    func configureLocationManager(){
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        } 
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            configureLocationManager()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        if updateLocation {
            LocationService.usersLocation = location
            updateLocation = false
        }
    }
    
}
