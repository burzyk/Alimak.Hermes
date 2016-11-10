//
//  ViewController.swift
//  AlimakHermes
//
//  Created by Pawel Burzynski on 09/10/2016.
//  Copyright © 2016 JPBNET SOFTWARE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let resolution = 100.0
    
    let threshold = 20.0
    
    let carClient = CarClient()
    
    var x = 0.0
    
    var y = 0.0
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            if (self.x > 0.5) {
                self.carClient.turnRight()
            }
            
            if (self.x < -0.5) {
                self.carClient.turnLeft()
            }
            
            if (abs(self.y) > 0.1) {
                self.carClient.drive(speed: self.y)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        x = normalizeDrag(value: translation.x)
        y = -normalizeDrag(value: translation.y)
        
        
        if(sender.state == UIGestureRecognizerState.ended) {
            x = 0
            y = 0
        }
        
        label1.text = x.description
        label2.text = y.description
    }
    
    func normalizeDrag(value: CGFloat) -> Double {
        let normalized = Double(value) / resolution
        return max(min(1, normalized), -1)
    }
}

