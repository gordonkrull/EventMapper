//
//  Event.swift
//  SideProject
//
//  Created by Gordon Krull on 2017-10-23.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import CoreLocation

struct Event {
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

extension Event: Equatable {
    public static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude &&
            lhs.coordinate.longitude == rhs.coordinate.longitude &&
            lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle
    }
}

