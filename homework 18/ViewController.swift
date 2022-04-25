//
//  ViewController.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    @IBOutlet weak var EnterYourLoginLabel: UILabel!
    @IBOutlet weak var EnterYourPasswordLabel: UILabel!
    @IBOutlet weak var IncorrectdataLabel: UILabel!
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var onNextButton: UIButton!
    
    let passwordKey = "passwordKey"
    let loginKey = "loginKey"
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        EnterYourLoginLabel.isHidden = false
        EnterYourPasswordLabel.isHidden = false
        LoginTextField.isHidden = false
        PasswordTextField.isHidden = false
        onNextButton.isEnabled = true
    }

    @IBAction func onNextButton(_ sender: Any) {
        
        guard let loginTextFieldFinal = LoginTextField.text else{
        return
    }
        guard let passwordTextFieldFinal = PasswordTextField.text else{
        return
    }
        if keychain.get(loginKey) == nil || keychain.get(loginKey) != loginTextFieldFinal || keychain.get(passwordKey) == nil || keychain.get(passwordKey) != passwordTextFieldFinal {
            IncorrectdataLabel.isHidden = false
        } else {
        transitToImageVC()
        }
    }
}

