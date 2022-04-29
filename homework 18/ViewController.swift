//
//  ViewController.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var enterYourLoginLabel: UILabel!
    @IBOutlet weak var enterYourPasswordLabel: UILabel!
    @IBOutlet weak var incorrectDataLabel: UILabel!

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var onNextButton: UIButton!
    
    let passwordKey = "passwordKey"
    let loginKey = "loginKey"
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func transitToImageVC() {
        let storyboard = UIStoryboard(name: "ImagesViewController", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! ImagesViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func transitToRegistrationVC() {
        let storyboard = UIStoryboard(name: "RegistrationViewController", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! RegistrationViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onRegistrationButton(_ sender: Any) {
        transitToRegistrationVC()
    }
    
    @IBAction func onEnterButton(_ sender: Any) {
        enterYourLoginLabel.isHidden = false
        enterYourPasswordLabel.isHidden = false
        loginTextField.isHidden = false
        passwordTextField.isHidden = false
        onNextButton.isEnabled = true
    }

    @IBAction func onNextButton(_ sender: Any) {
        guard let loginTextFieldFinal = loginTextField.text else{
        return
    }
        guard let passwordTextFieldFinal = passwordTextField.text else{
        return
    }
        if keychain.get(loginKey) == nil || keychain.get(loginKey) != loginTextFieldFinal || keychain.get(passwordKey) == nil || keychain.get(passwordKey) != passwordTextFieldFinal {
            incorrectDataLabel.isHidden = false
        } else {
        transitToImageVC()
        }
    }
}

