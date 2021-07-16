//
//  Coordinator.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 15/03/21.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(){
        let repository = MovieRepository()
        let presenter = MoviePresenter(repository: repository)
        let viewController = MoviesViewController(presenter: presenter)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}


extension MainCoordinator {
    func navigateToFavoritesList() {
        let repository = MovieRepository()
        let presenter = FavoritesPresenter(repository: repository)
        let viewController = FavoritesViewController(presenter: presenter)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
