//
//  Planets.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct Planet: Codable {
    struct ResultWrapper: Codable {
        let name: String
        let climate: String
        let population: String
        let created: String
    }
    
    let results: [ResultWrapper]
}


