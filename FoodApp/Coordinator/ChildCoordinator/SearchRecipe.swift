//
//  SearchRecipe.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation
import UIKit


class SearchRecipeChildCooridnator : ChildCoordinator {
    
    
    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    
    
    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }
    
    
    func configureChildViewController() {
        let repository = SearchRecipeRepository()
        let searchRecipeUseCase = SearchRecipeUseCase(recipeQueryRepository: repository)
        let viewModel = RecipeSearchViewModel(searchRecipeUseCase: searchRecipeUseCase)
        let recipeSearchVC = RecipeSearchVC.instansiateFromStoryBoard()
        recipeSearchVC.viewModel = viewModel
        recipeSearchVC.searchRecipeChildCoordinator = self
        parentCoordinator?.childCoordinator.append(recipeSearchVC.searchRecipeChildCoordinator!)
        self.navigationController.pushViewController(recipeSearchVC, animated: false)
    }
    
    func navigateToRecipeDetailVC(recipe: Recipe) {
        let repository = SimilarRecipeRepository()
        let similarRecipeUseCase = SimilarRecipeDetailUseCase(recipeQueryRepository: repository)
        let viewModel = RecipeDetailViewModel(recipe: recipe, searchRecipeUseCase: similarRecipeUseCase)
        let similarRecipeVC = RecipeDetailVC.instansiateFromStoryBoard()
        similarRecipeVC.viewModel = viewModel
        self.navigationController.pushViewController(similarRecipeVC, animated: false)
    }
}
