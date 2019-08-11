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
    



//    if climateToSet == "polluted" {
//    return polluted
//    }

    
    //IMAGES FOR CLIMATE
    let temperate: [[String] : UIImage] = [["temperate"] : UIImage(named: "temperate")!]
    let tropical: [[String] : UIImage] = [["tropical"] : UIImage(named: "tropical")!]
    let murky: [[String] : UIImage] = [["murky"] :  UIImage(named: "murky")!]
    let arid: [[String] : UIImage] = [["superheated", "hot" ,"arid"] :UIImage(named: "arid")!]
    let artic: [[String] : UIImage] = [["frigid","frozen"] :  UIImage(named: "artic")!]
    let polluted: [[String] : UIImage] = [["polluted"] :   UIImage(named: "polluted")!]
    
    
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
        let collectionOfClimates = [temperate, tropical, murky, arid, artic, polluted]
        var imageToReturn: UIImage?
        let climateToSet = climate.components(separatedBy: ",").first!
        for typeOfClimate in collectionOfClimates {
            for key in typeOfClimate.keys {
                key.forEach { (climateKey) in
                    if climateToSet == climateKey {
                        imageToReturn = typeOfClimate.values.first!
                    }
                }
            }
        }
        return imageToReturn
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
