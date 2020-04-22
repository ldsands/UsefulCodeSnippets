# Useful Python Commands

## Python file management

There are really two main options for file management in python the first is using os module the second is pathlib. Pathlib is superior in almost everyway and thus it is far better to use in general. It comes built into python so you don't have to use pip or conda to install it.

### Pathlib getting file directories

### Multiprocessing in Python

Multiprocessing in Python is a major pain because of the way it was written which is a product of when it was written. It has what is called the Global Interpreter Lock which prevents multiple instances of python from running at any given time. This GIL can be sidestepped by using the Multiprocessing package which is built into the base python distribution. Below is some code that I have gathered and worked with to get it working with some scripts where I needed to speed stuff up.

- to be able to use a function that uses multiple arguments was difficult to figure out but this has worked for me pretty well and I am sharing it here. Most of this comes from these posts: [link 01](https://stackoverflow.com/questions/36587211/easiest-way-to-read-csv-files-with-multiprocessing-in-pandas) [link 02](https://stackoverflow.com/questions/54043682/how-to-use-multiprocessing-with-multiple-arguments-in-python-3) [link 03](https://stackoverflow.com/questions/5442910/python-multiprocessing-pool-map-for-multiple-arguments) [link 04](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows) [link 05](https://stackoverflow.com/questions/53924018/python-multiprocessing-on-windows). These links are all from Stackoverflow.

```Python
import itertools
from multiprocessing import Pool

with Pool(processes=4) as pool:
    dta_list = pool.starmap(
        clean_text, zip(files_RS, itertools.repeat(extra_arg))
    )
```