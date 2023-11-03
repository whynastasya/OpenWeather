//
//  LoginView.swift
//  OpenWeather
//
//  Created by nastasya on 03.11.2023.
//

import UIKit

final class LogInView: AuthorizationView {
    
    
    let passwordRecoveryButton = UIButton()
    override var authorizationButtonTitle: String {
        "Log In"
    }
    
    override var authorizationLabelTitle: String {
        ""
    }
    
    override var otherAuthorizationButtonTitle: String {
        "Create Account"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupPasswordRecoveryButton()
        setupConstraints()
    }

    private func setupPasswordRecoveryButton() {
        addSubview(passwordRecoveryButton)
        passwordRecoveryButton.translatesAutoresizingMaskIntoConstraints = false
        passwordRecoveryButton.setAttributedTitle(
            NSAttributedString(string: "Forgot your password?",
                               attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium),
                                            .foregroundColor: UIColor.gray,
                                            .underlineStyle: NSUnderlineStyle.single.rawValue]),
                               for: .normal
        )
        passwordRecoveryButton.contentHorizontalAlignment = .trailing

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            passwordRecoveryButton.trailingAnchor.constraint(equalTo: authorizationButton.trailingAnchor),
            passwordRecoveryButton.bottomAnchor.constraint(equalTo: authorizationButton.topAnchor, constant: -15)
        ])
    }
}
