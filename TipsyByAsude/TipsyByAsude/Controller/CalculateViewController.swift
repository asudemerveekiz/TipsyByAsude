//
//  ViewController.swift
//  TipsyByAsude
//
//  Created by Asude Ekiz on 28.08.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
 
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip=0.0
    var personNumber=0
    var bill=0.0
    var totalForPerson=""
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        clearSelectedState()
        sender.isSelected = true
        let selectedTip = sender.currentTitle ?? "0%"
        let selectedTipMinusPct = selectedTip.dropLast()
        let selectedTipAsNumber=Double(selectedTipMinusPct) ?? 0.0
        tip=selectedTipAsNumber / 100
        //print(tip)
        
    }
    
    
    @IBAction func enterTheBill(_ sender: UITextField) {
        let billAsString=billTextField.text ?? "0.0 "
        bill = Double(billAsString) ?? 0.0
        print("Total bill is: ",bill)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //print("personNumber:",personNumber)
        let billPlusTip = bill + (bill*tip)
        let totalForPersonAsDouble = billPlusTip/Double(personNumber)
        totalForPerson=String(format: "%.2f", totalForPersonAsDouble)
        print(totalForPerson)
        self.performSegue(withIdentifier: "goToResult", sender: self)
  
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue=1
        splitNumberLabel.text=String(format: "%.0f",sender.value)
        personNumber=Int(sender.value)
       
    }

    func clearSelectedState(){
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult" {
            let destinationVC=segue.destination as! ResultViewController
            destinationVC.totalPrice=totalForPerson
            destinationVC.tip=Int(tip*100)
            destinationVC.personNumber=personNumber
        }
    }

}
