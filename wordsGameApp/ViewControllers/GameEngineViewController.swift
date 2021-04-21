//
//  GameEngineViewController.swift
//  wordsGameApp
//
//  Created by Анна Голубева on 19.04.2021.
//

import UIKit

extension GameViewController {
    
    
    
    func doneButtonAction(from textField: String) {
        checkEmptyTF(textField: textField)
        guard checkLastCharacter(from: helpDescriptionLabel.text ?? "") else { return }
        guard checkTrueWord(from: textField) else { return }
        guard checkUsedWord(from: textField) else { return }
        guard checkCityExistance(from: textField) else { return }
        changeSetsOfWords(with: textField)
        changeTrueWord(with: textField)
        
    }
    
    func helpButtonAction(from textField: String) {
        
    }
    
    
    private func checkEmptyTF(textField: String) {
        if textField == "" {
            showAlert(title: "Пустое поле!", message: "Введите слово")
        }
    }
    
    
    private func checkLastCharacter(from actualWord: String) -> Bool {
        var lastCharacter = ""
        var changeIndexNumber = 0
        
        while lastCharacter == "" {
            changeIndexNumber += 1
            let index = actualWord.count - changeIndexNumber
            
            for char in category.characters {
                if char.uppercased() == String(Array(actualWord)[index]).uppercased() {
                    lastCharacter = String(Array(actualWord)[index]).uppercased()
                }
            }
        }
        category.actualCharacter = lastCharacter
        return lastCharacter != ""
    }
    
    
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
        for word in category.words {
            if word == typedWord {
                functionDone = true
                break
            }
        }
            
            if !functionDone {
                showAlert(title: "Такого слова нет!", message: "Подумайте еще.")
            }
        return functionDone
    }
    
    private func changeSetsOfWords(with typedWord: String) {
        category.words.remove(typedWord)
        category.usedWords.insert(typedWord)
    }
    
    private func changeTrueWord(with typedWord: String) {
        answerTextField.text = ""
        helpDescriptionLabel.text = typedWord
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
