//
//  SimilarRecipeRepository.swift
//  FoodApp
//
//  Created by Pixasart on 27/12/2022.
//

import Foundation


// Mark:- Repository

protocol SimilarRepository {
    func similarQuery(recipeID: Int, completion: @escaping (RecipeList) -> Void)
}

class SimilarRecipeRepository{
    private var searchRecipeResource = HttpUtility()
}
extension SimilarRecipeRepository: SimilarRepository{
    
    func similarQuery(recipeID: Int, completion: @escaping (RecipeList) -> Void) {
        let addedString = "?recipe_id=\(recipeID)"
        let url = URL(string: Endpoint.similarRecipe + addedString)!
        searchRecipeResource.getApiData(requestUrl: url, resultType: SearchRecipeResponse.self) { (Response) in
            _ = completion(Response.toDomain())
        }
    }
}
