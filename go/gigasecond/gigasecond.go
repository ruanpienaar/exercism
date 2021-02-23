// Package gigasecond has one method for adding a gigasecond to a time

package gigasecond

import (
	"time"
)

// AddGigasecond takes in a time and adds a gigasecond to the time, then
// converts it back to a time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(1000000000) * time.Second)
}