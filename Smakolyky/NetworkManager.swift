//
//  NetworkManager.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//

import Foundation

final class NetworkManager {
    
    /// Shared instance of the networkManager
    static let shared = NetworkManager()
    
    /// JSON file lives in github repo, folder `Remote`
    private let baseURL = "https://github.com/olorium/Smakolyky/blob/main/Remote/api"
    
    
    /// Getting array of `Smakolyky` from remote API
    func getSmakolyky(completed: @escaping((Result<[Smakolyk], SMError>) -> Void)) {
        
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(SmakolykResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    private init() {}
}
