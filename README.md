# CardGameOfWar
On average, how long does war take? (2 player game?)
 - Average Rounds Per Game: 274
 - Average War Ties Per Game: 17
 
 ```swift
func warometer(totalPlayers: Int, rounds: Int) {
    var numOfRounds = 0
    var numOfWars = 0
    var numOfNobodyWon = 0
    var numOfTrashedCards = 0

    for _ in 1...rounds {
        var game = Game(totalPlayers: totalPlayers, decks: 1)
        while !game.gameOver {
            game.round()
        }
        numOfRounds += game.rounds
        numOfWars += game.totalWars
        numOfNobodyWon += game.nobodyWon ? 1 : 0
        numOfTrashedCards += game.trashedCards
    }

    print("Players: \(totalPlayers)")
    print("Average Rounds Per Game: \(numOfRounds / rounds)")
    print("Average War Ties Per Game: \(numOfWars / rounds)")
    print("Average Nobody Wins: \(numOfNobodyWon) in \(rounds)")
    print("Average Trashed Cards Per Game: \(Double(numOfTrashedCards) / Double(rounds))")
    print("–––––")
}

for i in 1...52 {
    warometer(totalPlayers: i, rounds: 10000)
}

// With a regular 52 deck, war is only good for 2-25 people to play
// These games on average last 100+ rounds
```

# 10_000 Games of War

```
1 Deck, n Players
 - Trashed Cards are when two or more players initiate a war (because maybe they all played an Ace card), but also have all run out of cards. So then who wins the cards? Nobody, the cards are out of play for the remainder of the game.

Players: 1
Average Rounds Per Game: 0
Average War Ties Per Game: 0
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.0
–––––
Players: 2
Average Rounds Per Game: 274
Average War Ties Per Game: 17
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.0
–––––
Players: 3
Average Rounds Per Game: 286
Average War Ties Per Game: 19
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.0014
–––––
Players: 4
Average Rounds Per Game: 290
Average War Ties Per Game: 20
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.0195
–––––
Players: 5
Average Rounds Per Game: 290
Average War Ties Per Game: 21
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.061
–––––
Players: 6
Average Rounds Per Game: 281
Average War Ties Per Game: 20
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.1208
–––––
Players: 7
Average Rounds Per Game: 283
Average War Ties Per Game: 21
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.2917
–––––
Players: 8
Average Rounds Per Game: 279
Average War Ties Per Game: 20
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.4356
–––––
Players: 9
Average Rounds Per Game: 280
Average War Ties Per Game: 20
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 0.7855
–––––
Players: 10
Average Rounds Per Game: 269
Average War Ties Per Game: 20
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 1.3491
–––––
Players: 11
Average Rounds Per Game: 266
Average War Ties Per Game: 19
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 1.6141
–––––
Players: 12
Average Rounds Per Game: 266
Average War Ties Per Game: 19
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 1.8467
–––––
Players: 13
Average Rounds Per Game: 245
Average War Ties Per Game: 18
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 3.4348
–––––
Players: 14
Average Rounds Per Game: 252
Average War Ties Per Game: 18
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 2.6709
–––––
Players: 15
Average Rounds Per Game: 246
Average War Ties Per Game: 18
Average Nobody Wins: 1 in 10000
Average Trashed Cards Per Game: 2.8501
–––––
Players: 16
Average Rounds Per Game: 236
Average War Ties Per Game: 17
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 3.8289
–––––
Players: 17
Average Rounds Per Game: 212
Average War Ties Per Game: 15
Average Nobody Wins: 1 in 10000
Average Trashed Cards Per Game: 6.1918
–––––
Players: 18
Average Rounds Per Game: 207
Average War Ties Per Game: 15
Average Nobody Wins: 1 in 10000
Average Trashed Cards Per Game: 6.3747
–––––
Players: 19
Average Rounds Per Game: 213
Average War Ties Per Game: 15
Average Nobody Wins: 5 in 10000
Average Trashed Cards Per Game: 5.6857
–––––
Players: 20
Average Rounds Per Game: 216
Average War Ties Per Game: 15
Average Nobody Wins: 18 in 10000
Average Trashed Cards Per Game: 5.2405
–––––
Players: 21
Average Rounds Per Game: 212
Average War Ties Per Game: 15
Average Nobody Wins: 10 in 10000
Average Trashed Cards Per Game: 5.5072
–––––
Players: 22
Average Rounds Per Game: 198
Average War Ties Per Game: 14
Average Nobody Wins: 17 in 10000
Average Trashed Cards Per Game: 6.4852
–––––
Players: 23
Average Rounds Per Game: 181
Average War Ties Per Game: 13
Average Nobody Wins: 20 in 10000
Average Trashed Cards Per Game: 7.8825
–––––
Players: 24
Average Rounds Per Game: 153
Average War Ties Per Game: 11
Average Nobody Wins: 15 in 10000
Average Trashed Cards Per Game: 10.4593
–––––
Players: 25
Average Rounds Per Game: 117
Average War Ties Per Game: 8
Average Nobody Wins: 14 in 10000
Average Trashed Cards Per Game: 13.5216
–––––
Players: 26
Average Rounds Per Game: 67
Average War Ties Per Game: 5
Average Nobody Wins: 287 in 10000
Average Trashed Cards Per Game: 17.072
–––––
Players: 27
Average Rounds Per Game: 70
Average War Ties Per Game: 5
Average Nobody Wins: 255 in 10000
Average Trashed Cards Per Game: 16.223
–––––
Players: 28
Average Rounds Per Game: 73
Average War Ties Per Game: 6
Average Nobody Wins: 305 in 10000
Average Trashed Cards Per Game: 15.5034
–––––
Players: 29
Average Rounds Per Game: 76
Average War Ties Per Game: 6
Average Nobody Wins: 352 in 10000
Average Trashed Cards Per Game: 14.6912
–––––
Players: 30
Average Rounds Per Game: 79
Average War Ties Per Game: 6
Average Nobody Wins: 444 in 10000
Average Trashed Cards Per Game: 14.1037
–––––
Players: 31
Average Rounds Per Game: 81
Average War Ties Per Game: 6
Average Nobody Wins: 561 in 10000
Average Trashed Cards Per Game: 14.0304
–––––
Players: 32
Average Rounds Per Game: 86
Average War Ties Per Game: 6
Average Nobody Wins: 592 in 10000
Average Trashed Cards Per Game: 13.1025
–––––
Players: 33
Average Rounds Per Game: 88
Average War Ties Per Game: 6
Average Nobody Wins: 712 in 10000
Average Trashed Cards Per Game: 13.048
–––––
Players: 34
Average Rounds Per Game: 87
Average War Ties Per Game: 6
Average Nobody Wins: 892 in 10000
Average Trashed Cards Per Game: 13.3849
–––––
Players: 35
Average Rounds Per Game: 84
Average War Ties Per Game: 6
Average Nobody Wins: 910 in 10000
Average Trashed Cards Per Game: 13.449
–––––
Players: 36
Average Rounds Per Game: 85
Average War Ties Per Game: 6
Average Nobody Wins: 1018 in 10000
Average Trashed Cards Per Game: 13.7137
–––––
Players: 37
Average Rounds Per Game: 81
Average War Ties Per Game: 6
Average Nobody Wins: 1053 in 10000
Average Trashed Cards Per Game: 14.0868
–––––
Players: 38
Average Rounds Per Game: 83
Average War Ties Per Game: 6
Average Nobody Wins: 1128 in 10000
Average Trashed Cards Per Game: 14.4403
–––––
Players: 39
Average Rounds Per Game: 74
Average War Ties Per Game: 5
Average Nobody Wins: 1257 in 10000
Average Trashed Cards Per Game: 16.2296
–––––
Players: 40
Average Rounds Per Game: 70
Average War Ties Per Game: 5
Average Nobody Wins: 1211 in 10000
Average Trashed Cards Per Game: 16.9877
–––––
Players: 41
Average Rounds Per Game: 65
Average War Ties Per Game: 5
Average Nobody Wins: 1286 in 10000
Average Trashed Cards Per Game: 18.2561
–––––
Players: 42
Average Rounds Per Game: 59
Average War Ties Per Game: 4
Average Nobody Wins: 1208 in 10000
Average Trashed Cards Per Game: 19.5539
–––––
Players: 43
Average Rounds Per Game: 52
Average War Ties Per Game: 4
Average Nobody Wins: 1257 in 10000
Average Trashed Cards Per Game: 21.5667
–––––
Players: 44
Average Rounds Per Game: 44
Average War Ties Per Game: 3
Average Nobody Wins: 1173 in 10000
Average Trashed Cards Per Game: 23.7144
–––––
Players: 45
Average Rounds Per Game: 35
Average War Ties Per Game: 3
Average Nobody Wins: 1166 in 10000
Average Trashed Cards Per Game: 26.0159
–––––
Players: 46
Average Rounds Per Game: 30
Average War Ties Per Game: 2
Average Nobody Wins: 1063 in 10000
Average Trashed Cards Per Game: 28.5206
–––––
Players: 47
Average Rounds Per Game: 23
Average War Ties Per Game: 2
Average Nobody Wins: 978 in 10000
Average Trashed Cards Per Game: 31.5342
–––––
Players: 48
Average Rounds Per Game: 15
Average War Ties Per Game: 1
Average Nobody Wins: 839 in 10000
Average Trashed Cards Per Game: 35.1592
–––––
Players: 49
Average Rounds Per Game: 10
Average War Ties Per Game: 1
Average Nobody Wins: 686 in 10000
Average Trashed Cards Per Game: 38.9309
–––––
Players: 50
Average Rounds Per Game: 4
Average War Ties Per Game: 1
Average Nobody Wins: 518 in 10000
Average Trashed Cards Per Game: 42.7186
–––––
Players: 51
Average Rounds Per Game: 1
Average War Ties Per Game: 1
Average Nobody Wins: 0 in 10000
Average Trashed Cards Per Game: 46.8129
–––––
Players: 52
Average Rounds Per Game: 1
Average War Ties Per Game: 1
Average Nobody Wins: 10000 in 10000
Average Trashed Cards Per Game: 52.0
–––––
```
