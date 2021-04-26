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
    
    var mode: Topic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeSwitches(for: mode)
    }
    
    
    @IBAction func citiesSwitchChanged() {
        countriesSwitch.setOn(false, animated: true)
        animalsSwitch.setOn(false, animated: true)
        mode = .City
    }
    
    @IBAction func countriesSwitchChanged() {
        citiesSwitch.setOn(false, animated: true)
        animalsSwitch.setOn(false, animated: true)
        mode = .Country
    }
    
    @IBAction func animalsSwitchChanged() {
        citiesSwitch.setOn(false, animated: true)
        countriesSwitch.setOn(false, animated: true)
        mode = .Animal
    }
    
    private func changeSwitches(for mode: Topic) {
        if mode == .City {
            citiesSwitch.isOn = true
            countriesSwitch.isOn = false
            animalsSwitch.isOn = false
        } else if mode == .Country {
            countriesSwitch.isOn = true
            citiesSwitch.isOn = false
            animalsSwitch.isOn = false
        } else if mode == .Animal {
            animalsSwitch.isOn = true
            citiesSwitch.isOn = false
            countriesSwitch.isOn = false
        }
    }
}


