//
//  RecipeDetailViewModel.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation


protocol RecipeDetailViewModelDelegate {
    func similarApiResult()
}

class RecipeDetailViewModel {
    var delegate: RecipeDetailViewModelDelegate?
    var similarRecipeUseCase: similarUseCase?
    var similarRecipes: RecipeList?
    var recipe: Recipe?
    
    init(recipe: Recipe,searchRecipeUseCase useCase: similarUseCase) {
        self.recipe = recipe
        self.similarRecipeUseCase = useCase
    }
    func callingSimilarRecipe(recipeID: Int) -> Void {
        self.similarRecipeUseCase?.execute(recipeID: recipeID, completion: { result in
            self.similarRecipes = result
            DispatchQueue.main.async {
                if result != nil{
                    self.delegate?.similarApiResult()
                }
            }
        })
    }
}




