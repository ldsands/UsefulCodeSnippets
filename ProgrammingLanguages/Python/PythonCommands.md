# Useful Python Commands

- [Useful Python Commands](#useful-python-commands)
    - [Python file management](#python-file-management)
        - [Pathlib Getting File Directories](#pathlib-getting-file-directories)
    - [Exiting a Python Program/Script](#exiting-a-python-programscript)
    - [Logging in Python](#logging-in-python)
    - [Timing and Profiling Your Scripts](#timing-and-profiling-your-scripts)
        - [Multiprocessing in Python](#multiprocessing-in-python)
    - [IPython/Jupyter special commands](#ipythonjupyter-special-commands)
    - [Sending Emails Using Python](#sending-emails-using-python)
    - [Get Information](#get-information)
    - [Random Useful Commands](#random-useful-commands)

## Python file management

There are really two main options for file management in python the first is using os module the second is pathlib. Pathlib is superior in almost everyway and thus it is far better to use in general. It comes built into python so you don't have to use pip or conda to install it.

### Pathlib Getting File Directories

## Exiting a Python Program/Script

Sometimes you need to exit a Python script or program. This is the best way to do it and it prints a message for you as well. Other options are shown below my preferred option.

```Python
import sys
sys.exit("You did not enter an API key please do so")
raise SystemExit
```

## Logging in Python

Logging is an important concept to know with python especially as scripts and packages become more complicated. Using logging is preferable to adding print statements to track what is happening in your scripts and packages.

- Some basic logging concepts are important to know. A basic example is below.
    - There are differnt levels of logs
    - You can specify which level of the logs (and above) will be displayed (in the example below the levels that will be displayed are warning and critical)
        - the default levels in order (lowest to highest level) are : debug, info, warning, error, critical
        - You can set the level to "NOTSET" to include all levels

    ```python
    import logging

    def main() -> None:
        logging.basicConfig(level=logging.WARNING)

        logging.debug("This is a debug message")
        logging.info("This is a info message")
        logging.warning("This is a warning message")
        logging.error("This is a error message")
        logging.critical("This is a critical message")

    if __name__ == "__main__":
        main()
    ```

- You can do many things to format the logging output some examples are below.
    - format can modifiy the formatting of the logging messages
    - datefmt is the datetime formatting
    - filename is for saving the logging outputs to a file instead of the console

    ```python
    logging.basicConfig(
        level=logging.DEBUG,
        format="%(asctime)s %(levelname)s %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        filename="logs/basic.log"
    )
    ```

- To have the logging output go to both the console and a file you have to set up handelers. See below for a simple example.

    ```python
    import logging
    import sys

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        handlers=[
            logging.FileHandler("logs/basic.log"),
            logging.StreamHandler(sys.stdout),
        ],
    )
    ```

- This example includes colorful outputs for easier reading using [rich](https://rich.readthedocs.io/en/stable/index.html) ([more about rich's logging options can be found here](https://rich.readthedocs.io/en/stable/logging.html)).
    - It also has the format set to output to a log file (using the normal logging package defaults) as well.
    - There is no need for a format for the console output since rich does this for you
    - The `rich_tracebacks` when set to `True` will allow you to log exceptions (example below)

    ```python
    import logging
    from rich.logging import RichHandler

    logging.basicConfig(
        level=logging.INFO,
        handlers=[
            logging.FileHandler("logs/basic.log"),
            RichHandler(markup=True, rich_tracebacks=True),
        ],
    )
    log = logging.getLogger("rich")
    log.debug("This is a debug message")

    # exception example
    x = 5
    y = "5"
    try:
        z = x + y
    except Exception:
        log.exception("There is an exception here")
    ```

- To set up Rich with logging and get a good format for the log file too is a bit more complicated. Below is an example:
    - I modified the example below from what I found [on this site](https://calmcode.io/logging/rich.html) mostly to cut down on the code.

    ```python
    import logging
    from rich.logging import RichHandler

    def set_up_logger() -> logging.Logger:
        log = logging.getLogger(__name__)
        log.setLevel(logging.DEBUG)
        date_format = "%Y-%m-%d %H:%M:%S"
        output_format = "%(asctime)s %(levelname)s %(message)s"
        shell_handler = RichHandler(markup=True, rich_tracebacks=True, log_time_format=date_format)
        file_handler = logging.FileHandler("logs/basic.log")
        shell_handler.setLevel(logging.DEBUG)
        file_handler.setLevel(logging.DEBUG)
        file_formatter = logging.Formatter(fmt=output_format, datefmt=date_format)
        file_handler.setFormatter(file_formatter)
        log.addHandler(shell_handler)
        log.addHandler(file_handler)
        return log

    log = set_up_logger()
    log.critical("This is a critical message")
    x = 5
    y = "5"
    try:
        z = x + y
    except Exception:
        log.exception("test")
    ```

<!-- ## Functions in Python -->
<!-- 
TODO:
### Optional Arguments
 -->
## Timing and Profiling Your Scripts

- Below is a short way to time scripts is is far easier than a lot of alternatives

    ```Python
    # import time module
    import time
    # start the timer
    start_time = time.time()
    # function goes here
    # get the elapsed time
    elapsed_time = (time.time() - start_time) / 60
    # print out the elapsed time in minutes
    print(f"Completed function in {round(elapsed_time, 3)} minutes")
    ```

- A more involved version that uses a decorator is shown below

    ```python
    def function_timer(func):
        """This is a timer decorator when defining a function if you want that function to
        be timed then add `@function_timer` before the `def` statement and it'll time the
        function
        Arguments:
            func {function} -- it takes a function for this decorator to work
        Returns:
            this will print out the time taken and the time the function started and
            completed
        """
        import functools
        import time
        from datetime import datetime

        @functools.wraps(func)
        def wrapper_timer(*args, **kwargs):
            start_time = time.time()
            # start_date = datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
            # print(f"The function {func.__name__} started at {start_date}")
            value = func(*args, **kwargs)
            elapsed_time = time.time() - start_time
            stop_date = datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
            if elapsed_time > 60 <= 3600:
                print(
                    f"The function {func.__name__} took: {round(elapsed_time/60, 3)} minutes at {stop_date}"
                )
            elif elapsed_time > 3600:
                print(
                    f"The function {func.__name__} took: {round((elapsed_time/60)/60, 3)} hours at {stop_date}"
                )
            else:
                print(f"The function {func.__name__} took: {round(elapsed_time, 3)} seconds")
            return value

        return wrapper_timer
    ```

- Printing the current time - sometimes you need to know about what time something happened this can do that by printing the current time

    ```Python
    def print_current_time():
        """
        Prints the current date and time of day
        """
        from datetime import datetime

        now = datetime.now()
        now = now.strftime("%m/%d/%Y, %H:%M:%S")
        return now
    ```

- For IPython you can also use "magic commands" below are two that I've used in the past.
    - `%%time` this will give you the time it takes to run a cell
    - `%%timit` this will run the cell several times and get and average and fastest time to run the cell

- Also for IPython you can use the memory_profiler for cells to get memory information ([see more here](https://jakevdp.github.io/PythonDataScienceHandbook/01.07-timing-and-profiling.html))
    - You must first install the package `pip install memory_profiler`
    - You must then load it by using this code in IPython: `%load_ext memory_profiler`
    - You can then place `%memit` in front of a function you want to profile the output will look something like this `peak memory: 589.89 MiB, increment: 188.55 MiB`

### Multiprocessing in Python

Multiprocessing in Python is a major pain because of the way it was written which is a product of when it was written. It has what is called the Global Interpreter Lock which prevents multiple instances of python from running at any given time. This GIL can be sidestepped by using the Multiprocessing package which is built into the base python distribution. Below is some code that I have gathered and worked with to get it working with some scripts where I needed to speed stuff up.

- To be able to use a function that uses multiple arguments was difficult to figure out but this has worked for me pretty well and I am sharing it here. Most of this comes from these posts: [link 01](https://stackoverflow.com/questions/36587211/easiest-way-to-read-csv-files-with-multiprocessing-in-pandas) [link 02](https://stackoverflow.com/questions/54043682/how-to-use-multiprocessing-with-multiple-arguments-in-python-3) [link 03](https://stackoverflow.com/questions/5442910/python-multiprocessing-pool-map-for-multiple-arguments) [link 04](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows) [link 05](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows) [link 06 - threading](https://stackoverflow.com/questions/49875889/run-two-python-files-at-the-same-time). These links are all from Stackoverflow.

```Python
import itertools
from multiprocessing import Pool

with Pool(processes=4) as pool:
    dta_list = pool.starmap(
        clean_text, zip(files_RS, itertools.repeat(extra_arg))
    )
```

## IPython/Jupyter special commands

Sometimes if I need to look at a lot of output I like to use the terminal rather than VS Code since it can display more output. This command below allows for running a python file from inside of the IPython/Jupyter kernel.

```Python
%run ./monthly_activity.py
```

- I can be useful to check to see if code is running in IPython/Jupyter kernal. This is how you can do that:

    ```Python
    try:
        __IPYTHON__
    except NameError:
        print("Not in IPython")
    ```

## Sending Emails Using Python

I use this for notifications if a script that takes a long time has an error or if it has completed. This code is based mostly on [this article](https://realpython.com/python-send-email/) on real python. You do have to allow the google account to interact with "less secure apps" by clicking a toggle at [this site](https://myaccount.google.com/lesssecureapps). There is no modules needed to be installed since the `smtplib` and `ssl` modules both come with the python standard library.

```Python
def get_email_password():
    """This function will prompt the user for the email password to use later
    Returns:
        string -- the sender's email address password
    """
    # the sending email account's password
    email_password = input("Type your password and press enter: ")
    return email_password


def send_email(email_subject, email_body, email_password):
    """This function will assemble then send the email
    Arguments:
        email_subject {str} -- the subject line you want in the email sent
        email_body {str} -- the body of the message you want sent
        email_password {str} -- the password for the email account
    """
    import smtplib, ssl

    # your email set up
    sender_email = "ldsandsdev@gmail.com"
    # Create a secure SSL context
    context = ssl.create_default_context()
    email_server = smtplib.SMTP_SSL("smtp.gmail.com", port=465, context=context)
    email_server.login(sender_email, email_password)
    # who you want the email to go to
    receiver_email = "ldsands@outlook.com"
    message = f"Subject: {email_subject}\n\n{email_body}"
    email_server.sendmail(sender_email, receiver_email, message)



email_subject = "Subject of email"
email_body = "Sample email body text."
email_password = get_email_password()
send_email(email_subject, email_body, email_password)
```

## Get Information

Sometimes particularly for email notifications and such I like to know what script is running and what computer it is running on. These two commands below help with that.

```Python
# get computer name
import socket
print(socket.gethostname())
# get the script name
import sys
print(sys.argv[0])
```

## Random Useful Commands

- When you playing with data you don't want to have to reload the data over and over again so you can check to see if whatever you're working on works. Rather than load that data you can check to see if it is already loaded.

    ```Python
    if "dta" in globals(): # or locals for locally defined variables
        print("dta is already loaded")
    else:
        print("you need to load the data")
    ```

- Interacting with the system be it through PowerShell or zsh/bash can be very useful. This is especially true when using environment variables. Below is an example of sending a command to the shell (in this case zsh). After that is an example of retrieving an environment variable.

    ```python
    # import os module
    import os
    # send the ls command to variable directory_contents
    directory_contents = os.popen('ls').read()
    print(directory_contents)
    # sending the command GoogleNewsModel to the shell to get the directory set to that environment variable
    print(os.environ["GoogleNewsModel"])
    print(f"{os.environ["GoogleNewsModel"]}GoogleNews-vectors-negative300.bin.gz")
    ```

- Trying to get every possible pair without duplicates from a list is complicated. Fortunately itertools has a function for this:

    ```Python
    import itertools
    list(itertools.combinations(range(6), 2))
    # here is the output
    [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5)]
    ```

- Chunking lists can be useful when you need to make sure that you're not using too much memory

    ```Python
    def get_chunked_list(target_list, chunk_size):
        """Yield successive n-sized chunks from target_list. Where chunk_size is an int and the target_list is a list that will be split"""
        return [target_list[counter : counter + chunk_size] for counter in range(0, len(target_list), chunk_size)]
    ```

- Getting rid of URLs in text data is a huge pain. Below are some of the best RegEx statements I've found [(here is where I found it the first one)](https://regex101.com/library/Qtj4KW) for finding URLs is below:

    ```Python
    # this is the bare RegEx: (http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)
    import re

    target_str = re.sub(
            r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)",
            " ",
            target_str,
        )
    target_str = re.sub(
            r"((http|https)+\:\/\/)?([\w\d-]+\.)*[\w-]+[\.\:]\w+([,]?[;+%\/\?\=\&\#\.]?[\w-]+)*\/?",
            " ",
            target_str,
        )
    ```

- Formatting print function to stand out much more. The example below prints the string in a green color making it very easy to see.

    ```python
    def prGreen(text_string):
        print("\033[92m {}\033[00m".format(text_string))
    ```
