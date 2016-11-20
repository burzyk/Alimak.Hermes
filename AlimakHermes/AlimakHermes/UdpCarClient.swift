//
//  CarClient.swift
//  AlimakHermes
//
//  Created by Pawel Burzynski on 10/11/2016.
//  Copyright © 2016 JPBNET SOFTWARE. All rights reserved.
//
// This entire class should be rebuild with https://realm.io/news/altconf-jon-shier-corebluetooth-and-you/
// Core Bluetooth
//

import Foundation
import CocoaAsyncSocket
import CoreBluetooth

class UdpCarClient : NSObject, GCDAsyncUdpSocketDelegate, CarClient {
    
    private var socket: GCDAsyncUdpSocket? = nil;
    
    public func drive(speed: Double) {
        print("Driving: " + speed.description)
        sendMessage(motor: 1, speed: speed, duration: 1000)
    }
    
    public func turnLeft() {
        print("turning left")
        sendMessage(motor: 2, speed: -1.0, duration: 1000)
    }
    
    public func turnRight() {
        print("turning right")
        sendMessage(motor: 2, speed: 1.0, duration: 1000)
    }
    
    public func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
        print("Data sent to the car")
    }
    
    public func udpSocket(_ sock: GCDAsyncUdpSocket, didNotSendDataWithTag tag: Int, dueToError error: Error?) {
        print("Error sending data: \(error)")
    }
    
    func sendMessage( motor: Int, speed: Double, duration: Int) {
        
        if (self.socket == nil) {
            let queue = DispatchQueue(label: "alimak.udp")
            self.socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: queue)
            
            do {
                try self.socket?.enableBroadcast(true)
            } catch {
                print("Error info: \(error)")
                self.socket = nil
                return
            }
        }
        
        var m = CInt(motor)
        var s = CFloat(speed)
        var d = CInt(duration)
        
        let buffer = NSMutableData()
        buffer.append(&m, length: MemoryLayout<CInt>.size)
        buffer.append(&s, length: MemoryLayout<CFloat>.size)
        buffer.append(&d, length: MemoryLayout<CInt>.size)
        
        self.socket?.send(buffer as Data, toHost: "192.168.1.105", port: 8080, withTimeout: -1, tag: 0)
    }
}
