//
//  headerView.swift
//  Weather
//
//  Created by GiN Eugene on 10/5/2022.
//

import UIKit

class ForecastHeaderView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let startPoint = CGPoint(x: self.bounds.width / 10, y: 140)
        
        let semicircle = UIBezierPath()
        semicircle.move(to: startPoint)
        semicircle.addCurve(to: CGPoint(x: (self.bounds.width / 10) * 9, y: 140), controlPoint1: CGPoint(x: self.bounds.width / 6, y: self.bounds.height - 230), controlPoint2: CGPoint(x: (self.bounds.width / 6) * 5, y: self.bounds.height - 230))
        
        UIColor(rgb: 0xF6DD01).setStroke()
        
        semicircle.lineWidth = 3
        semicircle.stroke()
    }

}
