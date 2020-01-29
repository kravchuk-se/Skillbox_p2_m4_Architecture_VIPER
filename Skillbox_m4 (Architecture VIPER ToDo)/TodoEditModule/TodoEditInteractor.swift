//
//  TodoEditInteractor.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import RealmSwift

class TodoEditInteractor: TodoEditInteractorInput {
    weak var presenter: TodoEditInteractorOutput!
    func addNewItem(text: String) {
        
        let realm = try! Realm()
        try! realm.write {
            let newItem = ToDoRealm()
            newItem.text = text
            newItem.uuid = UUID().uuidString
            realm.add(newItem)
        }
        
        presenter.didAddNewItem()
    }
}

protocol TodoEditInteractorInput {
    func addNewItem(text: String)
}

protocol TodoEditInteractorOutput: class {
    func didAddNewItem()
}
