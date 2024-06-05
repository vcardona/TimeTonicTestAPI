//
//  CreateAppkeyResponse.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

// Definir la estructura de respuesta para createAppkey
struct CreateAppkeyResponse: Decodable {
    let status: String
    let appkey: String
    let id: String
    let createdVNB: String
    let req: String
}
