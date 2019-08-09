//
//  PeopleClient.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

class PeopleClient {
    
    var currentPage = 1
    
    public func fetchPeople(completionHandler: @escaping(AppError?, [People.ResultPeopleWrapper]?) -> Void) {
        let endpointUrl = "https://swapi.co/api/people/?page=\(currentPage)"
        print(endpointUrl)
        currentPage += 1
        NetworkHelper.shared.performDataTask(endpointURLString: endpointUrl) { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let result = try JSONDecoder().decode(People.self, from: data)
                    completionHandler(nil, result.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
