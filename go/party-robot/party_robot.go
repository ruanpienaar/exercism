package partyrobot

import "fmt"

// Welcome greets a person by name.
func Welcome(name string) string {
	return "Welcome to my party, " + name +"!"
}

// HappyBirthday wishes happy birthday to the birthday person and exclaims their age.
func HappyBirthday(name string, age int) string {
	return "Happy birthday "+name+"! You are now "+fmt.Sprintf("%d",age)+" years old!"
}

// AssignTable assigns a table to each guest.
func AssignTable(name string, table int, neighbor, direction string, distance float64) string {
	return Welcome(name) + "\n" + tableAssignement(table) + tablePlacement(neighbor, direction, distance)
}

func tableAssignement(table int) string {
	return "You have been assigned to table "+fmt.Sprintf("%0.3d", table)+". "
}

func tablePlacement( neighbor, direction string, distance float64) string {
	return "Your table is "+direction+", exactly "+fmt.Sprintf("%.1f", distance)+" meters from here.\n" + "You will be sitting next to "+neighbor+"."
}