//
//  TodoEditRouter.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import UIKit

class TodoEditRouter: TodoEditRouterInput {
    var navigationController: UINavigationController!
    
    var root: UIViewController {
        navigationController.viewControllers.first!
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}

protocol TodoEditRouterInput {
    func pop()
}

protocol TodoEditRouterOutput {
    
}
