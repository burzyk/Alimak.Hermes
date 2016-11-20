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
    
    var url = "http://192.168.1.105:8080"
    
    public func drive(speed: Double) {
        print("Driving: " + speed.description)
        let method = url + "/api/drive?speed=" + speed.description + "&duration=1000"
        
        Alamofire.request(method).response { response in
            _ = response.error
            
            print("asdasdas")
        }
    }
    
    public func turnLeft() {
        print("turning left")
        _ = Alamofire.request(url + "/api/turn?turnPercentage=-1&duration=1000")
    }
    
    public func turnRight() {
        print("turning right")
        _ = Alamofire.request(url + "/api/turn?turnPercentage=1&duration=1000")
    }
}
