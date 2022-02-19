#%%
import datetime
import time

import numpy as np
import pandas as pd
from loguru import logger

s = time.time()

def Get_Previous_Fiscal_datetime():
    """Returns a list with the following info:

    [0] previous_fiscal_month (int)
        [1] previous_fiscal_year (int)
    [2] previous_fiscal_day (int)
        [3] previous_fiscal_month_name (str)
    [4] previous_fiscal_month_length (int)
    """    
    current_date = [int(x) for x in str(datetime.date.today()).split("-")]
    year = current_date[0]
    current_date[0] = current_date[1]
    current_date[1] = year
    if current_date[0] >= 7:
        current_date[0] -= 6
        current_date[1] += 1
    else:
        current_date[0] += 6

    month_names = [
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
        "January",
        "February",
        "March",
        "April",
        "May"
    ]
    month_lengths = [
        30,
        31,
        31,
        30,
        31,
        30,
        31,
        31,
        28,
        31,
        30,
        31
    ]

    for x in range(1,13):
        if current_date[0] == x:
            current_date.extend((month_names[(x-1)], month_lengths[(x-1)]))
            break

    return(current_date)

logger_path = "Q:/Acea Sands/test" #path to put log file

def Logger_initialization(path:str,level="INFO",backtrace=False,diagnose=True,title="test"):
    """Sets up a logger to log the events specified during a program run phase.

    Args:
        path (str): The path the logger will be saved to.

        level (str, optional): The level of detail logged. 
        Trace = 5, Debug = 10, Info = 20, Success = 25, Warning = 30, Error = 40, Critical = 50. 
        Logs to logger if level is >= level in logger creation. 
        IE if level = "INFO" then Debug will not report, but Success will. 
            Defaults to "INFO".

        backtrace (bool, optional): If you want EVERYTHING then switch this to True. It will provide all traceback. 
        Lots of code warning. 
            Defaults to False.

        diagnose (bool, optional): This gives you all the fancy stuff that defines all the variables in your errors. 
            Defaults to True.

        title (str, optional): What you want the logger to be called. Will always include the time of creation after title. 
            Defaults to "test".
    """
    logger.add(f'{path}/{title}'+'_{time}.log', 
        format="{level} ({level.no}): {time} -- {message}",
        # filter="my_module", 
        # rotation="100 MB", # Will replace the old log file with new one once this condition is met.
        # compression="zip", #Can default to compressed
        backtrace = backtrace,
        diagnose = diagnose,
        level=level)
    logger.info("Logger successfully initilized")
    return(logger)

@logger.catch
def Logger_terminate(logger:logger,s=0.0):
    """Terminates logger.

    Args:
        logger (logger): The logger to be terminated
        s (float, optional): time.time(). Will calculate time lapse between that time and time of this function's running. 
            Defaults to 0.0.
    """    
    if s != 0.0:
        logger.info(f"Program took {(time.time()-s)/60:.3f} minutes.")
    logger.info("Logger terminating")
    logger.remove()
    logger.warning("Logger not terminated")

logger = Logger_initialization(logger_path)

# Code Here #

print("Program completed")
Logger_terminate(logger,s)
