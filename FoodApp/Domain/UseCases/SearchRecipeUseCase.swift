//
//  SearchRecipeUseCase.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 22/12/2022.
//

import Foundation


protocol SearchUseCase {
    func execute(searchRequest: RecipeSearch, completion : @escaping (_ result: RecipeList?) -> Void)
}
class SearchRecipeUseCase{
    
    private let recipeQueryRepository: SearchRepository
    
    init(recipeQueryRepository _recipeQueryRepository: SearchRepository) {
        self.recipeQueryRepository = _recipeQueryRepository
    }
}
extension SearchRecipeUseCase: SearchUseCase{
    func execute(searchRequest: RecipeSearch, completion: @escaping (RecipeList?) -> Void) {
        recipeQueryRepository.searchQuery(query: searchRequest) { recipeList in
            let _ = completion(recipeList)
        }
    }
}



