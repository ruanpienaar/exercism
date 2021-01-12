package scrabble

import "strings"

// Score determines the Scrabble score of a given input word.
func Score(word string) int {
	var wordScore int
	for _, letter := range word {
		switch strings.ToLower(string(letter)) {
		case "a", "e", "i", "o", "u", "l", "n", "r", "s", "t":
			wordScore++
		case "d", "g":
			wordScore += 2
		case "b", "c", "m", "p":
			wordScore += 3
		case "f", "h", "v", "w", "y":
			wordScore += 4
		case "k":
			wordScore += 5
		case "j", "x":
			wordScore += 8
		case "q", "z":
			wordScore += 10
		}
	}
	return wordScore
}
