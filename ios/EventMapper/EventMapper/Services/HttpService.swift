//
//  HttpService.swift
//  EventMapper
//
//  Created by Gordon Krull on 2017-10-23.
//  Copyright © 2017 GK. All rights reserved.
//

import Alamofire
import Foundation

protocol HttpService {
    func get(path: String, completionHandler: @escaping (Data?, Error?) -> ())
}

class RealHttpService: HttpService {
    let baseUrl = "https://eventmapper.cfapps.io"

    func get(path: String, completionHandler: @escaping (Data?, Error?) -> ()) {
        Alamofire.request(baseUrl + path).responseData { response in
           completionHandler(response.data, nil)
        }
    }
}
