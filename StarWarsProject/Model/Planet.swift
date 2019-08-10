//
//  Planets.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct Planet: Codable {
    struct ResultWrapper: Codable, Equatable {
        let name: String
        let climate: String
        let population: String
        let created: String
        let diameter: String
        let surfaceWater: String
        let terrain: String
        let gravity: String
        
        private enum CodingKeys: String, CodingKey {
            case name, climate, population, created, diameter,terrain,gravity
            case surfaceWater = "surface_water"
        }
    }
    
    let results: [ResultWrapper]
}


