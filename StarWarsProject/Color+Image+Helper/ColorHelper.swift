//
//  UIColor+Extention.swift
//  StarWarsProject
//
//  Created by Leandro Wauters on 8/9/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation
import UIKit
struct ColorHelper {
    let blond =  #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    let brown = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1)
    let grey = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    let auburn = #colorLiteral(red: 1, green: 0.2410776615, blue: 0.1360052824, alpha: 1)
    let black = UIColor.black
    let white = UIColor.white
    let gold = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    let hazel = #colorLiteral(red: 0.4713253975, green: 0.1201895103, blue: 0, alpha: 1)
    let pink = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    
    func getHairColor(hairColor: String) -> UIColor? {
        switch hairColor {
        case HairColors.blond.rawValue:
            return blond
        case HairColors.grey.rawValue:
            return grey
        case HairColors.brown.rawValue:
            return brown
        case HairColors.auburn.rawValue:
            return auburn
        case HairColors.black.rawValue:
            return black
        case HairColors.white.rawValue:
            return white
        default:
            return nil
        }
    }
    
    func getEyeColor(eyeColor: String) -> UIColor? {
        switch eyeColor {
        case EyeColors.white.rawValue:
            return white
        case EyeColors.dark.rawValue:
            return black
        case EyeColors.brown.rawValue:
            return brown
        case EyeColors.black.rawValue:
            return black
        case EyeColors.gold.rawValue:
            return gold
        case EyeColors.hazel.rawValue:
            return hazel
        case EyeColors.yellow.rawValue:
            return .yellow
        case EyeColors.red.rawValue:
            return .red
        case EyeColors.blue.rawValue:
            return .blue
        case EyeColors.pink.rawValue:
            return pink
        case EyeColors.green.rawValue:
            return .green
        case EyeColors.orange.rawValue:
            return .orange
        default:
           return nil
        }
    }
}

enum HairColors: String {
    case blond, grey, brown, auburn, black, white
    
}

enum EyeColors: String {
    case white, dark, black, gold,hazel,yellow,red,blue,pink,brown,green,orange
}


