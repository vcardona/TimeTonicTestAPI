//
//  APIManager.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func initialize(username: String, password: String,completion: @escaping (Result<GetAllBooksResponse, Error>) -> Void) {
        ApiService.shared.createAppkey { result in
            switch result {
            case .success(let appkeyResponse):
                ApiService.shared.createOauthkey(appkey: appkeyResponse.appkey, username: username, password: password) { result in
                    switch result {
                    case .success(let oauthResponse):
                        ApiService.shared.createSesskey(o_u: oauthResponse.o_u, oauthkey: oauthResponse.oauthkey) { result in
                            switch result {
                            case .success(let sessResponse):
                                ApiService.shared.getAllBooks(o_u: oauthResponse.o_u, sesskey: sessResponse.sesskey, completion: completion)
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

