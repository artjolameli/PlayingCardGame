# PlayingCardGame
You can check out a demo of the app by clicking this link: https://youtu.be/uRcK4z6c2gQ
You will use the following classes from the class demo PlayingCard:
PlayingCard.swift
PlayingCardDeck.swift
PlayingCardView.swift
You can download the files for the final exam by selecting the link. You can download the PlayingCard Images for the final exam by selecting the link.

Enhance the PlayingCard class to have a computed score attribute. A card's score is a combination of it's Suit and Rank. For this J, Q, K and A can be considered 11, 12, 13 and 14 respectively. and ♠, ♥, ♦, and ♣ can be 4, 3, 2 and 1 respectively. You need to combine the two to obtain a score. As an example, please note that 10 ♦ should have a higher score than 10 ♣.

Cards will be displayed using PlayingCardView and should display with images and pips, just like we did in class.

You will use a TabViewController to have 2 versions of the game:
In this tab, the game will use 3 cards for the player and 3 cards for the computer
In this tab, the game will use 5 cards for the player and 5 cads for the computer.

You will have a CardGame class that contains the logic of your game (See below). The combination of PlayingCard, PlayingCardDeck, and CardGame classes will be your model. The game will work as follows:
Your game will have 3 buttons:
Deal Button
Bet Button
Reset Button

The player will have the following labels:
Score Label: This label will show the player's current score. The current score is the sum of the scores of the player's cards. When the player does not have visible cards, the score should be zero.
Balance Label: This label will show the player's current balance.
Bet Label: This label will show the player's current bet

The computer will have the following labels:
Score Label: This label will show the player's current score. The current score is the sum of the scores of the player's cards. When the computer does not have visible cards, the score should be zero.

The user will start a new game with $100 dollars available for betting. Both the player's cards and the computer's cards begin in face down mode.

When the user presses the Deal button, the correct number of cards are presented to the user. The cards should be flipped over with animation.

At this point, the user has the option of trading up to 1 card to improve their score. The user does not have to trade in any cards if they do not wish. The cards are traded using a Swipe Right gesture on the card to be traded in. The card being traded in, should be flipped face down with animation and the replacement card should be revealed by flipping the card face up with animation.

Trading in a card MUST automatically increase the user's bet by $5. If the user does not have the money to increase the bet by $5, no trading in should be allowed.

The user must place a minimum bet of $1. The user should be able to place a higher bet if they wish. This can be done by the user repeatedly pressing the Bet button. Please note that until the user places a bet, the Deal button should be disabled.

When the user places their final bet, they will press the Deal button and now the computer will deal itself an equal number of cards with the same animations.

The total score for the user is compared to that of the computer, if the user's score is higher, they win an amount equal to their bet. If the user's score is more than twice that of the computer, the user wins double their bet. If the user's score is lower than the computer's they lose the money that they bet. An equal score will result in the user getting back their bet.

The next time the Deal button is pressed, all the cards are animated to face down and the user is presented with new cards by animating the cards flipping over.

The game ends when the user runs out of money or when the deck is empty or when there are not enough cards in the deck to satisfy the a deal request. When the game ends, the Deal button must be disabled.

The Bet button should be disabled when betting is not taking place. (i.e. User should not be able to increase their bet after seeing the computer's cards).

The game can be reset if the user presses the 'Reset' button.

The amount of money that the user has should be always displayed on the screen.

The amount of money the user is currently betting should also be displayed on the screen. After the previous bet has been resolved, the User Balance should be updated and the User Bet should be set to zero.

The total score for the user's cards and the computer's cards should be displayed on the screen. This score should be zero when the corresponding cards are face down.
