// Package gigasecond has one method for adding a gigasecond to a time
package gigasecond

import (
	"math"
	"time"
)

// AddGigasecond takes in a time and adds a gigasecond to the time, then
// converts it back to a time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(int64(math.Pow(10, 9))) * time.Second)
}