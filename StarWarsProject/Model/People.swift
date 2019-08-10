//
//  People.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct People: Codable {
    struct ResultWrapper: Codable {
        let name: String
        let hairColor: String
        let eyeColor: String
        let birthYear: String
        let created: String
        let height: String
        let mass: String
        
        private enum CodingKeys: String, CodingKey {
            case name
            case hairColor = "hair_color"
            case eyeColor = "eye_color"
            case birthYear = "birth_year"
            case created
            case height
            case mass
        }
    }
    let results: [ResultWrapper]
    
    
}



