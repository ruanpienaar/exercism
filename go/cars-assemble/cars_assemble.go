package cars

// CalculateWorkingCarsPerHour gets the percentage ( successRate ) from the cars/h (productionRate)
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	var productionRateFloat float64 = float64(productionRate)
	var successProductionRatePerHour float64 = (productionRateFloat * successRate) / 100.0
	return successProductionRatePerHour
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	var successProductionRatePerMin = CalculateWorkingCarsPerHour(productionRate, successRate) / 60
	return int(successProductionRatePerMin)
}

// CalculateCost works out the cost of producing the given number of cars.
// groups of 10 -> 95000
// each on it's own -> 10000
func CalculateCost(carsCount int) uint {
	var remain int = carsCount % 10
	var costReductionCount int = carsCount - remain
	var costReductionCountPrice int = (costReductionCount / 10) * 95000
	var costUnitPrice int = remain * 10000
	var totalPrice int = costReductionCountPrice + costUnitPrice
	return uint(totalPrice)
}
