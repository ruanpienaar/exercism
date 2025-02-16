package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	var cardValue int
	switch card {
		case "ten", "jack", "queen", "king": cardValue = 10
		case "one": cardValue = 1
		case "two": cardValue = 2
		case "three": cardValue = 3
		case "four": cardValue = 4
		case "five": cardValue = 5
		case "six": cardValue = 6
		case "seven": cardValue = 7
		case "eight": cardValue = 8
		case "nine": cardValue = 9
		case "ace": cardValue = 11
	}
	return cardValue
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	var potentialScore = ParseCard(card1) + ParseCard(card2)
	var dealerCardScore = ParseCard(dealerCard)
	var action = ""
	if card1 == "ace" && card2 == "ace" {
		action = "P"
	} else if potentialScore == 21 && ( dealerCardScore == 11 || dealerCardScore == 10 ) {
		action = "S"
	} else if potentialScore == 21 {
		action = "W"
	} else if potentialScore <= 20 && potentialScore >= 17 {
		action = "S"
	} else if potentialScore <= 16 && potentialScore >= 12 {
		if( dealerCardScore >= 7 ){
			action = "H"
		} else {
			action = "S"
		}

	} else if potentialScore <= 11 {
		action = "H"
	}
	return action
}