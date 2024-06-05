//
//  GetAllBooksResponse.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

// Definir la estructura de respuesta para getAllBooks
struct GetAllBooksResponse: Decodable {
    let status: String
    let books: [Book]
}
