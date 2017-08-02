//
//  Flashcards.swift
//  Flashcards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    var options : [String]
    var correctAnswer : String
    
    init( question : String, options : [String] ) {
        
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class cardCollection {
    public static var instance : cardCollection = cardCollection()
    public private(set) var cards : [Flashcard]
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get {return cards[currentIndex]}
    }
    
    private init() {
        cards = [ Flashcard(question: "Test Question", options: ["True", "False"]),
                  Flashcard(question: "Who developed Swift?", options: ["Apple", "Google", "Microsoft", "Facebook"] ),
                  Flashcard(question: "Who developed Windows?", options: ["Microsoft", "Google", "Apple", "Facebook"]),
                  Flashcard(question: "What is the name of California's technology hub?", options: ["Silicon Valley", "Silicon Mountain", "Techworld", "China"])]
        
        currentIndex = 0;
    }
    public func nextQuestion() {
        currentIndex += 1
        if (currentIndex >= cards.count) {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_selectedAnswer : Int) -> Bool {
        return currentCard.options[_selectedAnswer] == currentCard.correctAnswer
    }
}
