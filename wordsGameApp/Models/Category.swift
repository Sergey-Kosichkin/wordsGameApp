//
//  Word.swift
//  wordsGameApp
//
//  Created by Сергей Косичкин on 19.04.2021.
//


struct Category {
    var words: Set<String>
    var usedWords: Set<String>
    let description: String
    let category: Topic
    let characters: [String]
    var actualCharacter: String
    var actualWord: String
    
}

extension Category {
    static func getCategoryWord(from words: Set<String>,
                                usedWords: Set<String>,
                                description: String,
                                category: Topic,
                                characters: [String],
                                actualCharacter: String,
                                actualWord: String) -> Category {
        let category = Category(words: words,
                                usedWords: usedWords,
                                description: description,
                                category: category,
                                characters: characters,
                                actualCharacter: actualCharacter,
                                actualWord: actualWord)
        
        
        
        return category
    }
}
enum Topic: String{
    case City = "City"
    case Country = "Country"
    case Animal = "Animal"
}

//enum Word {
//    case Word
//    case Description
//}
