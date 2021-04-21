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
    @IBOutlet weak var lastAnswerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var changeModeButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var category = Category.getCategoryWord(from: DataManager.shared.cities,
                                            usedWords: [],
                                            description: "",
                                            category: DataManager.shared.topic,
                                            characters: DataManager.shared.approvedCharacters,
                                            actualCharacter: "",
                                            actualWord: DataManager.shared.cities.randomElement() ?? "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Mask Group")
        view.bringSubviewToFront(startButton)
        
        startButton.layer.cornerRadius = 18
        
        helpDescriptionLabel.isHidden.toggle()
        lastAnswerLabel.isHidden.toggle()
        
        

    }
    
    @IBAction func startButtonPressed() {
        doneButtonAction(from: answerTextField.text ?? "")
    }
    
    @IBAction func helpButtonPressed() {
        helpDescriptionLabel.isHidden = false
        helpButtonAction(from: answerTextField.text ?? "")
    }
}

// MARK: - Work with keyboard
extension GameViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == answerTextField {
            startButtonPressed()
        }
        return true
    }
}
