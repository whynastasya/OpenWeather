//
//  GradientLayer.swift
//  OpenWeather
//
//  Created by nastasya on 03.11.2023.
//

import UIKit

class GradientLayer: CAGradientLayer {
    static func createGradientLayer(with frame: CGRect, colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPointMake(0.4, 0)
        gradientLayer.endPoint = CGPointMake(0.3, 1)
        gradientLayer.cornerRadius = frame.width / 2
        gradientLayer.masksToBounds = true
        
        return gradientLayer
    }
}
