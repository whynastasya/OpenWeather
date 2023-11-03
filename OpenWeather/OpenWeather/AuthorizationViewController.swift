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
    private let gradientView = GradientCirclesView(frame: .zero,
                                            colors: [UIColor.white.cgColor,
                                                     UIColor.systemBlue.withAlphaComponent(0.5).cgColor,
                                                     UIColor.systemPurple.withAlphaComponent(0.7).cgColor])
    var authorizationView: AuthorizationView = LogInView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientView()
        setupScrollView()
        WeatherData.shared.getWeathersData()
        
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
        
        setupAuthorizationView()
        setupAppNameLabel()
        setupConstraints()
    }
    
    private func setupAppNameLabel() {
        scrollView.addSubview(appNameLabel)
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "OpenWeather"
        appNameLabel.font = UIFont.systemFont(ofSize: 30, weight: .light)
        appNameLabel.textColor = .black
        appNameLabel.textAlignment = .center
    }
    
    private func setupGradientView() {
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAuthorizationView() {
        scrollView.addSubview(authorizationView)
        authorizationView.translatesAutoresizingMaskIntoConstraints = false
        authorizationView.authorizationButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        authorizationView.otherAuthorizationButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            authorizationView.heightAnchor.constraint(equalToConstant: 300),
            authorizationView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 50),
            authorizationView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -50),
            authorizationView.centerXAnchor.constraint(equalTo: frameLayoutGuide.centerXAnchor),
            authorizationView.centerYAnchor.constraint(equalTo: contentLayoutGuide.centerYAnchor),
            contentLayoutGuide.heightAnchor.constraint(equalTo: frameLayoutGuide.heightAnchor),
            contentLayoutGuide.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
            
            appNameLabel.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            appNameLabel.heightAnchor.constraint(equalToConstant: 50),
            appNameLabel.bottomAnchor.constraint(equalTo: authorizationView.topAnchor)
        ])
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height - 270, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard(_: UIScrollView) {
        scrollView.endEditing(true)
    }
    
    @objc func loginButtonTapped() {
        //        if authorizationView.loginTextField.hasText && authorizationView.passwordTextField.hasText {
        //            let tabBarController = TabBarControllerBuilder.createTabBarController()
        //            tabBarController.modalPresentationStyle = .fullScreen
        //            present(tabBarController, animated: true)
        //        } else {
        //            let alertController = UIAlertController(title: "", message: "Неверно введены логин и/или пароль", preferredStyle: .alert)
        //            alertController.addAction(UIAlertAction(title: "Ок", style: .destructive))
        //        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let tabBarController = TabBarControllerBuilder.createTabBarController()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
        }
    }
    
    @objc func createAccountButtonTapped() {
        let signInViewController = AuthorizationViewController()
        signInViewController.modalPresentationStyle = .fullScreen
        signInViewController.authorizationView = SignInView(frame: .zero)
        present(signInViewController, animated: true)
    }
}
