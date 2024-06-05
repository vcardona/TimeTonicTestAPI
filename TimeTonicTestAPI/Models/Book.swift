//
//  Book.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

struct Book: Decodable {
    let b_c: String
    let ownerPrefs: OwnerPrefs?
    
    struct OwnerPrefs: Decodable {
        let title: String
        let oCoverImg: String?
    }
    
    var coverImageUrl: URL? {
        guard let coverImg = ownerPrefs?.oCoverImg else { return nil }
        return URL(string: "https://timetonic.com/live/dbi/in/tb/FU-1701419839-65699b3f78400/\(coverImg)")
    }
}
