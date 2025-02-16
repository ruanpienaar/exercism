package scrabble

import (
    "strings"
)

func Score(word string) int {
    var score = 0
	for _, letter := range strings.ToUpper(word) {
        switch letter {
            case 'D', 'G' : score += 2
            case 'B', 'C', 'M', 'P' : score += 3
            case 'F', 'H', 'V', 'W', 'Y': score += 4
            case 'K' : score += 5
            case 'J', 'X' : score += 8
            case 'Q', 'Z' : score += 10
            default : score += 1
        }
	}
    return score
}
