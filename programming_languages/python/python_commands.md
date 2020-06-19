# Useful Python Commands

- [Useful Python Commands](#useful-python-commands)
    - [Python file management](#python-file-management)
        - [Pathlib Getting File Directories](#pathlib-getting-file-directories)
    - [Exiting a Python Program/Script](#exiting-a-python-programscript)
    - [Functions in Python](#functions-in-python)
        - [Optional Arguments](#optional-arguments)
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

## Functions in Python

### Optional Arguments

TODO:

## Timing and Profiling Your Scripts

- below is what I usually use to time my scripts is is far easier than a lot of alternatives

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

- printing the current time - sometimes you need to know about what time something happened this can do that by printing the current time

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
    - you must first install the package `pip install memory_profiler`
    - You must then load it by using this code in IPython: `%load_ext memory_profiler`
    - You can then place `%memit ` in front of a function you want to profile the output will look something like this `peak memory: 589.89 MiB, increment: 188.55 MiB`

### Multiprocessing in Python

Multiprocessing in Python is a major pain because of the way it was written which is a product of when it was written. It has what is called the Global Interpreter Lock which prevents multiple instances of python from running at any given time. This GIL can be sidestepped by using the Multiprocessing package which is built into the base python distribution. Below is some code that I have gathered and worked with to get it working with some scripts where I needed to speed stuff up.

- to be able to use a function that uses multiple arguments was difficult to figure out but this has worked for me pretty well and I am sharing it here. Most of this comes from these posts: [link 01](https://stackoverflow.com/questions/36587211/easiest-way-to-read-csv-files-with-multiprocessing-in-pandas) [link 02](https://stackoverflow.com/questions/54043682/how-to-use-multiprocessing-with-multiple-arguments-in-python-3) [link 03](https://stackoverflow.com/questions/5442910/python-multiprocessing-pool-map-for-multiple-arguments) [link 04](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows) [link 05](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows) [link 06 - threading](https://stackoverflow.com/questions/49875889/run-two-python-files-at-the-same-time). These links are all from Stackoverflow.

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

- when you playing with data you don't want to have to reload the data over and over again so you can check to see if whatever you're working on works. Rather than load that data you can check to see if it is already loaded.

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
