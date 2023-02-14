//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Eldar Garbuzov on 13.02.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalResult: Float?
    var totalPeople: Int?
    var totalPct: Double?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let result = totalResult, let peopleQty = totalPeople, let pctValue = totalPct else { return }
        
        totalLabel.text = String(result)
        settingsLabel.text = "Split between \(peopleQty) people, with \(pctValue)% tip."
   
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
