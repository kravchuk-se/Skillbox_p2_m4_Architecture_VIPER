//
//  TodoEditConfigurator.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import UIKit

struct TodoEditConfigurator {
    static func configure(withNavigationController navigationController: UINavigationController) -> UIViewController {
        let view = TodoEditViewController()
        let interactor = TodoEditInteractor()
        let presenter = TodoEditPresenter()
        let router = TodoEditRouter(navigationController: navigationController)
    
        view.presenter = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.router = router
        
        return view
    }
}
