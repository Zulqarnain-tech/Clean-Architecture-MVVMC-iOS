//
//  ViewController.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import UIKit
import SDWebImage
class RecipeSearchVC: UIViewController,CoordinatorBoard {
    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let activityIndicator: UIActivityIndicatorView = {
            let av = UIActivityIndicatorView(style: .medium)
            av.hidesWhenStopped = true
            av.translatesAutoresizingMaskIntoConstraints = false
            return av
        }()
    weak var searchRecipeChildCoordinator : SearchRecipeChildCooridnator?
    var viewModel: RecipeSearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        countLabel.text = ""
        setupUI()
        // Do any additional setup after loading the view.
    }
}

extension RecipeSearchVC :UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTag = searchBar.text, !searchTag.isEmpty else { return }
        self.startAnimation()
        viewModel?.resetData()
        viewModel?.callingSearchRecipe(searchedTag: searchTag)
    }

}

extension RecipeSearchVC: RecipeSearchViewModelDelegate{

    func searchedResult() {
        self.stopAnimation()
        self.tableView.reloadData()
        countLabel.text = "Count = \(viewModel?.recipesList?.count ?? 0)"
    }
    func displayNoResult(){
        self.stopAnimation()
        debugPrint("No Result Found")
    }
}

extension RecipeSearchVC{
        
    func setupUI() {
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    func startAnimation(){
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    func stopAnimation(){
        self.view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }
}
