//
//  AuthorizationViewController.swift
//  OpenWeather
//
//  Created by nastasya on 21.06.2023.
//

import UIKit

final class AuthorizationViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let appNameLabel = UILabel()
    private let gradientView = GradientView(frame: .zero,
                                            colors: [UIColor.white.cgColor,
                                                     UIColor.cyan.withAlphaComponent(0.5).cgColor,
                                                     UIColor.systemBlue.withAlphaComponent(0.6).cgColor])
    private let authorizationView = AuthorizationView(frame: .zero, textColor: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_ :)))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        
        setupScrollViewConstraints()
        setupAuthorizationView()
        setupAppNameLabel()
    }
    
    private func setupAppNameLabel() {
        scrollView.addSubview(appNameLabel)
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "🌦️OpenWeather"
        appNameLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        appNameLabel.textColor = .black
        appNameLabel.textAlignment = .center
        setupAppNameLabelConstraints()
    }
    
    private func setupGradientView() {
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAuthorizationView() {
        scrollView.addSubview(authorizationView)
        authorizationView.translatesAutoresizingMaskIntoConstraints = false
        setupAuthorizationViewConstraints()
        authorizationView.loginButton.addTarget(self, action: #selector(loginButtonPressed(_ :)), for: .touchUpInside)
    }

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAppNameLabelConstraints() {
        let contentLayoutGuide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            appNameLabel.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            appNameLabel.heightAnchor.constraint(equalToConstant: 50),
            appNameLabel.bottomAnchor.constraint(equalTo: authorizationView.topAnchor)
        ])
    }
    
    private func setupAuthorizationViewConstraints() {
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        NSLayoutConstraint.activate([
            authorizationView.heightAnchor.constraint(equalToConstant: 280),
            authorizationView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 50),
            authorizationView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -50),
            authorizationView.centerXAnchor.constraint(equalTo: frameLayoutGuide.centerXAnchor),
            authorizationView.centerYAnchor.constraint(equalTo: contentLayoutGuide.centerYAnchor),
            contentLayoutGuide.heightAnchor.constraint(equalTo: frameLayoutGuide.heightAnchor),
            contentLayoutGuide.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor)
        ])
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard(_: UIScrollView) {
        scrollView.endEditing(true)
    }
    
    @objc func loginButtonPressed(_ loginButton: UIButton) {
//        if authorizationView.loginTextField.hasText && authorizationView.passwordTextField.hasText {
//            let tabBarController = TabBarControllerBuilder.createTabBarController()
//            tabBarController.modalPresentationStyle = .fullScreen
//            present(tabBarController, animated: true)
//        } else {
//            let alertController = UIAlertController(title: "", message: "Неверно введены логин и/или пароль", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Ок", style: .destructive))
//        }
//        let tabBarController = TabBarControllerBuilder.createTabBarController()
//        tabBarController.modalPresentationStyle = .fullScreen
//        present(tabBarController, animated: true)
    }
}
