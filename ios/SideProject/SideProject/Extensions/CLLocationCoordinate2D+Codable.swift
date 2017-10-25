//
//  CLLocationCoordinate2D+Codable.swift
//  SideProject
//
//  Created by Gordon Krull on 2017-10-25.
//  Copyright © 2017 GK. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        longitude = try container.decode(Double.self)
        latitude = try container.decode(Double.self)
    }
}
