//
//  CardGame.swift
//  CMP430-Final
//
//  Created by Artjola Meli on 12/14/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import Foundation
struct CardGame {
    var deck = PlayingCardDeck.init()
    var cards = [PlayingCard]()
    var playerScore = 0
    var computerScore = 0
    var balance = 100
    var bet = 0
    var playerCards = [PlayingCard]()
    var computerCards = [PlayingCard]()
    var gameLbl = ""
    
    
    init() {
        newGame()
    }
    
    mutating func newGame() {
        playerScore = 0
        computerScore = 0
        balance = 100
        bet = 0
        cards = deck.cards
        cards.shuffle()
    }
    
    private mutating func addPlayerCard()
    {
        let randomInt = Int.random(in: 0..<cards.count)
        let selectedCard = cards.remove(at: randomInt)
        
        playerCards.append(selectedCard)
        
    }
    
    private mutating func addComputerCard() {
        let randomInt = Int.random(in: 0..<cards.count)
        let selectedCard = cards.remove(at: randomInt)
        
        computerCards.append(selectedCard)
    }
    
    
    mutating func addPCards(cardToAddd numberOfCards: Int) { //adding cards for the player
        for _ in 0..<numberOfCards {
            addPlayerCard()
        }
    }
    
    mutating func addCCards(cardToAddd numberOfCards: Int) {  //adding cards for the computer
        for _ in 0..<numberOfCards {
            addComputerCard()
        }
    }
    
    mutating func calculateP() {   //calculating players scores
        for index in playerCards.indices{
            
            playerScore += playerCards[index].rank.order
            
            if playerCards[index].suit == "♠️"{
                self.playerScore += 4
            }
            if playerCards[index].suit == "❤️"{
                self.playerScore += 3
            }
            if playerCards[index].suit ==  "♦️"{
                self.playerScore += 2
            }
            if playerCards[index].suit == "♣️"{
                self.playerScore += 1
            }
        }
    }
    
    mutating func calculateC() {   //calculating computer scores
        if computerCards.count >= 3, playerCards.count >= 3 {
            for index in computerCards.indices {
                 computerScore += computerCards[index].rank.order
                if computerCards[index].suit == "♠️" {
                    self.computerScore += 4
                }
                if computerCards[index].suit == "❤️" {
                    self.computerScore += 3
                }
                if computerCards[index].suit ==  "♦️" {
                    self.computerScore += 2
                }
                if computerCards[index].suit == "♣️" {
                     self.computerScore += 1
                }
            }
            
            for index in playerCards.indices {
                
                playerScore += playerCards[index].rank.order
                
                if playerCards[index].suit == "♠️" {
                    self.playerScore += 4
                }
                if playerCards[index].suit == "❤️" {
                    self.playerScore += 3
                }
                if playerCards[index].suit ==  "♦️" {
                    self.playerScore += 2
                }
                if playerCards[index].suit == "♣️" {
                    self.playerScore += 1
                }
            }
            
            if playerScore > computerScore {
                if playerScore == computerScore {
                    balance += bet
                    gameLbl = "You Won + \(bet)..."
                }
            }
            if playerScore > computerScore {
                balance += bet
                gameLbl = "You Won + \(bet)..."
            }
            
            if computerScore > playerScore {
                balance -= bet
                 gameLbl = "You Lost - \(bet)..."
            }
        }
    }
}
