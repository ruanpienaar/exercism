// Package bob responds according to your input.
package bob

import (
	"regexp"
	"strings"
)

// Hey forwards remark to bob and returns bob's answer.
func Hey(remark string) string {
	r := strings.Trim(remark, " \t\n\r")
	if r == "" {
		return "Fine. Be that way!"
	}
	if IsShouting(r) {
		return "Whoa, chill out!"
	}
	if IsQuestion(r) {
		return "Sure."
	}
	return "Whatever."
}

// IsQuestion check whether remark is a question.
func IsQuestion(remark string) bool {
	s, _ := regexp.MatchString("\\?$", remark)
	return s
}

// IsShouting check whether remark is UPPERCASE and does not contain any lower case.
func IsShouting(remark string) bool {
	s, _ := regexp.MatchString("[A-Z]{2,}", remark)
	r, _ := regexp.MatchString("[a-z]", remark)
	return s && (r == false)
}
