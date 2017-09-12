//
//  ViewController.swift
//  gyro
//
//  Created by Sebastian Hette on 11.12.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()

	var currentView = UIView()
	
	@IBOutlet var image: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.02
		
		motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, er) in
			if let data = data {
//				print("\(data.acceleration.x)  \(data.acceleration.y)   \(data.acceleration.z) ")
				let angle = atan2(data.acceleration.x, data.acceleration.y)
//				print(angle)
				UIView.animate(withDuration: 0.1, animations: {
					self.currentView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
				})
			}
		}
    }
	static var i = 0
	@IBAction func next(_ sender: Any) {
//		self.view.subviews.forEach{ $0.removeFromSuperview() }
		if ViewController.i == 0 {
			currentView = image
		} else {
			currentView = ShapesGenerator.createShape()
		}
		ViewController.i += 1
	}

}

