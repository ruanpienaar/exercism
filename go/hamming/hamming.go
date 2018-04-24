package hamming

import (
	"errors"
)

const testVersion = 5

func Distance(a, b string) (int, error) {
	if len(a) == len(b) {
		var diff int
		for i, ar := range a {
			if string(ar) != string(b[i]) {
				diff++
			}
		}
		return diff, nil
	}
	return -1, errors.New("strings are not equal lengths")
}