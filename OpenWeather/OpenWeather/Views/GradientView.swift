//
//  GradientView.swift
//  OpenWeather
//
//  Created by nastasya on 22.06.2023.
//

import UIKit

final class GradientView: UIView {
    
    private var gradientColors = [UIColor.systemPurple, UIColor.systemOrange].map( { $0.cgColor })
    
    convenience init(frame: CGRect, colors: [CGColor]) {
        self.init(frame: frame)
        self.gradientColors = colors
        setupView()
    }
    
    private func setupView() {
        for index in  0..<3 {
            let circleViewDimension = CGFloat(110 * (index + 1))
            let circleView = createCircleGradientView(dimension: circleViewDimension)
            addSubview(circleView)
            switch index {
                case 0:
                    NSLayoutConstraint.activate([
                        circleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 600),
                        circleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 200)
                    ])
                case 1:
                    NSLayoutConstraint.activate([
                        circleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -30),
                        circleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 200)
                    ])
                default:
                    NSLayoutConstraint.activate([
                        circleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250),
                        circleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -40)
                    ])
            }
        }
    }
    
    private func createCircleGradientView(dimension: CGFloat) -> UIView {
        let circleView = UIView()
        circleView.backgroundColor = .purple
        circleView.layer.cornerRadius = dimension / 2
        circleView.clipsToBounds = true
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: dimension),
            circleView.heightAnchor.constraint(equalToConstant: dimension)
        ])
        let gradientLayer = GradientView.createGradientLayer(with: dimension, dimensionHeight: dimension, colors: gradientColors)
        circleView.layer.addSublayer(gradientLayer)
        
        return circleView
    }
    
    static func createGradientLayer(with dimensionWidth: CGFloat, dimensionHeight: CGFloat, colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRectMake(0, 0, dimensionWidth, dimensionHeight)
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPointMake(0.4, 0)
        gradientLayer.endPoint = CGPointMake(0.3, 1)
        gradientLayer.cornerRadius = dimensionWidth / 2
        gradientLayer.masksToBounds = true
        
        return gradientLayer
    }
}
