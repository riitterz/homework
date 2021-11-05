//
//  ViewController.swift
//  L2
//
//  Created by Macbook on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let login = loginInput.text!
    let password = passwordInput.text!
    if login == "admin" && password == "123456" {
        return true
    } else {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        return false
    }
}
func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    let checkResult = checkUserData()
    if !checkResult {
        showLoginError()
}
    return checkResult
}
func checkUserData() -> Bool {
    guard let login = loginInput.text,
          let password = passwordInput.text else { return false }
    if login == "admin" && password == "123456" {
        return true
    } else {
        return false
    }
}
func showLoginError() {
    let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alter.addAction(action)
    present(alter, animated: true, completion: nil)
}
