//
//  RecipeDetailUseCase.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 22/12/2022.
//

import Foundation


protocol similarUseCase {
    func execute(recipeID: Int, completion : @escaping (_ result: RecipeList?) -> Void)
}
class SimilarRecipeDetailUseCase{
    
    private let recipeSimilarRepository: SimilarRepository
    
    init(recipeQueryRepository _recipeSimilarRepository: SimilarRepository) {
        self.recipeSimilarRepository = _recipeSimilarRepository
    }
}
extension SimilarRecipeDetailUseCase: similarUseCase{
    func execute(recipeID: Int, completion: @escaping (RecipeList?) -> Void) {
        recipeSimilarRepository.similarQuery(recipeID: recipeID) { recipeList in
            let _ = completion(recipeList)
        }
    }
}
