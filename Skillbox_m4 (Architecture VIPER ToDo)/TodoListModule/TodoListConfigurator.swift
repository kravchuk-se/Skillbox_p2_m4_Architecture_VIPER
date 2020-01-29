//
//  TodoListConfigurator.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import UIKit

struct TodoListConfigurator {
    static func configure() -> UIViewController {
        
        let view = TodoListViewController()
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        let router = TodoListRouter(root: view)
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.router = router
        
        return router.root
    }
}
