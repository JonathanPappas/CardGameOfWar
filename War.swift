
struct Game {
    var players: [Int:Deck] = [:]
    var gameOver = false
    var rounds = 0
    var totalWars = 0
    var nobodyWon = false
    var trashedCards = 0
    
    init(totalPlayers: Int, decks: Int = 1) {
        var deck = Deck.Full()
        for _ in 1..<decks {
            deck.gainCards(Deck.Full().cards)
        }
        
        // Give all players an Empty hand
        for i in 1...totalPlayers { players[i] = Deck.Empty() }
        
        // Deal all cards to players
        deal: while true {
            for i in 1...totalPlayers {
                if deck.cards.isEmpty { break deal }
                players[i]?.gainCards([deck.drawTopCard()])
            }
        }
    }
    
    mutating func round() {
        if checkForGameOver() { return }
        reveal(Array(players.keys))
        rounds += 1
    }
    
    @discardableResult
    mutating func checkForGameOver() -> Bool {
        // Remove all players with 0 cards
        players = players.filter { !$0.value.cards.isEmpty }
        if players.count < 2 {
            gameOver = true;
            if players.isEmpty { nobodyWon = true }
            return true
        }; return false
    }
    
    mutating func reveal(_ currentPlayers: [Int], pot: [Card] = []) {
        if checkForGameOver() { return }
        
        // All players reveal their top card! (Remember winners)
        var highestPlayers: [(name: Int, card: Card)] = []
        var lostPlayers: [(Int, card: Card)] = []
        for player in currentPlayers {
            let reveal = (player, card: players[player]!.drawTopCard())
            
            if let highestChoice = highestPlayers.first {
                if highestChoice.card.equalTo(reveal.card) {
                    highestPlayers.append(reveal)
                } else if highestChoice.card.lessThan(reveal.card) {
                    lostPlayers += highestPlayers
                    highestPlayers = [reveal]
                } else {
                    lostPlayers.append(reveal)
                }
            } else {
                highestPlayers.append(reveal)
            }
        }
        
        let newPotCards = highestPlayers.reduce([Card]()) { $0 + [$1.card] } + lostPlayers.reduce([Card]()) { $0 + [$1.card] } + pot
        
        if highestPlayers.count == 1, let highestPlayer = highestPlayers.first {
            players[highestPlayer.name]?.gainCards(newPotCards)
        } else {
            totalWars += 1
            war(pot: newPotCards, topPlayers: highestPlayers.reduce([Int]()) { $0 + [$1.name] })
        }
    }
    
    mutating func war(pot: [Card], topPlayers: [Int]) {
        checkForGameOver()
        var newTopPlayers = [Int]()
        
        var newPot = Deck.Empty()
        for player in topPlayers {
            if let _ = players[player] {
                newTopPlayers.append(player)
                newPot.gainCards(players[player]!.drawTop(cards: 3, maximum: players[player]!.cards.count - 1).cards)
            }
        }
        
        if newTopPlayers.isEmpty {
            trashedCards += (newPot.cards + pot).count
            // print("All Tied Players Ran out of cards") // no one wins the pot (sadly?)
        } else if newTopPlayers.count == 1 {
            players[newTopPlayers[0]]?.gainCards(newPot.cards + pot)
        } else {
            reveal(newTopPlayers, pot: newPot.cards + pot)
        }
    }
    
}
