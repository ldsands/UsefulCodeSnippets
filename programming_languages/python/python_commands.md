# Useful Python Commands

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

## Time and timing your scripts

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
    - note to make this work you must include the following at the top of your document `from datetime import datetime`

    ```Python
    from datetime import datetime

    def print_current_time():
        """
        Prints the current date and time of day
        """
        now = datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
        return f"current time: {now}"
    ```

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

Sometimes if I need to look at a lot of output I like to use the terminal rather than VSCode since it can display more output. This command below allows for running a python file from inside of the IPython/Jupyter kernel.

```Python
%run ./monthly_activity.py
```

## Sending Emails Using Python

I use this for notifications if a script that takes a long time has an error or if it has completed. This code is based mostly on [this article](https://realpython.com/python-send-email/) on real python. You do have to allow the google account to interact with "less secure apps" by clicking a toggle at [this site](https://myaccount.google.com/lesssecureapps). There is no modules needed to be installed since the `smtplib` and `ssl` modules both come with the python standard library.

```Python
def set_up_email_vars():
    """This function will get all of the information need to setup the email server
    Returns:
        SMTP_SSL -- this is the server configuration
        string -- the sender's email address
    """
    import smtplib
    import ssl

    # your email set up
    sender_email = "emailAddress@gmail.com"
    # the sending email account's password
    email_password = input("Type your password and press enter: ")
    # Create a secure SSL context
    context = ssl.create_default_context()
    email_server = smtplib.SMTP_SSL("smtp.gmail.com", port=465, context=context)
    email_server.login(sender_email, email_password)
    return email_server, sender_email


def send_email(email_subject, email_body, email_server, sender_email):
    """This function will assemble then send the email
    Arguments:
        email_subject {str} -- the subject line you want in the email sent
        email_body {str} -- the body of the message you want sent
        email_server {SMTP_SSL} -- the configured and connected server
        sender_email {str} -- the email address to be sent from
    """
    # who you want the email to go to
    receiver_email = "emailAddress@email.com"
    message = f"Subject: {email_subject}\n\n{email_body}"
    email_server.sendmail(sender_email, receiver_email, message)


email_subject = "Subject of email"
email_body = "Sample email body text."
email_server, sender_email = set_up_email_vars()
send_email(email_subject, email_body, email_server, sender_email)
```
