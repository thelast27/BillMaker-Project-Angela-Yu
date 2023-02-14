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
    
    private var tip: Double = 0.10
    private var pctCurrentValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pctCurrentValue = "10"
    }
    
    @IBAction func tipPctChanged(_ sender: UIButton) {
        sumTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        
        guard let buttonTitle = sender.currentTitle else { return }
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        guard let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign) else { return }
        tip = buttonTitleAsANumber / 100
        pctCurrentValue = buttonTitleMinusPercentSign
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        spritNumberButton.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        guard let totalBil = Double(sumTextField.text ?? ""), let split = Double(spritNumberButton.text ?? ""), let pctValue = Double(pctCurrentValue ?? "") else { return }
        let result = Float((totalBil + tip) / split)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        vc.totalResult = result
        vc.totalPeople = Int(spritNumberButton.text ?? "")
        vc.totalPct = Double(pctValue)
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
}

