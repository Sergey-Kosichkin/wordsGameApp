//
//  GameViewController.swift
//  wordsGameApp
//
//  Created by Сергей Косичкин on 19.04.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var gameDescriptionLabel: UILabel!
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
    
    var allWords = DataManager.shared.fullCategories
    var mode: Topic = .City
    var categorizedWords: [String: Set<String>] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Mask Group")
        view.bringSubviewToFront(startButton)
        
        startButton.layer.cornerRadius = 18
        
        helpDescriptionLabel.isHidden = true
        lastAnswerLabel.isHidden = true
        answerTextField.isHidden = true
        helpButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let changeModeVC = segue.destination as? ChangeModeViewController else { return }
//        changeModeVC.citiesMode = Topic.City
//        changeModeVC.countriesMode = Topic.Country
//        changeModeVC.animalsMode = Topic.Animal
        changeModeVC.mode = mode
    }
    
    @IBAction func startButtonPressed() {
        gameDescriptionLabel.isHidden = true
        doneButtonAction(from: answerTextField.text ?? "")
    }
    
    @IBAction func helpButtonPressed() {
        helpButtonAction(from: answerTextField.text ?? "")
        helpDescriptionLabel.isHidden = false
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let changeModeVC = segue.source as? ChangeModeViewController else { return }
        if changeModeVC.citiesSwitch.isOn {
            changeModeButton.setTitle("Города ▼", for: .normal)
            backgroundImage.image = UIImage(named: "Mask Group")
        } else if changeModeVC.countriesSwitch.isOn {
            changeModeButton.setTitle("Страны ▼", for: .normal)
            backgroundImage.image = UIImage(named: "Mask Group3")
        } else if changeModeVC.animalsSwitch.isOn {
            changeModeButton.setTitle("Животные ▼", for: .normal)
            backgroundImage.image = UIImage(named: "Mask Group2")
        }
        self.mode = changeModeVC.mode
        lastAnswerLabel.text = "Город"
        checkCategoryForHelp()
        let _ = initialStart()
        helpDescriptionLabel.isHidden = true
        changeSetsAfterCategories(with: lastAnswerLabel.text ?? "" )
        let _ = checkLastCharacter(from: lastAnswerLabel.text ?? "" )
        gameDescriptionLabel.isHidden = true
        answerTextField.placeholder = "Введите слово на букву \(category.actualCharacter)"
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
