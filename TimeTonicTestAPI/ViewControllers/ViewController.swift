import UIKit

class ViewController: UIViewController {
    
    private let usernameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Username"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Password"
            textField.borderStyle = .roundedRect
            textField.isSecureTextEntry = true
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Login", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
                // Añadir los subviews
                view.addSubview(usernameTextField)
                view.addSubview(passwordTextField)
                view.addSubview(loginButton)
                
                // Configurar las restricciones de Auto Layout
                setupConstraints()
        
    }
    
    // Configurar las restricciones de Auto Layout
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Username TextField Constraints
                usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                usernameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                // Password TextField Constraints
                passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
                passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                passwordTextField.heightAnchor.constraint(equalToConstant: 40),
                
                // Login Button Constraints
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
                loginButton.widthAnchor.constraint(equalToConstant: 100),
                loginButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    
    // Acción del botón de inicio de sesión
        @objc private func handleLogin() {
            guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                showAlert(title: "Error", message: "Please enter both username and password")
                return
            }
            
            // Llamar a la función para inicializar las solicitudes API con el username y password
                    APIManager.shared.initialize(username: username, password: password) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let booksResponse):
                                self.showBooksView(with: booksResponse.allBooks.books)
                            case .failure(let error):
                                self.showAlert(with: error)
                            }
                        }
                    }
                }
                
    // Mostrar la vista de libros
       private func showBooksView(with books: [Book]) {
           let booksViewController = BooksViewController()
           booksViewController.books = books
           booksViewController.modalPresentationStyle = .fullScreen
           present(booksViewController, animated: true, completion: nil)
       }
               
}
