//
//  ViewController.swift
//  coreMotionApp
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
    
    }

    override func viewDidAppear(_ animated: Bool) {
//        if motionManager.isDeviceMotionAvailable
//        {
//            motionManager.startDeviceMotionUpdates()
//            var data = motionManager.deviceMotion
//
//        }
        motionManager.deviceMotionUpdateInterval = 1.0
        
        if motionManager.isDeviceMotionAvailable
        {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {(deviceMotion, error) -> Void in
                
                if (error == nil)
                {
                    self.handleDeviceMotionUpdate(deviceMotion: deviceMotion!)
                }
                else
                {
                    print("error")
                }
            })
        }
    }
    
    func degrees(radians: Double) -> Double
    {
        return 180 / Double.pi * radians
    }
    
    func handleDeviceMotionUpdate(deviceMotion: CMDeviceMotion)
    {
        let attitude = deviceMotion.attitude
        let roll = degrees(radians: attitude.roll)
        let pitch = degrees(radians: attitude.pitch)
        let yaw = degrees(radians: attitude.yaw)
        print("Roll: \(roll), Pitch: \(pitch), Yaw: \(yaw)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

