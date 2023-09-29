//
//  RecipeDetailChildParameter.swift
//  FoodApp
//
//  Created by Umair Ahmad on 25/12/2022.
//

import Foundation


struct RecipeDetailChildParameter : Decodable {
    let id: Int
    let name: String
    let thumbnailURL: String
    let videoURL: String?
    let resultDescription: String
}

