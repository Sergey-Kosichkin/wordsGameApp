//
//  SettingsViewController.swift
//  wordsGameApp
//
//  Created by Анна Голубева on 20.04.2021.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    private var sections = ["Cities", "Countries", "Animals", "Random mode"]
    
    var modeButton: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Selected mode") as! SwitchTableViewCell
        
        cell.textLabel?.text = sections[indexPath.row]
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        
        return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch!) {
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
        //        self.label.text = sender.on ? "On" : "Off"
        //        if sender.isOn {
        //
        //        } else {
        //    }
        
        
    }
}
