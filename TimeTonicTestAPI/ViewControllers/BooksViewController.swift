//
//  BooksViewController.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import UIKit

class BooksViewController: UIViewController {
    
    var books: [Book] = []
    private var booksView: BooksView!
    
    override func loadView() {
        booksView = BooksView()
        view = booksView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksView.tableView.delegate = self
        booksView.tableView.dataSource = self
        loadBooks()
    }
    
    private func loadBooks() {
            booksView.activityIndicator.startAnimating()
            
            // Simular carga de libros (en tu caso, reemplaza esto con la llamada real a la API)
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                self.filterBooks()
                DispatchQueue.main.async {
                    self.booksView.activityIndicator.stopAnimating()
                }
            }
        }
    
    private func filterBooks() {
        books = books.filter { $0.b_c != "contact" }
        DispatchQueue.main.async {
            self.booksView.tableView.reloadData()
        }
    }
}
