//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Nishant Mendiratta on 3/13/17.
//  Copyright © 2017 Nishant Mendiratta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    var color : UIColor?
    var pickerDataSource = ["White", "Red", "Green", "Blue"];
    var senderViewController: ViewController?
    @IBOutlet weak var colorPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK : - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    // MARK : - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0) {
            self.view.backgroundColor = UIColor.white
            senderViewController?.color = UIColor.white
        } else if(row == 1) {
            self.view.backgroundColor = UIColor.red
            senderViewController?.color = UIColor.red
        } else if(row == 2) {
            self.view.backgroundColor =  UIColor.green
            senderViewController?.color = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.blue
            senderViewController?.color = UIColor.blue
        }
    }
}
