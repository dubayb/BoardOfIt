//
//  LocationPermissionViewController.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/26/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit
import CoreLocation

class LocationPermissionViewController: UIViewController {
    
    @IBOutlet weak var explanationLabel: UILabel!
    var successfulWithRegion: ((_ region: CLLocationCoordinate2D ) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        explanationLabel.layer.cornerRadius = 2.0
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func allowLocationReceived(_ sender: UIButton) {
        LocationService.sharedInstance.locationManager.requestWhenInUseAuthorization()
        UserDefaults.standard.set(true, forKey: "ShowOnboarding")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let locationAuth = storyboard.instantiateViewController(withIdentifier: "BGGImportViewController") as! BGGImportViewController
        self.navigationController?.pushViewController(locationAuth, animated: true)

    }
    
    
    
}

