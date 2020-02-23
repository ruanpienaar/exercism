// acronym takes in a string and creates a acronym by taking the first letter of each word
// and appending that to create the acronym
package acronym

import (
    "regexp"
    "strings"
)

// bare minimal to allow test passing
// first time challenge with string,byte,slices

// Abbreviate returns a Abbreviated string from string s
func Abbreviate(s string) string {
	accronym := []byte{}
	word_seperators := []byte{' ', '-'}
	first_letter_taken := false
	var alphaRe = regexp.MustCompile(`[a-zA-Z]`)
	for i := 0; i < len(s); i++ {
	    if(!first_letter_taken && alphaRe.MatchString(string(s[i]))) {
	        first_letter_taken = true
	        accronym = append(accronym, strings.ToUpper(string(s[i]))[0])
	    } else if (first_letter_taken && ( s[i] == word_seperators[0] || s[i] == word_seperators[1] )) {
	    	// potentiall loop over word_seperators ?
	        first_letter_taken = false
	    }
	}
	return string(accronym)
}
