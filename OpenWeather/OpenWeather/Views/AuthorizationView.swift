//
//  AuthorizationView.swift
//  OpenWeather
//
//  Created by nastasya on 27.06.2023.
//

import UIKit

final class AuthorizationView: UIView {
    
    private var textColor = UIColor()
    
    private let loginLabel = UILabel()
    let loginTextField = UITextField()
    private let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    private let passwordRecoveryButton = UIButton()
    
    convenience init(frame: CGRect, textColor: UIColor) {
        self.init(frame: frame)
        self.textColor = textColor
        setupView()
    }

    private func setupView() {
        backgroundColor = .white.withAlphaComponent(0.3)
        layer.cornerRadius = 20
        
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupPasswordRecoveryButton()
        setupLoginButton()
    }
    
    private func setupLoginLabel() {
        addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Your email"
        loginLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        loginLabel.textColor = textColor.withAlphaComponent(0.6)
        setupLoginLabelConstraints()
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
        setupLoginTextFieldConstraints()
    }
    
    private func setupPasswordLabel() {
        addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Your password"
        passwordLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        passwordLabel.textColor = textColor.withAlphaComponent(0.6)
        setupPasswordLabelConstraints()
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
        setupPasswordTextFieldConstraints()
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
        setupPasswordRecoveryButtonConstraints()
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .systemBlue.withAlphaComponent(0.9)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.setAttributedTitle(
            NSAttributedString(string: "Log In",
                               attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .heavy)]),
                               for: .normal
        )
        loginButton.setTitleColor(.gray, for: .selected)
        setupLoginButtonConstraints()
    }
    
    private func setupLoginLabelConstraints() {
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 25),
            loginLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupLoginTextFieldConstraints() {
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            loginTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor)
        ])
    }
    
    private func setupPasswordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor)
        ])
    }
    
    private func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor)
        ])
    }
    
    private func setupPasswordRecoveryButtonConstraints() {
        NSLayoutConstraint.activate([
            passwordRecoveryButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordRecoveryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordRecoveryButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    private func setupLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordRecoveryButton.bottomAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor)
        ])
    }
}
