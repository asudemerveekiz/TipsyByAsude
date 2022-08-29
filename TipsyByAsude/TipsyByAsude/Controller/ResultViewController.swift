//
//  ResultViewController.swift
//  TipsyByAsude
//
//  Created by Asude Ekiz on 29.08.2022.
//

import UIKit

class ResultViewController: UIViewController {

    var totalPrice:String?
    var personNumber=0
    var tip=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=totalPrice
        settingsLabel.text="Split between \(personNumber) people, with \(tip)% tip."

    }
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  

}
