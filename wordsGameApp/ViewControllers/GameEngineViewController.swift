//
//  GameEngineViewController.swift
//  wordsGameApp
//
//  Created by Анна Голубева on 19.04.2021.
//

import UIKit

extension GameViewController {
    
    
    
    func doneButtonAction(from textField: String) {
        checkCategory()
        guard initialStart() else { return }
        checkEmptyTF(textField: textField)
        
        guard checkLastCharacter(from: lastAnswerLabel.text ?? "") else { return }
        //guard checkCharacterAvailability(from: textField) else { return }
        guard checkTrueWord(from: textField) else { return }
        guard checkUsedWord(from: textField) else { return }
        guard checkCityExistance(from: textField) else { return }
        
        changeSetsOfWords(with: textField)
        changeTrueWord(with: textField)
        lastCycleActions(with: textField)
        
    }
    
    func helpButtonAction(from textField: String) {
        checkCategoryForHelp()
        guard checkLastCharacter(from: lastAnswerLabel.text ?? "") else { return }
        changeSetsAfterCategories(with: lastAnswerLabel.text ?? "" )
        
        generateRandomWord()
        
    }
    
    func checkCategory() {
        if categorizedWords.isEmpty {
        if let categorized = allWords[mode] {
            categorizedWords = categorized
        }
        }
    }
    
    func checkCategoryForHelp() {
        if let categorized = allWords[mode] {
            categorizedWords = categorized
        }
    }
    
   func initialStart() -> Bool {
        var functionDone = true
        
        if lastAnswerLabel.text == "Город" {
            functionDone = false
            startButton.setTitle("Готово", for: .normal)
            
            lastAnswerLabel.text = categorizedWords[categorizedWords.keys.randomElement() ?? "A"]?.randomElement()
            category.usedWords.insert(helpDescriptionLabel.text ?? "")
            
            lastAnswerLabel.isHidden = false
            answerTextField.isHidden = false
            helpButton.isHidden = false
           
            //let _ = checkLastCharacter(from: lastAnswerLabel.text ?? "")
            if answerTextField.placeholder == nil{
            let _ = checkLastCharacter(from: lastAnswerLabel.text ?? "")
            answerTextField.placeholder = "Введите слово на букву \(category.actualCharacter)"
            }
        }
        return functionDone
    }
    
    private func checkEmptyTF(textField: String) {
        if textField == "" {
            showAlert(title: "Пустое поле!", message: "Введите слово")
        }
    }
    
    
    func checkLastCharacter(from actualWord: String) -> Bool {
        //print(categorizedWords.keys)
        var lastCharacter = ""
        var changeIndexNumber = 0
        
        while lastCharacter == "" {
            changeIndexNumber += 1
            let index = actualWord.count - changeIndexNumber
            if index >= 0 {
                for char in categorizedWords.keys {
                    if char.uppercased() == String(Array(actualWord)[index]).uppercased() {
                        lastCharacter = String(Array(actualWord)[index]).uppercased()
                    }
                }
                category.actualCharacter = lastCharacter
                
            } else {
                //lastCharacter = category.characters.randomElement() ?? ""
                showAlert(title: "Поздравляем🥳", message: "Вы выйграли!")
                
            }
        }
        
        return lastCharacter != ""
    }
    
//    func checkGameWin() {
//        if let _ = categorizedWords[category.actualCharacter] == nil {
//            
//        }
//    }
//    private func checkCharacterAvailability(from typedWord: String) -> Bool {
//        var functionDone = false
//
//        for word in category.words {
//            if word.first?.uppercased() == category.actualCharacter.uppercased() {
//                functionDone = true
//            }
//        }
//        if !functionDone {
//            category.characters.remove(category.actualCharacter.uppercased())
//            print(category.characters)
//            let _ = checkLastCharacter(from: lastAnswerLabel.text ?? "")
//            if !category.words.isEmpty {
//            let _ = checkCharacterAvailability(from: typedWord)
//            } else {
//                showAlert(title: "Победа!", message: "Все слова угаданы.")
//
//            }
//        }
//        return functionDone
//    }
    
    private func checkTrueWord(from typedWord: String) -> Bool {
        var functionDone = true
        
        if typedWord.first?.uppercased() != category.actualCharacter.uppercased() {
            showAlert(title: "Неверно!",
                      message: "Первая буква должна быть '\(category.actualCharacter)'.")
            functionDone = false
        }
        return functionDone
    }
    
    private func checkUsedWord(from typedWord: String) -> Bool {
        var functionDone = true
        for usedWord in category.usedWords {
            if usedWord == typedWord {
                functionDone = false
                showAlert(title: "Это слово уже было!", message: "Подумайте еще.")
                break
            }
        }
        
        return functionDone
    }
    
    
    private func checkCityExistance(from typedWord: String) -> Bool {
        var functionDone = false
        if let actualWords = categorizedWords[category.actualCharacter] {
        for word in actualWords  {
            if word == typedWord {
                functionDone = true
                break
            }
        }
        }
            
            if !functionDone {
                showAlert(title: "Такого слова нет!", message: "Подумайте еще.")
            }
        return functionDone
    }
    
   private func changeSetsOfWords(with typedWord: String) {
            if var set = categorizedWords[category.actualCharacter] {
                set.remove(category.actualWord)
                categorizedWords[category.actualCharacter] = set
            }
        
        category.usedWords.insert(typedWord)
    }
    
    func changeSetsAfterCategories(with typedWord: String) {
             if var set = categorizedWords[category.actualCharacter] {
                set.remove(lastAnswerLabel.text ?? "" )
                 categorizedWords[category.actualCharacter] = set
             }
         
        category.usedWords.insert(lastAnswerLabel.text ?? "" )
     }
    
    private func changeTrueWord(with typedWord: String) {
        answerTextField.text = ""
        lastAnswerLabel.text = typedWord
    }
    
    private func lastCycleActions(with typedWord: String) {
        let _ = checkLastCharacter(from: typedWord)
        answerTextField.placeholder = "Введите слово на букву \(category.actualCharacter)"
        helpDescriptionLabel.isHidden = true
        //let _ = checkCharacterAvailability(from: typedWord)
        
    }
    
    private func generateRandomWord() {
        helpDescriptionLabel.text = categorizedWords[category.actualCharacter]?.randomElement()
    }
}


extension GameViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in self.answerTextField.text = ""}
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}
