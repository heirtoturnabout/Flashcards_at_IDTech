//
//  Flashcards.swift
//  Flashcards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question : String
    var options : [String]
    var correctAnswer : String
    
    init( question : String, options : [String] ) {
        
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
        
        self.options = shuffle (list: options)
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
        cards = [ Flashcard(question: "You're playing this game on an iPhone!", options: ["True", "False"]),
                  Flashcard(question: "Who developed Swift?", options: ["Apple", "Google", "Microsoft", "Facebook"] ),
                  Flashcard(question: "Who developed Windows?", options: ["Microsoft", "Google", "Apple", "Facebook"]),
                  Flashcard(question: "Who developed Linux?", options: ["Linus Torvalds", "Bill Gates", "Steve Jobs", "Jeff Bezos"])]
        
        currentIndex = 0;
        
        cards = shuffle(list: cards)
    }
    public func nextQuestion() {
        currentIndex += 1
        if (currentIndex >= cards.count) {
            currentIndex = 0
            cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)
    }
    
    public func checkAnswer(_selectedAnswer : Int) -> Bool {
        return currentCard.options[_selectedAnswer] == currentCard.correctAnswer
    }
}

func shuffle<T>(list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
