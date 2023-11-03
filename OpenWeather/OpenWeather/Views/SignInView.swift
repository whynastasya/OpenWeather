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
        "I already have account"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
