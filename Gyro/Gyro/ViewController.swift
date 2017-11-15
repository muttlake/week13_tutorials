//
//  ViewController.swift
//  Gyro
//
//  Created by Timothy M Shepard on 11/14/17.
//  Copyright © 2017 Timothy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
            if let myData = data
            {
                //x is tilt away from you so phone faces the ceiling
                //y is keeping phone upright but rotate it
                //z is rotating from portrait to landscape
                if abs(myData.rotationRate.x) > 3
                {
                    print("You tilted your device.")
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

