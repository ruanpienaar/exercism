"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME=40
PREPARATION_TIME=2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers):
    """Calculate the elapsed time

    :param number_of_layers: int - how many layers we're making
    :return: int - total layer making time

    Function that takes number of layers, calculates the layer making time

    """
    return number_of_layers * PREPARATION_TIME

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the elapsed time

    :param number_of_layers: int - how many layers we're making
    :param elapsed_bake_time - how long we've been baking for
    :return: int - total baking time

    Function that takes number of layers, calculates the layer making time
    and adds it to elapsed_bake_time to give us a total bake time

    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
