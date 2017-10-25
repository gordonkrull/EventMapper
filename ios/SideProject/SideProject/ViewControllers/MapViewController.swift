//
//  ViewController.swift
//  SideProject
//
//  Created by Gordon Krull on 2017-09-28.
//  Copyright © 2017 GK. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

protocol HandleLocationSearch {
    func dropPinAndZoom(placemark: MKPlacemark)
}

class MapViewController: UIViewController {
    var locationManager: CLLocationManager!
    var searchResultsController: UISearchController?
    var eventService: EventService!
    var events: [Event]!
    var selectedPin: MKPlacemark?
    @IBOutlet private var mapView: MKMapView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startStandardUpdates()
        self.fetchEvents()
        self.setupMap()
        self.seedData()
        self.setupSearchResultsController()
        self.setupSearchBar()
    }

    func startStandardUpdates() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    func fetchEvents() {
        self.events = self.eventService.getEvents()
    }

    // MARK: - Private
    private func setupMap() {
        mapView.showsUserLocation = true
        mapView.showsPointsOfInterest = true
        mapView.delegate = self
    }

    private func seedData() {
        let event = Event(coordinate: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093),
                          title: "TITLE",
                          subtitle: "SUBTITLE")
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = event.coordinate
        annotation1.title = event.title
        annotation1.subtitle = event.subtitle
        mapView.addAnnotation(annotation1)
    }

    private func setupSearchResultsController() {
        if let locationSearchTableVC = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTableViewController")
            as? LocationSearchTableViewController {
            locationSearchTableVC.mapView = self.mapView
            locationSearchTableVC.handleLocationSearchDelegate = self
            self.searchResultsController = UISearchController(searchResultsController: locationSearchTableVC)
            self.searchResultsController?.searchResultsUpdater = locationSearchTableVC
            self.searchResultsController?.hidesNavigationBarDuringPresentation = false
            self.searchResultsController?.dimsBackgroundDuringPresentation = true
            self.definesPresentationContext = true
        }
    }

    private func setupSearchBar() {
        let searchBar = searchResultsController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchResultsController?.searchBar
    }
}

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
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

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
}

// MARK: - HandleLocationSearch
extension MapViewController: HandleLocationSearch {
    func dropPinAndZoom(placemark: MKPlacemark) {
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}
