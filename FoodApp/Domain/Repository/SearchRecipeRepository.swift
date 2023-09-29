//
//  SearchRecipeRepository.swift
//  FoodApp
//
//  Created by Pixasart on 27/12/2022.
//

import Foundation



protocol SearchRepository {
    func searchQuery(query: RecipeSearch, completion: @escaping (RecipeList) -> Void)
}

class SearchRecipeRepository{
    private var searchRecipeResource = HttpUtility()
}
extension SearchRecipeRepository: SearchRepository{
    func searchQuery(query: RecipeSearch, completion: @escaping (RecipeList) -> Void) {
        var addedString = "?from=\(query.from)&size=\(query.size)"
        if let tag = query.tag{
            addedString = addedString + "&q=\(tag)"
        }
        let url = URL(string: Endpoint.searchRecipe + addedString)!
        searchRecipeResource.getApiData(requestUrl: url, resultType: SearchRecipeResponse.self) { (Response) in
            _ = completion(Response.toDomain())
        }
    }
    
    
}
