//
//  CarClient.swift
//  AlimakHermes
//
//  Created by Pawel Burzynski on 10/11/2016.
//  Copyright © 2016 JPBNET SOFTWARE. All rights reserved.
//

import Foundation

class CarClient {
    
    public func drive(speed: Double) {
        print("Driving: " + speed.description)
    }
    
    public func turnLeft() {
        print("turnLeft: ")
    }
    
    public func turnRight() {
        print("turnRight: ")
    }
}
