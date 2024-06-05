import UIKit

class ViewController: UIViewController {
    
 
    private let loginView = LoginView()
    private let loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLoginView()
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    private func setupLoginView() {
            view.addSubview(loginView)
            loginView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                loginView.topAnchor.constraint(equalTo: view.topAnchor),
                loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }

    
    // Acción del botón de inicio de sesión
    @objc private func handleLogin() {
        guard let username = loginView.usernameTextField.text, !username.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter both username and password")
            return
        }
        
        DispatchQueue.main.async {
                    self.loginView.activityIndicator.startAnimating()
                }
        
        loginViewModel.login(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.loginView.activityIndicator.stopAnimating()
                switch result {
                case .success(let books):
                    self?.showBooksView(with: books)
                case .failure(let error):
                    self?.showAlert(with: error)
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
