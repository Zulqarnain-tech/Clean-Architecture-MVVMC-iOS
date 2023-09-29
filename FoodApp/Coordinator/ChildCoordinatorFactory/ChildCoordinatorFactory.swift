//
//  ChildCoordinatorFactory.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation
import UIKit


enum childCoordinatorType {
    case searchRecipe
    case recipeDetail
}


class ChildCoordinatorFactory {
    
    
    static func create(with _navigationController: UINavigationController, type: childCoordinatorType) -> ChildCoordinator{
        switch type{
        case .searchRecipe:
            return SearchRecipeChildCooridnator(with: _navigationController)
        case .recipeDetail:
            return RecipeDetailChildCooridnator(with: _navigationController)
        }
    }
}
