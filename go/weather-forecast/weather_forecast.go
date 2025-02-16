// Package weather implements a forcast method that takes in city and condition as arguments.
package weather

// CurrentCondition describes the condition of the weather in the specified city.
var CurrentCondition string

// CurrentLocation is the currently selected city that's used in Forcast.
var CurrentLocation string

// Forecast takes in 2 arguments and formats a response string with the location and conition in.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
