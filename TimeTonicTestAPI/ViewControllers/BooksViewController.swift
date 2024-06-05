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
