//
//  RecipeDetail.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation
import UIKit


class RecipeDetailChildCooridnator : ChildCoordinator {
    
    
    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    
    
    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }
    
    
    func configureChildViewController() {
        let recipeDetailVC = RecipeDetailVC.instansiateFromStoryBoard()
        recipeDetailVC.recipeDetailChildCoordinator = self
        self.navigationController.pushViewController(recipeDetailVC, animated: false)
    }
}
