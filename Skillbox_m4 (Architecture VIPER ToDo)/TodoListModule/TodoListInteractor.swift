//
//  TodoListInteractor.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import RealmSwift

class TodoListInteractor: TodoListInteractorInput {
    weak var presenter: TodoListInteractorOutput!
    
    func loadTodoItems() {
        sendDataUpdate()
    }
    func deleteItem(_ item: ToDo) {
        let realm = try! Realm()
        if let obj = realm.objects(ToDoRealm.self).first(where: { $0.uuid == item.id.uuidString }) {
            try! realm.write {
                realm.delete(obj)
            }
        }
        sendDataUpdate()
    }
    private func sendDataUpdate() {
        let realm = try! Realm()
        let results: [ToDo] = realm.objects(ToDoRealm.self).map{ $0.presentation }
        presenter.todoItemsLoaded(items: results)
    }
}

protocol TodoListInteractorInput {
    func loadTodoItems()
    func deleteItem(_ item: ToDo)
}

protocol TodoListInteractorOutput: class {
    func todoItemsLoaded(items: [ToDo])
}
