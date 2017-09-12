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
	
	let angles: [CGFloat] = [2.21, 0.26, 1.9, 3.0, 0.6, 4.5, 0.26, 2.0, 4.6]
	
    var motionManager = CMMotionManager()

	@IBOutlet var image: UIImageView!
	@IBOutlet var staticImage: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		staticImage.transform = CGAffineTransform(rotationAngle: angles[0])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 0.02
		var count = 0
		motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, er) in
			if let data = data {
				let angle = atan2(data.acceleration.x, data.acceleration.y) + 3.1415  //от 0 до 2*пи.
				if fabsf(Float(angle) - Float(self.angles[self.i])) < 0.06 {
					count += 1
					if count > 35 {
						self.next(self)
						count = 0
					}
				} else {
					count = 0
				}
				UIView.animate(withDuration: 0.1, animations: {
					self.image.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
				})
			}
		}
    }
	
	var i = 0
	@IBAction func next(_ sender: Any) {
		i += 1
		if i == 1 {
			image.image = #imageLiteral(resourceName: "apple")
			staticImage.image = #imageLiteral(resourceName: "apple")
		} else if i == 2{
			image.image = #imageLiteral(resourceName: "telegram")
			staticImage.image = #imageLiteral(resourceName: "telegram")
		} else if i == 3{
			image.image = #imageLiteral(resourceName: "dollar")
			staticImage.image = #imageLiteral(resourceName: "dollar")
		} else if i == 4{
			Alerts.showOkAlert(on: self, title: "Congratulations", text: "This game is yours")
		}

		staticImage.transform = CGAffineTransform(rotationAngle: angles[i])
	}

}

class Alerts {
	class func showOkAlert(on vc: UIViewController, title: String, text: String) {
		let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		vc.present(alert, animated: true, completion: nil)
	}
}

