//
//  ShapesGenerator.swift
//  gyro
//
//  Created by Алиев Д.Ю. on 11/09/2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class ShapesGenerator {
	static func createShape() -> UIView {
		return TriangleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
	}
}



class TriangleView : UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func draw(_ rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
		context.beginPath()
		context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
		context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
		context.closePath()
		
		context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
		context.fillPath()
	}
}
