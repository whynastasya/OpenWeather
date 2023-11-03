//
//  AuthorizationView.swift
//  OpenWeather
//
//  Created by nastasya on 27.06.2023.
//

import UIKit

class AuthorizationView: UIView {
    
    var authorizationButtonTitle: String {
        "Title"
    }
    
    var authorizationLabelTitle: String {
        "Title"
    }
    
    var otherAuthorizationButtonTitle: String {
        "Title"
    }
    
    private let textColor: UIColor = .black
    
    private let authorizationLabel = UILabel()
    private let loginLabel = UILabel()
    let loginTextField = UITextField()
    private let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let authorizationButton = UIButton()
    let otherAuthorizationButton = UIButton()
    let errorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white.withAlphaComponent(0.4)
        layer.cornerRadius = 20
        
        setupAuthorizationTitleLabel()
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupAuthorizationButton()
        setupOtherAuthorizationButton()
        setupErrorLabel()
        setupConstraints()
    }
    
    private func setupAuthorizationTitleLabel() {
        addSubview(authorizationLabel)
        authorizationLabel.font = .systemFont(ofSize: 25, weight: .bold)
        authorizationLabel.textColor = .systemPurple
        authorizationLabel.text = authorizationLabelTitle
        authorizationLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLoginLabel() {
        addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Your email"
        loginLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        loginLabel.textColor = textColor.withAlphaComponent(0.6)
    }
    
    private func setupLoginTextField() {
        addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        let loginImageView = UIImageView()
        loginImageView.frame = CGRectMake(0, 0, 35, 35)
        loginImageView.image = UIImage(
            systemName: "envelope")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        loginImageView.contentMode = .center
        let leftView = UIView()
        leftView.frame = CGRectMake(0, 0, 35, 35)
        leftView.addSubview(loginImageView)
        loginTextField.leftViewMode = .always
        loginTextField.leftView = leftView
        loginTextField.placeholder = "example@mail.com"
    }
    
    private func setupPasswordLabel() {
        addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Your password"
        passwordLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        passwordLabel.textColor = textColor.withAlphaComponent(0.6)
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        let passwordImageView = UIImageView()
        passwordImageView.frame = CGRectMake(0, 0, 35, 35)
        passwordImageView.image = UIImage(systemName: "lock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        passwordImageView.contentMode = .center
        let leftView = UIView()
        leftView.frame = CGRectMake(0, 0, 35, 35)
        leftView.addSubview(passwordImageView)
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = leftView
        passwordTextField.placeholder = "**********"
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupAuthorizationButton() {
        addSubview(authorizationButton)
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        authorizationButton.backgroundColor = .systemPurple.withAlphaComponent(0.9)
        authorizationButton.layer.cornerRadius = 10
        authorizationButton.clipsToBounds = true
        authorizationButton.setAttributedTitle(
            NSAttributedString(string: authorizationButtonTitle,
                               attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .heavy)]),
                               for: .normal
        )
        authorizationButton.setTitleColor(.gray, for: .selected)
    }
    
    private func setupOtherAuthorizationButton() {
        addSubview(otherAuthorizationButton)
        otherAuthorizationButton.setAttributedTitle(
            NSAttributedString(string: otherAuthorizationButtonTitle,
                               attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                                            .foregroundColor: UIColor.systemPurple.withAlphaComponent(0.8)]),
                               for: .normal
        )
        otherAuthorizationButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupErrorLabel() {
        addSubview(errorLabel)
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 2
        errorLabel.font = .systemFont(ofSize: 12, weight: .bold)
        errorLabel.textAlignment = .center
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            authorizationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            authorizationLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: authorizationLabel.bottomAnchor, constant: 0),
            errorLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 5),
            loginLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            loginTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            
            otherAuthorizationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            otherAuthorizationButton.centerXAnchor.constraint(equalTo: authorizationButton.centerXAnchor),
            
            authorizationButton.bottomAnchor.constraint(equalTo: otherAuthorizationButton.topAnchor, constant: -5),
            authorizationButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            authorizationButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
        ])
    }
}
