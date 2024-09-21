//
//  ViewController.swift
//  Lab2
//
//  Created by Shangwe Nyota on 9/20/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hapinessTextField: UITextField!
    
    @IBOutlet weak var foodLevelTextField: UITextField!
    @IBOutlet weak var fedTextField: UITextField!
    @IBOutlet weak var playedTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fedTextField.textAlignment = .right;
        fedTextField.borderStyle = .none;
        playedTextField.textAlignment = .right;
        playedTextField.borderStyle = .none;
        hapinessTextField.borderStyle = .none;
        foodLevelTextField.borderStyle = .none;
        
    }


}

