//
//  ViewController.swift
//  SideProject
//
//  Created by Gordon Krull on 2017-09-28.
//  Copyright © 2017 GK. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    var locationManager: CLLocationManager!
    var eventService: EventService!
    var events: [Event]!
    
    @IBOutlet var mapView: MKMapView!
    
    init(_ eventService: EventService) {
        super.init(nibName: String(describing: ViewController.self), bundle: Bundle.main)
        self.eventService = eventService
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startStandardUpdates()
        self.setupMap()
        self.seedData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startStandardUpdates() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func setupMap() {
        mapView.showsUserLocation = true
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
    }
    
    func seedData() {
        let event = Event(coordinate: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
                          title: "TITLE",
                          subtitle: "SUBTITLE")
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = event.coordinate
        annotation1.title = event.title
        annotation1.subtitle = event.subtitle
        mapView.addAnnotation(annotation1)
    }
}

extension ViewController: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERRROR-------------\n " + String(describing: error))
    }
}

extension ViewController: MKMapViewDelegate {
}

