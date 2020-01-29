//
//  TodoListRouter.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import UIKit

class TodoListRouter: TodoListRouterInput {
    
    private var navigationController: UINavigationController
    
    var root: UIViewController {
        return navigationController
    }
    
    init(root rootViewController: UIViewController) {
        navigationController = UINavigationController()
        navigationController.viewControllers = [rootViewController]
    }
    
    func popBack() {
        navigationController.popViewController(animated: true)
    }
    
    func performSegue(with identifier: String) {
        if identifier == "AddTodo" {
            let destination = TodoEditConfigurator.configure(withNavigationController: navigationController)
            navigationController.pushViewController(destination, animated: true)
        }
    }
    
}

protocol TodoListRouterInput {
    func popBack()
    func performSegue(with identifier: String)
}

