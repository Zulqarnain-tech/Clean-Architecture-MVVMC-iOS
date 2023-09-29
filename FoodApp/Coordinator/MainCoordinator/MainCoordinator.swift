//
//  MainCoordinator.swift
//  FoodApp
//
//  Created by Zulqarnain Naveed on 21/12/2022.
//

import Foundation
import UIKit

class MainCoordinator : ParentCoordinator {
    
    
    var childCoordinator: [ChildCoordinator] = [ChildCoordinator]()
    var navigationController: UINavigationController

    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }

    func configureRootViewController() {
        let searchRecipeChildCooridnator = ChildCoordinatorFactory.create(with: self.navigationController, type: .searchRecipe)
        self.childCoordinator.append(searchRecipeChildCooridnator)
        searchRecipeChildCooridnator.parentCoordinator = self
        searchRecipeChildCooridnator.configureChildViewController()
    }
    
    func removeChildCoordinator(child: ChildCoordinator) {
        for (index, coordinator) in childCoordinator.enumerated(){
            if child === coordinator{
                self.childCoordinator.remove(at: index)
                break
            }
        }
    }
}
