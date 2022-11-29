//
//  ViewController.swift
//  homework 18
//
//  Created by Volha Furs on 22.04.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func transitToImageVC() {
        let storyboard = UIStoryboard(name: "ImagesViewController", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! ImagesViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onNextButton(_ sender: Any) {
        transitToImageVC()
    }
    
}

