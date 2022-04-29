//
//  RegistrationViewController.swift
//  homework 18
//
//  Created by Volha Furs on 25.04.22.
//

import UIKit
import KeychainSwift

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var alreadyExistLabel: UILabel!
    @IBOutlet weak var createLoginLabel: UILabel!
    @IBOutlet weak var createPasswordLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let passwordKey = "passwordKey"
    let loginKey = "loginKey"
    let keychain = KeychainSwift()

    @IBOutlet weak var alreadyCreatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func transitToVC() {
    navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        if keychain.get(loginKey) == nil {
            guard let loginTextFieldFinal = loginTextField.text else{
            return
        }
        keychain.set(loginTextFieldFinal, forKey: loginKey)
        guard let passwordTextFieldFinal = passwordTextField.text else{
            return
        }
        keychain.set(passwordTextFieldFinal, forKey: passwordKey)
            transitToVC()} else {
                alreadyExistLabel.isHidden = false
            }
    }
}
