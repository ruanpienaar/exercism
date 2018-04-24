package leap
const testVersion = 2
func IsLeapYear(year int) bool {
    var four bool = year % 4 == 0
    var hun bool = year % 100 == 0
    var fhun bool = year % 400 == 0
    if four && hun && fhun {
        return true
    } else if four && hun && !fhun {
        return false
    } else if four {
        return true
    } else if !four {
        return false
    } else {
        return false
    }
}
