//
//  HttpCarClient.swift
//  AlimakHermes
//
//  Created by Pawel Burzynski on 20/11/2016.
//  Copyright © 2016 JPBNET SOFTWARE. All rights reserved.
//

import Foundation
import Alamofire

class HttpCarClient : CarClient {
    
    let url = "http://192.168.1.102:8080"
    
    let duration = 1000
    
    public func drive(speed: Double) {
        print("Driving: " + speed.description)
        let method = url + "/api/drive?speed=" + speed.description + "&duration=" + duration.description
        
        Alamofire.request(method).response { response in
            _ = response.error
            
            print("asdasdas")
        }
    }
    
    public func turn(percentage: Double) {
        print("turning: " + percentage.description)
        _ = Alamofire.request(url + "/api/turn?turnPercentage=" + percentage.description + "&duration=" + duration.description)
    }
}
