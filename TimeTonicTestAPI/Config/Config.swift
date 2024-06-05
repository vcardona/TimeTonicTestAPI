//
//  Config.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

class Config {
    static let shared = Config()
    
    private var config: [String: Any]?
    
    private init() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            if let config = NSDictionary(contentsOfFile: path) as? [String: Any] {
                self.config = config
            }
        }
    }
    
    func value(forKey key: String) -> String? {
        return config?[key] as? String
    }
}

