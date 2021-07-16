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
        let viewController = MoviesViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}


extension MainCoordinator {

}
