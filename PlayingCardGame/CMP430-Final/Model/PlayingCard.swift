//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Sameh on 10/15/18.
//  Copyright © 2018 Sameh. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {

    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit: String
    var rank: Rank
    var isFaceUp : Bool
    
    enum Suit: String {
        case clubs    = "♣️"
        case diamonds = "♦️"
        case hearts   = "❤️"
        case spades   = "♠️"
        
        var description: String {
            return self.rawValue
        }
        
        static var all = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
    }
    
    
    enum Rank: CustomStringConvertible {
        case ace
        case numeric(Int)
        case face(String)
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return (String(pips))
            case .face(let kind): return kind
            }
        }
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(.numeric(pips))
            }
            allRanks += [.face("J"), .face("Q"), .face("K")]
            
            return allRanks
        }

    }
}
