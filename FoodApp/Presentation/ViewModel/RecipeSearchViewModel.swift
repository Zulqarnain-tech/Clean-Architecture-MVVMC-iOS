//
//  RecipeSearchViewModel.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation
protocol RecipeSearchViewModelDelegate {
    func searchedResult()
    func displayNoResult()
}

class RecipeSearchViewModel {
    var delegate: RecipeSearchViewModelDelegate?
    var searchRecipeUseCase: SearchUseCase?
    var recipesList: RecipeList?
    private var from: Int = 0
    private var size: Int = 20
    var tag: String?
    var shouldFetchMoreData: Bool = true
    init(searchRecipeUseCase useCase: SearchUseCase) {
        self.searchRecipeUseCase = useCase
    }
    func resetData(){
        self.shouldFetchMoreData = true
        self.from = 0
        self.recipesList = nil
        self.tag = nil
    }
    func callingSearchRecipe(searchedTag: String) -> Void {
        self.tag = searchedTag
        self.searchRecipeUseCase?.execute(searchRequest: RecipeSearch(from: from, size: size, tag: searchedTag), completion: { result in
            if self.recipesList == nil{
                self.recipesList = result
            }
            DispatchQueue.main.async {
                if result != nil{
                    
                    guard let recipe = result?.recipes else{return}
        
                    self.recipesList?.recipes.append(contentsOf: recipe)
                    self.delegate?.searchedResult()
                    self.from += 1
                }else{
                    self.shouldFetchMoreData = false
                    self.delegate?.displayNoResult()
                }
                
            }
        })
    }
}
