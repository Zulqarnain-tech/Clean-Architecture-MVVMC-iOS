//
//  RecipeDetailVC.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import UIKit

class RecipeDetailVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    weak var recipeDetailChildCoordinator : RecipeDetailChildCooridnator?
    var viewModel: RecipeDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.delegate = self
        self.setUpLabels()
        self.viewModel?.callingSimilarRecipe(recipeID: (viewModel?.recipe!.id)!)
        // Do any additional setup after loading the view.
    }
    
    private func setUpLabels(){
        self.recipeNameLabel.text = self.viewModel?.recipe?.name
        self.recipeDescriptionLabel.text = self.viewModel?.recipe?.resultDescription
    }
}

extension RecipeDetailVC: RecipeDetailViewModelDelegate{
    func similarApiResult() {
        self.tableView.reloadData()
    }
    
    
}
