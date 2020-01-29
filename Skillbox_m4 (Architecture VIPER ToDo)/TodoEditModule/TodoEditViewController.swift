//
//  TodoEditViewController.swift
//  Skillbox_m4 (Architecture VIPER ToDo)
//
//  Created by Kravchuk Sergey on 18.01.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import UIKit

class TodoEditViewController: UIViewController {

    var textField: UITextField!
    
    var presenter: TodoEditPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
        textField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear()
    }
    
    func setupSubviews() {
        
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

}

extension TodoEditViewController: TodoEditPresenterOutput {
    func beginEditing() {
        textField.becomeFirstResponder()
    }
    
    func endEditing() {
        textField.resignFirstResponder()
    }
}


extension TodoEditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if presenter.shouldDoneEditing(todo: textField.text) {
            endEditing()
            presenter.doneEditing(todo: textField.text!)
        }
        return true
    }
}
