//
//  HeaderCollectionReusableView.swift
//  OpenWeather
//
//  Created by nastasya on 30.10.2023.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeaderView"
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextLabel() {
        contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        textLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func configure(text: String) {
        textLabel.text = text
    }
}
