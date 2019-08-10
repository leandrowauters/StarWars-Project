//
//  DataPersistanceManager.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct DataPersistanceManager {
    //DOC Directory where data is saved
    static func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //path to directory where data is saved
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return DataPersistanceManager.documentsDirectory().appendingPathComponent(filename)
    }
}
