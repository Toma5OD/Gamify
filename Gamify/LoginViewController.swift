import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    var loginStatus: Binding<Bool>

    // UI Elements
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    
    private let logoImageView = UIImageView()

    init(loginStatus: Binding<Bool>) {
        self.loginStatus = loginStatus
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white

        // Initialize UI Elements
        setupTextField(usernameTextField, placeholder: "Username")
        setupTextField(passwordTextField, placeholder: "Password", isSecure: true)
        setupLoginButton()

        // Disable Autoresizing Mask Translation
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup Logo Image View
            logoImageView.image = UIImage(named: "logo") // Replace with your logo's file name
            logoImageView.contentMode = .scaleAspectFit
            view.addSubview(logoImageView)
            logoImageView.translatesAutoresizingMaskIntoConstraints = false

            // Set constraints for logoImageView
            NSLayoutConstraint.activate([
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20), // Adjust constant for spacing
                logoImageView.widthAnchor.constraint(equalToConstant: 400), // Adjust for your desired size
                logoImageView.heightAnchor.constraint(equalToConstant: 400)  // Adjust for your desired size
            ])

        // Setup Auto Layout Constraints
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupTextField(_ textField: UITextField, placeholder: String, isSecure: Bool = false) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = isSecure
        view.addSubview(textField)
        // Set constraints or frame
    }

    private func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        // Set constraints or frame
    }
    
    private func isInputValid(username: String?, password: String?) -> Bool {
        guard let username = username, !username.isEmpty else {
            // Show an alert or an error message indicating username can't be empty
            return false
        }

        guard let password = password, !password.isEmpty else {
            // Show an alert or an error message indicating password can't be empty
            return false
        }

        // Additional validation can be added here (e.g., email format check)

        return true
    }


    @objc private func loginButtonTapped() {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if isInputValid(username: username, password: password) {
            NetworkManager.shared.authenticateUser(email: username, password: password) { [weak self] success in
                DispatchQueue.main.async {
                    if success {
                        self?.loginStatus.wrappedValue = true
                    } else {
                        // Handle login failure (show an alert, etc.)
                    }
                }
            }
        }
    }

    // Example login function
    func login(username: String, password: String) {
        // Perform login (e.g., authenticate with your backend)
        // On successful login:
        DispatchQueue.main.async {
            self.loginStatus.wrappedValue = true
        }
    }
}
