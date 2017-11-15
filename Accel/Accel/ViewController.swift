//
//  ViewController.swift
//  Accel
//
//  Created by Timothy M Shepard on 11/14/17.
//  Copyright © 2017 Timothy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.accelerometerUpdateInterval =  0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(data, error) in
            if let myData = data
            {
                if myData.acceleration.x > 1 {
                    print("Do something special")
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

