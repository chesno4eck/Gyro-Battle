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
	@IBOutlet var startButton: UIButton!
	@IBOutlet var restartButton: UIButton!
	@IBOutlet var timerLabel: UILabel!
	
	var timer = Timer()
	var seconds = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		staticImage.isHidden = true
		image.isHidden = true
		startButton.transform = CGAffineTransform(rotationAngle: 3.1415/2.0)
		timerLabel.transform = CGAffineTransform(rotationAngle: 3.1415/2.0)
		
    }
	
	func updateTimer() {
		seconds += 1
		timerLabel.text = "\(seconds)"
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
						self.i += 1
						self.next(self)
						count = 0
					}
				} else {
					count = 0
				}
				UIView.animate(withDuration: 0.1, animations: {
					self.image.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
					self.timerLabel.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
				})
			}
		}
    }
	
	@IBAction func start(_ sender: Any) {
		startButton.isHidden = true
		staticImage.isHidden = false
		image.isHidden = false
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
		self.next(self)
	}
	
	@IBAction func restart(_ sender: Any) {
		seconds = 0
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
		restartButton.isHidden = true
		i = 0
		self.next(self)
	}
	
	var i = 0
	@IBAction func next(_ sender: Any) {
		
		if i == 0 {
			image.image = #imageLiteral(resourceName: "treangle")
			staticImage.image = #imageLiteral(resourceName: "treangle")
		} else if i == 1 {
			image.image = #imageLiteral(resourceName: "apple")
			staticImage.image = #imageLiteral(resourceName: "apple")
		} else if i == 2 {
			image.image = #imageLiteral(resourceName: "telegram")
			staticImage.image = #imageLiteral(resourceName: "telegram")
		} else if i == 3 {
			image.image = #imageLiteral(resourceName: "predator")
			staticImage.image = #imageLiteral(resourceName: "predator")
		} else if i == 4 {
			image.image = #imageLiteral(resourceName: "yin")
			staticImage.image = #imageLiteral(resourceName: "yin")
		} else if i == 5 {
			image.image = #imageLiteral(resourceName: "slack")
			staticImage.image = #imageLiteral(resourceName: "slack")
		} else if i == 6 {
			image.image = #imageLiteral(resourceName: "dollar")
			staticImage.image = #imageLiteral(resourceName: "dollar")
		} else if i == 7 {
			Alerts.showOkAlert(on: self, title: "Congratulations", text: "Your score is \(seconds)")
			timer.invalidate()
			
			restartButton.isHidden = false
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

