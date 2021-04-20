//
//  GameViewController.swift
//  wordsGameApp
//
//  Created by Сергей Косичкин on 19.04.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var helpDescriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var changeModeButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Mask Group")
        view.bringSubviewToFront(startButton)
        startButton.layer.cornerRadius = 18
        
        
    }
    
    @IBAction func startButtonPressed() {
    }
    
    @IBAction func helpButtonPressed() {
    }
}

