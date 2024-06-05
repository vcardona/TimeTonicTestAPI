//
//  ApiService.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import Foundation

class ApiService {
    
    static let shared = ApiService()
    private let baseUrl = "https://timetonic.com/live/api.php"
    
    private init() { }
    
    func createAppkey(completion: @escaping (Result<CreateAppkeyResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "req": "createAppkey",
            "appname": "api"
        ]
        
        sendRequest(parameters: parameters, completion: completion)
    }
    
    func createOauthkey(appkey: String,username: String,password: String, completion: @escaping (Result<CreateOauthkeyResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "req": "createOauthkey",
            "login": username,
            "pwd": password,
            "appkey": appkey
        ]
        
        sendRequest(parameters: parameters, completion: completion)
    }
    
    func createSesskey(o_u: String, oauthkey: String, completion: @escaping (Result<CreateSesskeyResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "req": "createSesskey",
            "o_u": o_u,
            "oauthkey": oauthkey,
            "restrictions": ""
        ]
        
        sendRequest(parameters: parameters, completion: completion)
    }
    
    func getAllBooks(o_u: String, sesskey: String, completion: @escaping (Result<GetAllBooksResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "req": "getAllBooks",
            "o_u": o_u,
            "u_c": o_u,
            "sesskey": sesskey
        ]
        
        sendRequest(parameters: parameters, completion: completion)
    }
    
    private func sendRequest<T: Decodable>(parameters: [String: String], completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            print("URL inválida")
            return
        }
        
        var components = URLComponents()
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        let query = components.percentEncodedQuery
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("Datos no válidos")
                return
            }
            
            if let dataString = String(data: data, encoding: .utf8) {
                print("Respuesta de la API: \(dataString)")
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch let parsingError {
                completion(.failure(parsingError))
            }
        }
        
        task.resume()
    }
}

