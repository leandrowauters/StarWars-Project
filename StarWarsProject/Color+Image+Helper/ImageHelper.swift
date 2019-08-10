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
    let valley = UIImage(named: "valley")!
    let desert = UIImage(named: "desert")!
    let lake = UIImage(named: "lake")!
    let glacier = UIImage(named: "glacier")!
    let cave = UIImage(named: "cave")!
    let swamp = UIImage(named: "swamp")!
    let grass = UIImage(named: "grass")!
    let volcano = UIImage(named: "volcano")!
    let forest = UIImage(named: "forest")!
    let mountain = UIImage(named: "mountain")!
    let sea = UIImage(named: "sea")!
    let field = UIImage(named: "field")!
    let city = UIImage(named: "city")!
    
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
    let cityTerrain = ["cityscape", "cities", " urban", "urban"]
    let valleyTerrain = [" valleys", "grassy hills"]
    let lakeTerrain = ["lakes"," lakes"]
    let glacierTerrain = [" ice caves", "glaciers"," tundra","tundra"," cliffs","rocky islands"," glaciers"]
    let caveTerrain = ["caves"]
    let swampTerrain = [" savannas"," rainforests"," swamps", " savanna"," acid pools","swamp", "swamps","rainforests"," sinkholes"]
    let grassTerrain = [" mesas", "verdant","grass","grasslands", " grasslands"]
    let volcanoTerrain = [" lava rivers","volcanoes"," volcanoes"]
    let forestTerrain = [" plateaus","forests","jungles","fungus forests"," jungles"," forests","barren","jungle"]
    let mountainTerrain = [" mountain"," mesas"," mountains"," cliffs"," reefs","mountains"," canyons"," hills"," mountain ranges","rocky"]
    let seaTerrain = [" seas"," oceans","ocean"," rivers"]
    let desertTerrain = [" rocky deserts","deserts"]
    let fieldTerrain = [" fields","verdant","grassy hills"," plateaus","plains"," vines"]
    
    //EVERY POSSIBLE CLIMATE
   
    
    //func that returns image based on terrain category
    public func getImageBasedOnTerrain(terrain: String) -> [UIImage] {
        var imagesToReturn = [UIImage]()
        let separetedTerrain = terrain.components(separatedBy: ",")
        for terrain in separetedTerrain {
            if imagesToReturn.count == 4 {
                return imagesToReturn
            }
            if cityTerrain.contains(terrain) {
                imagesToReturn.append(city)
            }
            if valleyTerrain.contains(terrain) {
                imagesToReturn.append(valley)
            }
            if lakeTerrain.contains(terrain){
                imagesToReturn.append(lake)
            }
            if glacierTerrain.contains(terrain) {
                imagesToReturn.append(glacier)
            }
            if caveTerrain.contains(terrain) {
                imagesToReturn.append(cave)
            }
            if swampTerrain.contains(terrain) {
                imagesToReturn.append(swamp)
            }
            if grassTerrain.contains(terrain) {
                imagesToReturn.append(grass)
            }
            if volcanoTerrain.contains(terrain) {
                imagesToReturn.append(volcano)
            }
            if forestTerrain.contains(terrain) {
                imagesToReturn.append(forest)
            }
            if mountainTerrain.contains(terrain) {
                imagesToReturn.append(mountain)
            }
            if seaTerrain.contains(terrain) {
                imagesToReturn.append(sea)
            }
            if desertTerrain.contains(terrain) {
                imagesToReturn.append(desert)
            }
            if fieldTerrain.contains(terrain) {
                imagesToReturn.append(field)
            }
        }
        
       return imagesToReturn
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
