//
//  DictionaryManager.swift
//  wordsGameApp
//
//  Created by Сергей Косичкин on 23.04.2021.
//

import Foundation

class DictionaryManager {
    static let shared = DictionaryManager()
    
    var categories: [String: [Topic: String]] = [:]
    
    private init() {}
}
