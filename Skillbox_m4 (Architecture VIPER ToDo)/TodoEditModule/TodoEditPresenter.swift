//
//  TodoEditPresenter.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation

class TodoEditPresenter: TodoEditPresenterInput, TodoEditInteractorOutput {

    weak var view: TodoEditPresenterOutput!
    var interactor: TodoEditInteractorInput!
    var router: TodoEditRouterInput!
    
    
    func viewDidAppear() {
        view.beginEditing()
    }
    
    func shouldDoneEditing(todo: String?) -> Bool {
        return !(todo ?? "").isEmpty
    }
    
    func doneEditing(todo: String) {
        interactor.addNewItem(text: todo)
    }
    
    func didAddNewItem() {
        router.pop()
    }
    
}

protocol TodoEditPresenterInput {
    func viewDidAppear()
    func shouldDoneEditing(todo: String?) -> Bool
    func doneEditing(todo: String)
}

protocol TodoEditPresenterOutput: class {
    func beginEditing()
    func endEditing()
}
