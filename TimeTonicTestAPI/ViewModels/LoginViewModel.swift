//
//  LoginViewModel.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 5/06/24.
//

import Foundation

class LoginViewModel {
    
    func login(username: String, password: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        APIManager.shared.initialize(username: username, password: password) { result in
            switch result {
            case .success(let booksResponse):
                completion(.success(booksResponse.allBooks.books))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

