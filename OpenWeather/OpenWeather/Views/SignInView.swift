//
//  SignInView.swift
//  OpenWeather
//
//  Created by nastasya on 03.11.2023.
//

import UIKit

class SignInView: AuthorizationView {
    
    override var authorizationLabelTitle: String {
        "Create Account"
    }
    
    override var authorizationButtonTitle: String {
        "Sign In"
    }
    
    override var otherAuthorizationButtonTitle: String {
        ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NSLayoutConstraint.activate([
            authorizationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
