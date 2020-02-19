def leap_year(year):
    """ Check if a given year is a leap year """
    if evenly_divisible(year, 4):
        if evenly_divisible(year, 100):
            if evenly_divisible(year, 400):
                return True
            else:
                return False
        else:
            return True
    else:
        return False

def evenly_divisible(year, num):
    return (year % num) == 0