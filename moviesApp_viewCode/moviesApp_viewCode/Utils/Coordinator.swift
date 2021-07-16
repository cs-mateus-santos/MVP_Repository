//
//  Coordinator.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 15/03/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    ///This method active the coordinator
//    func start() -> UIViewController
    func start()
}
