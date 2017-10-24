//
//  ViewControllerSpec.swift
//  SideProjectTests
//
//  Created by Gordon Krull on 2017-09-28.
//  Copyright © 2017 GK. All rights reserved.
//

import Nimble
import Quick
import CoreLocation

@testable import SideProject

fileprivate class EventServiceStub: EventService {
    var stubbedEvents: [Event]!
    
    func getEvents() -> [Event] {
        return stubbedEvents
    }
}

class MapViewControllerSpec: QuickSpec {
    override func spec() {
        describe("MapViewControllerSpec") {
            var subject: MapViewController!
            var eventServiceStub: EventServiceStub!
            
            beforeEach {
                eventServiceStub = EventServiceStub()
                subject = MapViewController(eventServiceStub)
            }
            
            context("viewDidLoad") {
                beforeEach {
                    eventServiceStub.stubbedEvents = [Event(coordinate: CLLocationCoordinate2D(),
                                                            title: "test title",
                                                            subtitle: "test subtitle")]
                    _ = subject.view
                    subject.viewDidLoad()
                }
                
                it("should fetch and store events from the eventService") {
                    expect(subject.events).to(equal(eventServiceStub.stubbedEvents))
                }
            }
            
            context("CLLocationManagerDelegate") {
                beforeEach {
                    let location = CLLocation()
                    location.
                    subject.locationManager(subject.locationManager, didUpdateLocations: <#T##[CLLocation]#>)
                }
            }

            context("MKMapViewDelegate") {
                
            }

            
        }
    }
}
