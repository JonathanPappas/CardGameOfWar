
```swift
//
//  main.swift
//  Arena10
//
//  Created by Jonathan Pappas on 1/13/21.
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
    
//    func drawTopCard() -> Card {
//        let drawnCard = cards.dropFirst()
//        cards.removeFirst()
//        return drawnCard
//    }
    
}

struct Game {
    var player1 = Deck.Empty()
    var player2 = Deck.Empty()
    var gameOver = false
    var rounds = 0
    var totalWars = 0
    
    init() {
        var deck = Deck.Full()
        player1 = Deck(Array(deck.cards.dropLast(26)))
        deck.cards.removeFirst(26)
        player2 = deck
    }
    
    mutating func round() {
        // if player1.cards.count + player2.cards.count != 52 {
        //     print("We have bugs")
        // }
        if player1.cards.count == 0 {
            //print("Player 2 Wins")
            gameOver = true
        } else if player2.cards.count == 0 {
            //print("Player 1 Wins")
            gameOver = true
        } else {
            reveal()
        }
        rounds += 1
    }
    
    mutating func reveal(_ potCards: [Card] = []) {
        if player1.cards.count == 0 || player2.cards.count == 0 { return }
        
        let player1RevealedCard = player1.cards.removeFirst()
        let player2RevealedCard = player2.cards.removeFirst()
        
        if player1.cards.count == 0 || player2.cards.count == 0 { return }
        
        if player1RevealedCard.equalTo(player2RevealedCard) {
            // special war time
            numOfWars += 1
            war([player1RevealedCard, player2RevealedCard] + potCards)
        } else if player1RevealedCard.lessThan(player2RevealedCard) {
            // player 2 won
            player2.cards += ([player1RevealedCard, player2RevealedCard] + potCards).shuffled()
        } else {
            // player 1 won
            player1.cards += ([player1RevealedCard, player2RevealedCard] + potCards).shuffled()
        }
    }
    
    mutating func war(_ potCards: [Card]) {
        let dontRevealTooMany = min(3, player1.cards.count - 1)
        var player1Mystery3Cards: [Card] = []
        for i in 0..<dontRevealTooMany {
            player1Mystery3Cards.append(player1.cards[i])
        }
        player1.cards.removeFirst(dontRevealTooMany)
        
        let dontRevealTooMany2 = min(3, player2.cards.count - 1)
        var player2Mystery3Cards: [Card] = []
        for i in 0..<dontRevealTooMany2 {
            player2Mystery3Cards.append(player2.cards[i])
        }
        player2.cards.removeFirst(dontRevealTooMany2)
        
        reveal(player1Mystery3Cards + player2Mystery3Cards + potCards)
    }
    
    
}


var numOfRounds = 0
var numOfWars = 0

for i in 1...10000 {
    //print("Game \(numOfRounds.count)")
    var game = Game()
    while !game.gameOver {
        game.round()
    }
    //print("Rounds: \(game.rounds)")
    //print("Player 1 Cards Left: \(game.player1.cards.count)")
    //print("Player 2 Cards Left: \(game.player2.cards.count)")
    numOfRounds += game.rounds
    numOfWars += game.totalWars
}

print("Average Rounds: \(numOfRounds / 10000)")
print("Average War Ties: \(numOfWars / 10000)")


//let myDeck = Deck()
//print(myDeck)
//print(myDeck.cards.count)

//let myCard = Card.init(suit: .spade, number: 10)
```
