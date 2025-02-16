package speed

type Car struct {
	battery int
	batteryDrain int
	distance int
	speed int
}

// NewCar creates a new remote controlled car with full battery and given specifications.
func NewCar(speed, batteryDrain int) Car {
	return Car{
		battery: 100,
		batteryDrain: batteryDrain,
		speed: speed,
		distance: 0,
	}
}

type Track struct {
	distance int
}

// NewTrack creates a new track
func NewTrack(distance int) Track {
	return Track{
		distance: distance,
	}
}

// Drive drives the car one time. If there is not enough battery to drive one more time,
// the car will not move.
func Drive(car Car) Car {
	newBatteryLevel := car.battery - car.batteryDrain
	if newBatteryLevel >= 0 {
		car.battery = newBatteryLevel
		car.distance = car.distance + car.speed
		return car
	} else {
		return car
	}
}

// CanFinish checks if a car is able to finish a certain track.
func CanFinish(car Car, track Track) bool {
	var distanceToDrive int = track.distance
	for distanceToDrive > 0 {
		var prevCarDistance = car.distance
		var car2 = Drive(car)
		car.battery = car2.battery
		car.batteryDrain = car2.batteryDrain
		car.distance = car2.distance
		car.speed = car2.speed
		if car.distance == prevCarDistance { // did not move
			return false
		} else if car.distance > prevCarDistance {
			distanceToDrive -= car.speed
		}
	}
	return true
}