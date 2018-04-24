package raindrops

import "strconv"

const testVersion = 2

func Convert(n int) string {
	var resp string
	if n == 1 {
		return "1"
	}
	if n%3 == 0 {
		resp += "Pling"
	}
	if n%5 == 0 {
		resp += "Plang"
	}
	if n%7 == 0 {
		resp += "Plong"
	}
	if resp == "" {
		resp = string(strconv.Itoa(n))
	}
	return resp
}