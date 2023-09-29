//
//  FoodAppTests.swift
//  FoodAppTests
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import XCTest
@testable import FoodApp

final class FoodAppTests: XCTestCase {

    func test_SearchRecipe_Returns_CorrectResponse(){

        // ARRANGE
        let repository = SearchRecipeRepository()
        let useCase = SearchRecipeUseCase(recipeQueryRepository: repository)
        let searchRequest = RecipeSearch(from: 0, size: 20, tag: "pizza")
        
        let expectation = self.expectation(description: "ValidRequest_Returns_SearchRecipeResponse")

        // ACT
        useCase.execute(searchRequest: searchRequest) { response in
            // ASSERT
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.count, 248)
            XCTAssertEqual(response?.recipes.count, 20)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 25, handler: nil)

    }
    
    
    func test_SimilarRecipe_Returns_SuccessResponse(){

        // ARRANGE
        let repository = SimilarRecipeRepository()
        let useCase = SimilarRecipeDetailUseCase(recipeQueryRepository: repository)
        let expectation = self.expectation(description: "ValidRequest_Returns_SimilarRecipesResponse")

        // ACT
        useCase.execute(recipeID: 8132) { response in
            // ASSERT
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.count, 17)
            XCTAssertEqual(response?.recipes.count, 17)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 25, handler: nil)

    }
}
