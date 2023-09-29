//
//  Recipe.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 22/12/2022.
//

import Foundation


struct Recipe{
    let id: Int
    let name: String
    let thumbnailURL: String
    let videoURL: String?
    let resultDescription: String?
}

struct RecipeList{
    let count: Int
    var recipes: [Recipe]
}
