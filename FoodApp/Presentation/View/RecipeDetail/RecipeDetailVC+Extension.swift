//
//  RecipeDetailVC+Extension.swift
//  FoodApp
//
//  Created by Pixasart on 27/12/2022.
//

import Foundation
import UIKit


extension RecipeDetailVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.similarRecipes?.recipes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarRecipesTableViewCell", for: indexPath) as! SimilarRecipesTableViewCell
        let recipeName = self.viewModel?.similarRecipes?.recipes[indexPath.row].name
        cell.recipeName.text = recipeName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
