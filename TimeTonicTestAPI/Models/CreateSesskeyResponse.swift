//
//  CreateSesskeyResponse.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

// Definir la estructura de respuesta para createSesskey
struct CreateSesskeyResponse: Decodable {
    let status: String
    let sesskey: String
    let id: String
    let restrictions: Restrictions
    let appName: String
    let createdVNB: String
    let req: String
}

struct Restrictions: Decodable {
    let carnet_code: String?
    let carnet_owner: String?
    let readonly: Bool
    let hideTables: Bool
    let hideMessages: Bool
    let hideEvents: Bool
    let internalUse: Bool
    
    private enum CodingKeys: String, CodingKey {
        case carnet_code, carnet_owner, readonly, hideTables, hideMessages, hideEvents, internalUse = "internal"
    }
}
