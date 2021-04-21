//
//  Word.swift
//  wordsGameApp
//
//  Created by Сергей Косичкин on 19.04.2021.
//


struct Category {
    let word: String
    let description: String
    let category: Topic
    
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
