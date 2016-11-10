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
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        var x = Double(translation.x) / resolution
        var y = Double(translation.y) / resolution

        x = x > 1 ? 1 : x < -1 ? -1 : x;
        y = y > 1 ? 1 : y < -1 ? -1 : y;
        
        
        if(sender.state == UIGestureRecognizerState.ended) {
            x = 0;
            y = 0;
        }
        
        label1.text = x.description
        label2.text = y.description
    }
    
    func normalizeDrag(value: Double) {
        // value = max(value - threshold, 0) / resolution
        // value = min(value, 1)
        
        
        // x = x > 1 ? 1 : x < -1 ? -1 : x;
    }
}

