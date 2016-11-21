//
//  CarClientProtocol.swift
//  AlimakHermes
//
//  Created by Pawel Burzynski on 20/11/2016.
//  Copyright © 2016 JPBNET SOFTWARE. All rights reserved.
//

import Foundation

protocol CarClient {
    
    func drive(speed: Double);
    
    func turn(percentage: Double);
}
