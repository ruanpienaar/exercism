package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	var borderLineRunes []rune
	for i := 0; i<numStarsPerLine; i++ {
		borderLineRunes = append(borderLineRunes, '*')
	}
	var borderLine = string(borderLineRunes)
	return borderLine + "\n" + welcomeMsg + "\n" + borderLine
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	for _, removeChar := range []string{"*", "\n"} {
		oldMsg = strings.ReplaceAll(oldMsg, removeChar, "")
	}
	return strings.Trim(oldMsg, " ")
}
