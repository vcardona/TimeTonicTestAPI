//
//  CreateOauthkeyResponse.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

// Definir la estructura de respuesta para createOauthkey
struct CreateOauthkeyResponse: Decodable {
    let status: String
    let oauthkey: String
    let id: String
    let o_u: String
    let createdVNB: String
    let req: String
}
