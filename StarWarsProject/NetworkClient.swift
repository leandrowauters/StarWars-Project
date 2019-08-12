//
//  PeopleClient.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecodingError(Error)
}

enum Resource {
    case People
    case Planet
}
class NetworkClient {
    
    var currentPage = 1
    
    
    public func fetchData(resource: Resource, completion: @escaping (Result<[People.ResultWrapper], NetworkError>?, Result<[Planet.ResultWrapper], NetworkError>?) -> Void) {
        
        var endPointURL = String()
        switch resource {
        case .People:
            endPointURL = "https://swapi.co/api/people/?page=\(currentPage)"
        case .Planet:
            endPointURL = "https://swapi.co/api/planets/?page=\(currentPage)"
        }
        
        currentPage += 1
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL), .failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.apiError(error)), .failure(.apiError(error)))
            } else if let data = data {
                do {
                    switch resource {
                    case .People:
                        let result = try JSONDecoder().decode(People.self, from: data)
                        completion(.success(result.results), nil)
                    case .Planet:
                        let result = try JSONDecoder().decode(Planet.self, from: data)
                        completion(nil, .success(result.results))
                    }

                } catch {
                    completion(.failure(.jsonDecodingError(error)), .failure(.jsonDecodingError(error)))
                }
            }
        }
        task.resume()
    }
}
