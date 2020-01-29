//
//  TodoListPresenter.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation

class TodoListPresenter: TodoListInteractorOutput, TodoListPresenterInput {
    
    weak var view: TodoListPresenterOutput!
    var interactor: TodoListInteractorInput!
    var router: TodoListRouterInput?
    
    private (set) var todoItems: [ToDo] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    func loadData() {
        interactor.loadTodoItems()
    }
    
    func todoItemsLoaded(items: [ToDo]) {
        self.todoItems = items
    }
    
    func addNewItemTapped() {
        router?.performSegue(with: "AddTodo")
    }
    
    func todoItemTapped(at index: Int) {
        interactor.deleteItem(todoItems.remove(at: index))
    }
    func viewDidAppear() {
        interactor.loadTodoItems()
    }
}

protocol TodoListPresenterInput {
    var todoItems: [ToDo] { get }
    func addNewItemTapped()
    func loadData()
    func todoItemTapped(at index: Int)
    func viewDidAppear()
}

protocol TodoListPresenterOutput: class {
    func reloadData()
}
