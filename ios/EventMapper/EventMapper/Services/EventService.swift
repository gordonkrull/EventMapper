//
//  EventService.swift
//  EventMapper
//
//  Created by Gordon Krull on 2017-10-23.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import RxSwift

protocol EventService {
    func getEvents()
    var events: PublishSubject<[Event]> { get }
}

class RealEventService: EventService {
    var httpService: HttpService!
    var events: PublishSubject<[Event]> = PublishSubject()
    
    func getEvents() {
        httpService.get(path: "/api/events") { data, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let event = try decoder.decode(Event.self, from: data)
                    self.events.onNext([event])
                } catch let decodeError {
                    print(decodeError)
                }
            }
        }
    }
    
    convenience init(httpService: HttpService) {
        self.init()
        self.httpService = httpService
    }
}
