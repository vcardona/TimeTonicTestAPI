//
//  LoginView.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 5/06/24.
//

import UIKit

class LoginView: UIView {
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Username TextField Constraints
            usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField Constraints
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Login Button Constraints
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

