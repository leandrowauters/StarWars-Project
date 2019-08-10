//
//  DataPersistanceModel.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct DataPersistanceModel {
    
    private static var planets = [Planet.ResultWrapper]()
    private static let saveLocationFileName = "Planets.plist"
    
    static func getPlanets() -> [Planet.ResultWrapper]{
        let path = DataPersistanceManager.filepathToDocumentsDirectory(filename: saveLocationFileName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path){
                do {
                    planets = try PropertyListDecoder().decode([Planet.ResultWrapper].self, from: data)
                }catch {
                    print ("property list dedoding error:\(error)")
                }
            }
        } else {
            print("\(saveLocationFileName) does not exist")
        }
        return planets
    }
    
    static func addPlanet(planet: Planet){
        planets.append(planet)
        saveManoUser()
    }
    
    static func deleteGame(manoUser: ManoUser, atIndex index: Int){
        manoUsers.remove(at: index)
        saveManoUser()
    }
    static func saveManoUser(){
        let path = DataPersistanceManager.filepathToDocumentsDirectory(filename: saveLocationFileName)
        do{
            let data = try PropertyListEncoder().encode(manoUsers)
            try data.write(to: path, options:  .atomic)
        }catch{
            print("Property list encoding error \(error)")
        }
    }
}
