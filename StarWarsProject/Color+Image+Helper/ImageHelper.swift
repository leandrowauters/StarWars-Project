//
//  ImageHelper.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/10/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation
import UIKit
struct ImageHelper {
    
    //IMAGES FOR TERRAIN
//    let valley = UIImage(named: "valley")!
//    let desert = UIImage(named: "desert")!
//    let lake = UIImage(named: "lake")!
//    let glacier = UIImage(named: "glacier")!
//    let cave = UIImage(named: "cave")!
//    let swamp = UIImage(named: "swamp")!
//    let grass = UIImage(named: "grass")!
//    let volcano = UIImage(named: "volcano")!
//    let forest = UIImage(named: "forest")!
//    let mountain = UIImage(named: "mountain")!
//    let sea = UIImage(named: "sea")!
//    let field = UIImage(named: "field")!
//    let city = UIImage(named: "city")!
    
    //IMAGES FOR CLIMATE
    let temperate = UIImage(named: "temperate")!
    let subartic = UIImage(named: "subartic")!
    let windy = UIImage(named: "windy")!
    let tropical = UIImage(named: "tropical")!
    let murky = UIImage(named: "murky")!
    let arid = UIImage(named: "arid")!
    let artic = UIImage(named: "artic")!
    let humid = UIImage(named: "humid")!
    let polluted = UIImage(named: "polluted")!
    
    
    //EVERY POSSIBLE TERRAIN SORTED BY CATEGORY
    let cityTerrain: [[String] : UIImage] = [["cityscape", "cities", " urban", "urban"] : UIImage(named: "city")!]
    let valleyTerrain: [[String] : UIImage] = [[" valleys", "grassy hills"] : UIImage(named: "valley")!]
    let lakeTerrain: [[String] : UIImage] = [["lakes"," lakes"] : UIImage(named: "desert")!]
    let glacierTerrain: [[String] : UIImage] = [[" ice caves", "glaciers"," tundra","tundra"," cliffs","rocky islands"," glaciers"] :UIImage(named: "glacier")!]
    let caveTerrain: [[String] : UIImage] = [["caves"] : UIImage(named: "cave")! ]
    let swampTerrain: [[String] : UIImage] = [[" savannas"," rainforests"," swamps", " savanna"," acid pools","swamp", "swamps","rainforests"," sinkholes"] : UIImage(named: "swamp")!]
    let grassTerrain: [[String] : UIImage] = [[" mesas", "verdant","grass","grasslands", " grasslands"] : UIImage(named: "grass")!]
    let volcanoTerrain: [[String] : UIImage] = [[" lava rivers","volcanoes"," volcanoes"] : UIImage(named: "volcano")!]
    let forestTerrain: [[String] : UIImage] = [[" plateaus","forests","jungles","fungus forests"," jungles"," forests","barren","jungle"] : UIImage(named: "forest")!]
    let mountainTerrain: [[String] : UIImage] = [[" mountain"," mesas"," mountains"," cliffs"," reefs","mountains"," canyons"," hills"," mountain ranges","rocky"] : UIImage(named: "mountain")!]
    let seaTerrain: [[String] : UIImage] = [[" seas"," oceans","ocean"," rivers"] : UIImage(named: "sea")!]
    let desertTerrain: [[String] : UIImage] = [[" rocky deserts","deserts"] : UIImage(named: "desert")!]
    let fieldTerrain: [[String] : UIImage] = [[" fields","verdant","grassy hills"," plateaus","plains"," vines"] : UIImage(named: "field")!]
    
    
   
    
    //func that returns image based on terrain category
    public func getImageBasedOnTerrain(terrain: String) -> [UIImage] {
        let collectionOfTerrain = [cityTerrain,valleyTerrain,lakeTerrain,glacierTerrain,caveTerrain,swampTerrain,grassTerrain,volcanoTerrain,forestTerrain,mountainTerrain,seaTerrain,seaTerrain,desertTerrain,fieldTerrain]
        var imagesToReturn = Set<UIImage>()
        let separetedTerrain = terrain.components(separatedBy: ",")
        for terrain in separetedTerrain {
            if imagesToReturn.count == 4 {
                return Array(imagesToReturn)
            }
            for typeOfTerrain in collectionOfTerrain {
                for key in typeOfTerrain.keys {
                    key.forEach { (terrainKey) in
                        if terrain == terrainKey {
                            
                            imagesToReturn.insert(typeOfTerrain.values.first!)
                        }
                    }
                }
            }
        }
        
       return Array(imagesToReturn)
    }
    
    public func getImageBasedOnClimate(climate: String) -> UIImage? {
        let climateToSet = climate.components(separatedBy: ",").first!
        if climateToSet == "tropical" {
            return tropical
        }
        if climateToSet == "murky" {
            return murky
        }
        if climateToSet == "arid" {
            return arid
        }
        if climateToSet == "tropical" {
            return tropical
        }
        if climateToSet == "frozen" {
            return artic
        }
        if climateToSet == "frigid" {
            return artic
        }
        if climateToSet == "temperate" {
            return temperate
        }
        if climateToSet == "superheated" {
            return arid
        }
        if climateToSet == "polluted" {
            return polluted
        }
        if climateToSet == "hot" {
            return arid
        }
        return nil
    }
    //func that sets images to imageView
    public func setupTerrainImages(imagesViews: [UIImageView], terrain: String) {
        let images = getImageBasedOnTerrain(terrain: terrain)
        if images.count == 0 {
            return
        }
        for i in 0...images.count - 1 {
            imagesViews[i].image = images[i]
        }
    }
    
    public func setupClimateImage(climate: String, imageView: UIImageView) {
        if let image = getImageBasedOnClimate(climate: climate) {
            imageView.image = image
        }
    }
}
