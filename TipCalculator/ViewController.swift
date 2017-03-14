//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nishant Mendiratta on 3/1/17.
//  Copyright © 2017 Nishant Mendiratta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var color: UIColor? = UIColor.white
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        billField.keyboardAppearance = .dark
        self.view.backgroundColor = color
    }

    
    // MARK: - IBActions
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18,0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)// "$\(tip)"
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func valueChangedSegmented(_ sender: Any) {
        calculateTip(sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "colorPicker", let destination = segue.destination as? SettingsViewController {
            destination.color = color
            destination.senderViewController = self
        }
    }
}

