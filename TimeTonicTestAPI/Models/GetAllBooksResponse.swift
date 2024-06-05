//
//  GetAllBooksResponse.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

struct GetAllBooksResponse: Decodable {
    let status: String
    let allBooks: AllBooks
    
    struct AllBooks: Decodable {
        let books: [Book]
    }
}


