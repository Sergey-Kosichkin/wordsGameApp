//
//  ChangeModeViewController.swift
//  wordsGameApp
//
//  Created by Анна Голубева on 25.04.2021.
//

import UIKit

class ChangeModeViewController: UIViewController {
    
    @IBOutlet weak var citiesSwitch: UISwitch!
    @IBOutlet weak var countriesSwitch: UISwitch!
    @IBOutlet weak var animalsSwitch: UISwitch!
    
    var citiesMode: Topic!
    var countriesMode: Topic!
    var animalsMode: Topic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesSwitch.isOn = Bool(citiesMode.rawValue) ?? true
        countriesSwitch.isOn = Bool(countriesMode.rawValue) ?? false
        animalsSwitch.isOn = Bool(animalsMode.rawValue) ?? false
        
    }
    
    @IBAction func switchChanged() {
        if citiesSwitch.isOn {
            countriesSwitch.setOn(false, animated: true)
            animalsSwitch.setOn(false, animated: true)
        } else if countriesSwitch.isOn {
            citiesSwitch.setOn(false, animated: true)
            animalsSwitch.setOn(false, animated: true)
        } else if animalsSwitch.isOn {
            citiesSwitch.setOn(false, animated: true)
            countriesSwitch.setOn(false, animated: true)
        }
    }
}


