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
        filterBooks()
    }
    
    private func filterBooks() {
        books = books.filter { $0.b_c != "contact" }
        booksView.tableView.reloadData()
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else {
            return UITableViewCell()
        }
        
        let book = books[indexPath.row]
        cell.configure(with: book)
        
        return cell
    }
    
    // Agregar espacio entre las celdas
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return UIView()
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 10
        }
}

