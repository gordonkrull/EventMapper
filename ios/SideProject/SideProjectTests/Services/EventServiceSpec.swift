//
//  EventServiceSpec.swift
//  SideProjectTests
//
//  Created by Gordon Krull on 2017-10-23.
//  Copyright © 2017 GK. All rights reserved.
//

import Nimble
import Quick

@testable import SideProject

fileprivate class HttpServiceStub: HttpService {
}

class EventServiceSpec: QuickSpec {
    override func spec() {
        describe("EventServiceSpec") {
            var subject: EventService!
            beforeEach {
                subject = RealEventService()
            }
        }
    }
}
