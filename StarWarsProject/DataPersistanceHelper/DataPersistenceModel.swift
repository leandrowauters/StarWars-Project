//
//  DataPersistanceModel.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

enum DataPersitenceError: Error {
    case decodingError(Error)
}
struct DataPersistenceModel {
    
    private static var planets = [Planet.ResultWrapper]()
    private static let planetsSaveLocationFileName = "Planets.plist"
    private static var people = [People.ResultWrapper]()
    private static let peopleSaveLocationFileName = "People.plist"

    
    //Get planet from save dir
    static func loadSavedFavorites(resource: Resource, completion: @escaping(DataPersitenceError?, [Planet.ResultWrapper]?, [People.ResultWrapper]?) -> Void) {
        var path = String()
        if resource == .Planet{
            path = DataPersistanceManager.filepathToDocumentsDirectory(filename: planetsSaveLocationFileName).path
        }
        if resource == .People {
            path = DataPersistanceManager.filepathToDocumentsDirectory(filename: peopleSaveLocationFileName).path
        }
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path){
                do {
                    if resource == .Planet {
                        planets = try PropertyListDecoder().decode([Planet.ResultWrapper].self, from: data)
                        completion(nil, planets, nil)
                    }
                    if resource == .People {
                        people = try PropertyListDecoder().decode([People.ResultWrapper].self, from: data)
                        completion(nil, nil, people)
                    }
                }catch {
                    completion(.decodingError(error), nil, nil)
                }
            }
        } else {
            print("\(planetsSaveLocationFileName) does not exist")
        }
    }
    
    static func addPlanet(planet: Planet.ResultWrapper){
        planets.append(planet)
        savePlanet()
    }
    
    static func deletePlanet(planet: Planet.ResultWrapper){
        planets.removeAll { (planetSaved) -> Bool in
            planetSaved == planet
        }
        savePlanet()
    }
    static func savePlanet(){
        let path = DataPersistanceManager.filepathToDocumentsDirectory(filename: planetsSaveLocationFileName)
        do{
            let data = try PropertyListEncoder().encode(planets)
            try data.write(to: path, options:  .atomic)
        }catch{
            print("Property list encoding error \(error)")
        }
    }
    
    
    static func addPerson(person: People.ResultWrapper){
        people.append(person)
        savePeople()
    }
    
    static func deletePeople(person: People.ResultWrapper){
        people.removeAll { (peopleSaved) -> Bool in
            peopleSaved == person
        }
        savePeople()
    }
    static func savePeople(){
        let path = DataPersistanceManager.filepathToDocumentsDirectory(filename: peopleSaveLocationFileName)
        do{
            let data = try PropertyListEncoder().encode(people)
            try data.write(to: path, options:  .atomic)
        }catch{
            print("Property list encoding error \(error)")
        }
    }
}
