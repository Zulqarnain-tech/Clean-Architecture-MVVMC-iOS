//
//  DataMapping.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 22/12/2022.
//

import Foundation

struct RecipeSearchRequest: Encodable{
    let from: Int
    let size: Int
    let tags: String? = nil
}


// MARK: - SearchRecipeResponse

struct SearchRecipeResponse: Decodable {
    var count: Int
    var results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct Result: Decodable {
    let id: Int
    let name: String
    let thumbnailURL: String
    let videoURL: String?
    let resultDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case videoURL = "video_url"
        case name
        case thumbnailURL = "thumbnail_url"
        case resultDescription = "description"
        case id
    }
}

extension Result{
    func toDomain() -> Recipe {
        return .init(id: self.id, name: self.name, thumbnailURL: self.thumbnailURL, videoURL: self.videoURL, resultDescription: self.resultDescription)
    }
}
extension SearchRecipeResponse {
    func toDomain() -> RecipeList {
        return .init(count: self.count, recipes: results.map { $0.toDomain() })
    }
}
