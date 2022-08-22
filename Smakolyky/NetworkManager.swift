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
    
    /// JSON file lives in gitHub repo, folder `Remote`
    private let baseURL = "https://raw.githubusercontent.com/olorium/Smakolyky/main/Remote/api"
    
    
    /// Getting array of `Smakolyky` from remote API
    func getSmakolyky(completed: @escaping((Result<[Smakolyk], SMError>) -> Void)) {
        
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
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
