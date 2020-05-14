# --------------------------------------------------------------------------------------
# File: "duration_calculator.py"
# --------------------------------------------------------------------------------------
"""
this file is meant to make it easy to figure out how long something will take when
speeding it up

formula used
(speed)(new_time) = (speed)(original_time)
new_time = (original_time)/speed
time_saved_percent = 1 – 1/speed

run this script from within an IPython/Jupyter kernal use the following code:
%run ./duration_calculator.py
"""

speed = float(3.2)
original_time = "00:10:40:00"


def get_data_input():
    """
    gets the input from the user
    """
    original_time = input(
        """
    Format: days:hours:minutes:seconds or 00:17:05:00 is 17 Hours and 5 minutes
    Please enter the original duration in this format with days first, hours, next, and then
    seconds. Please enter 00 if there is no duration of that category
    for example if the duration you want to know is 17 Hours and 5 minutes please enter this
    into the box 00:17:05:00
    """
    )
    speed = float(
        input(
            """Please enter the speed as an example use this format 1.8 means 1.8 times faster or 180\% faster"""
        )
    )
    return original_time, speed


def get_total_seconds(original_time):
    """
    this takes the original time format and converts it to the total number of seconds
    """
    day_seconds = int(original_time[0:2]) * 24 * 60 * 60
    hour_seconds = int(original_time[3:5]) * 60 * 60
    minute_seconds = int(original_time[6:8]) * 60
    seconds = int(original_time[9:11])
    return day_seconds + hour_seconds + minute_seconds + seconds


def calcs(total_seconds):
    """
    takes the total seconds and calculates the new total time the percent saved and the
    time saved
    """
    new_time = total_seconds / speed
    time_saved = total_seconds - new_time
    time_saved_percent = 1 - 1 / speed
    return new_time, time_saved, time_saved_percent


def humanize_numbers(time_in_seconds):
    """
    turns the total seconds into the same format requested from the user
    """
    days, leftover_seconds = divmod(int(time_in_seconds), (60 * 60 * 24))
    hours, leftover_seconds = divmod(leftover_seconds, (60 * 60))
    minutes, leftover_seconds = divmod(leftover_seconds, (60))
    return f"{str(days).zfill(2)}:{str(hours).zfill(2)}:{str(minutes).zfill(2)}:{str(leftover_seconds).zfill(2)}"


original_time, speed = get_data_input()
total_seconds = get_total_seconds(original_time)
new_time, time_saved, time_saved_percent = calcs(total_seconds)
new_time = humanize_numbers(new_time)
time_saved = humanize_numbers(time_saved)


print(f"The original time is: {original_time}")
print(f"The new time at {speed} is: {new_time}")
print(f"This resulted in a time savings of: {time_saved}")
print(f"This is {int(time_saved_percent*100)}% of 1.0 speed")
