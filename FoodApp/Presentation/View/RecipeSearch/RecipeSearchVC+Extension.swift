//
//  RecipeSearchVC+Extension.swift
//  FoodApp
//
//  Created by Umair Ahmad on 24/12/2022.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

extension RecipeSearchVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.recipesList?.recipes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListTableViewCell", for: indexPath) as! RecipeListTableViewCell
        let recipeArray = self.viewModel?.recipesList?.recipes[indexPath.row]
        cell.recipeName.text = recipeArray?.name
        if let ImageUrl = URL(string: recipeArray?.thumbnailURL ?? ""){
            cell.recipeImageView.sd_setImage(with: ImageUrl, completed: nil)
            //cell.recipeImageView.load(url: ImageUrl)
                }
        if recipeArray?.videoURL == nil{
            cell.videoPlayButton.isHidden = false
        }
        
        cell.delegate = self
        cell.videoPlayButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = viewModel?.recipesList?.recipes else{
            return
        }
        self.searchRecipeChildCoordinator?.navigateToRecipeDetailVC(recipe: recipe[indexPath.row])
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let fetchMoreData = viewModel?.shouldFetchMoreData else{
            return
        }
        if indexPath.row + 1 == viewModel?.recipesList?.recipes.count && (fetchMoreData) {
            guard let tag = viewModel?.tag else{
                return
            }
            self.startAnimation()
            viewModel?.callingSearchRecipe(searchedTag: tag)
        }
    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



extension RecipeSearchVC: PlayVideoButtonDelegate{
    func videoPlayerButtonPressed(urlNumber: Int) {
        guard let url = viewModel?.recipesList?.recipes[urlNumber].videoURL else{
            return
        }
        guard let url = URL(string: url)else {return}
                let player = AVPlayer(url: url)
                let playerController = AVPlayerViewController()
                playerController.player = player
                playerController.allowsPictureInPicturePlayback = true
                playerController.player?.play()
                self.present(playerController, animated: true, completion: nil)
    }
    
    
}
