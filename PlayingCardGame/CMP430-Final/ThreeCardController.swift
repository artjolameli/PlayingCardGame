//
//  ViewController.swift
//  CMP430-Final
//
//  Created by Artjola Meli on 12/16/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import UIKit

class ThreeCardViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var cpuCardContainerView: CardContainerView!
    @IBOutlet weak var cardContainerView: CardContainerView!
    @IBOutlet weak var betBtn: UIButton!
    @IBOutlet weak var gameLbl: UILabel!
    @IBOutlet weak var dealBtn: UIButton!
    @IBOutlet weak var deckImage: UIImageView!
    @IBOutlet weak var userScoreLbl: UILabel!
    @IBOutlet weak var userBalanceLbl: UILabel!
    @IBOutlet weak var userBetLbl: UILabel!
    @IBOutlet weak var cpuScoreLbl: UILabel!
    var game = CardGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    
    @IBAction func dealBtnPressed(_ sender: Any) {
        if game.bet == 0
        {
            game.playerCards.removeAll()
            game.computerCards.removeAll()
            
            game.addPCards(cardToAddd: 3)
            game.addCCards(cardToAddd: 3)
            
            for view in self.cardContainerView.subviews {
                view.removeFromSuperview()
            }
            for index in game.playerCards.indices {
                
                let subView = PlayingCardView()
                subView.rank = game.playerCards[index].rank.order
                subView.suit = game.playerCards[index].suit
                subView.isFaceUp = game.playerCards[index].isFaceUp
                
                cardContainerView.addSubview(subView)
                cardContainerView.isAnimated = true
                subView.frame = self.deckImage.frame
                betBtn.isEnabled.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    UIView.transition(with: subView, duration: 1.7, options: .transitionFlipFromLeft, animations: {
                        subView.transform = CGAffineTransform(scaleX: 3, y: 3)

                        subView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        subView.layer.borderWidth = 0.5
                        subView.isFaceUp.toggle()
                        
                    }) { finished in
                        
                    }
                })
            }
            
            game.calculateP()
            updateLabels()
        }
        else {
            if game.bet > 0 {
                
                for view in self.cpuCardContainerView.subviews {
                    if view.layer.borderColor == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view.layer.borderWidth == 0.5
                                                 {
                                                     view.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                                                    view.layer.borderWidth = 0.5
                                                 }
                    view.removeFromSuperview()
                }
                for index in game.computerCards.indices {
                    
                    let subView = PlayingCardView()
                    subView.rank = game.computerCards[index].rank.order
                    subView.suit = game.computerCards[index].suit
                    subView.isFaceUp = game.computerCards[index].isFaceUp
                    
                    cpuCardContainerView.addSubview(subView)
                    cpuCardContainerView.isAnimated = true
                    
                    subView.frame = self.deckImage.frame
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                        UIView.transition(with: subView, duration: 1.7, options: .transitionFlipFromLeft, animations: {
                            subView.transform = CGAffineTransform(scaleX: 3, y: 3)

                            subView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                            subView.layer.borderWidth = 0.5
                            subView.isFaceUp.toggle()
                            
                        }) {
                    finished in
                }
            })
        }
                game.playerScore = 0
                game.calculateC()
                updateLabels()
                gameLbl.isHidden = false
                dealBtn.isEnabled.toggle()
                betBtn.isEnabled.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                        self.gameLbl.isHidden = true
                        self.game.playerScore = 0
                        self.game.bet = 0
                        self.game.playerScore = 0
                        self.updateViewFromModel()
                        self.dealBtn.isEnabled.toggle()
                        self.betBtn.isEnabled.toggle()
                })
            }
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        game.newGame()
        updateLabels()
        updateViewFromModel()
    }
    @IBAction func betBtnPressed(_ sender: Any) {
        game.bet += 1
        updateLabels()
        
    }
    func updateLabels() {
        gameLbl.text = game.gameLbl
        cpuScoreLbl.text = "Score: \(game.computerScore)"
        userScoreLbl.text = "Score: \(game.playerScore)"
        userBalanceLbl.text = "Balance: $\(game.balance)"
        userBetLbl.text = "Bet: $\(game.bet)"
    }
    
    func updateViewFromModel() {
        betBtn.isEnabled.toggle()
        updateLabels()
        gameLbl.isHidden = true
        
        for view in self.cardContainerView.subviews {
            if view.layer.borderColor == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view.layer.borderWidth == 0.5
                                         {
                                             view.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                                            view.layer.borderWidth = 0.5
                                         }
            view.removeFromSuperview()
        }
        for index in 0...2{
            
            let subView = SecondCardView()
            subView.rank = game.cards[index].rank.order
            subView.suit = game.cards[index].suit
            subView.isFaceUp = game.cards[index].isFaceUp
            
            cardContainerView.addSubview(subView)
            cardContainerView.isAnimated = false
            
        }
        
        for view in self.cpuCardContainerView.subviews {
            if view.layer.borderColor == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view.layer.borderWidth == 0.5
                                         {
                                             view.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                                            view.layer.borderWidth = 0.5
                                         }
            view.removeFromSuperview()
        }
        for index in 0...2 {
            
            let subView = SecondCardView()
            subView.rank = game.cards[index].rank.order
            subView.suit = game.cards[index].suit
            subView.isFaceUp = game.cards[index].isFaceUp
            
            cpuCardContainerView.addSubview(subView)
            cpuCardContainerView.isAnimated = false
        }
    }
    
    func updateUserCard() {
        
        let subView = SecondCardView()
        subView.rank = game.playerCards[game.playerCards.endIndex - 1].rank.order
        subView.suit = game.playerCards[game.playerCards.endIndex - 1].suit
        subView.isFaceUp = game.playerCards[game.playerCards.endIndex - 1].isFaceUp
        
        cardContainerView.addSubview(subView)
        cardContainerView.isAnimated = true
        subView.frame = self.deckImage.frame
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
            UIView.transition(with: subView, duration: 1.7, options: .transitionFlipFromLeft, animations: {
                subView.transform = CGAffineTransform(scaleX: 3, y: 3)

                subView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                subView.layer.borderWidth = 0.5
                subView.isFaceUp.toggle()
                
            }) {
            finished in
            }
        })
    
        game.calculateP()
        updateLabels()
    }
}

