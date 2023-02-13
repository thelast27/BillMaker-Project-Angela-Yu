//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var spritNumberButton: UILabel!
    
    var tip = 0.10
    
    @IBAction func tipPctChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        guard let buttonTitle = sender.currentTitle else { return }
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        guard let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign) else { return }
        tip = buttonTitleAsANumber / 100
      
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

