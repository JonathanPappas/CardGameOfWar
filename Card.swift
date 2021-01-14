//
//  Card.swift
//  Arena10
//
//  Created by Jonathan Pappas on 1/14/21.
//

import Foundation


enum Suit: CaseIterable { case spade, heart, diamond, club }

struct Card: CustomStringConvertible {
    var description: String {
        var newNumber = String(number)
        if number == 1 { newNumber = "ace" }
        if number == 11 { newNumber = "jack" }
        if number == 12 { newNumber = "queen" }
        if number == 13 { newNumber = "king" }
        return "\(newNumber) of \(suit)s"
    }
    
    let suit: Suit
    let number: Int
    
    func equalTo(_ another: Card) -> Bool {
        return self.number == another.number
    }
    func lessThan(_ another: Card) -> Bool {
        return self.number < another.number
    }
}

struct Deck {
    var cards: [Card] = []
    static func Full() -> Deck {
        var myDeck = Deck()
        myDeck.cards = []
        for suit in Suit.allCases {
            for number in 1...13 {
                myDeck.cards.append(Card(suit: suit, number: number))
            }
        }
        myDeck.cards.shuffle()
        return myDeck
    }
    static func Empty() -> Deck {
        return Deck()
    }
    init() {}
    init(_ from: [Card]) {
        self.cards = from
    }
    
    mutating func drawTopCard() -> Card {
        cards.removeFirst()
    }
    
    mutating func drawTop(cards: Int, maximum: Int = .max) -> Self {
        let drawnCards = Deck(Array(self.cards.dropLast(self.cards.count - min(cards, maximum))))
        self.cards.removeFirst(min(cards, maximum))
        return drawnCards
    }
    
    mutating func gainCards(_ cards: [Card]) {
        self.cards += cards.shuffled()
    }
    
}
