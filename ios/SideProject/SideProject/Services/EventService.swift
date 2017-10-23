//
//  EventService.swift
//  SideProject
//
//  Created by Gordon Krull on 2017-10-23.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation

protocol EventService {
    func getEvents() -> [Event]
}

class RealEventService: EventService {
    func getEvents() -> [Event] {
        return []
    }
}
