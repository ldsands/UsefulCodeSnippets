# Useful Python Commands and Code Chunks

## Pandas Commands

### Getting started with pandas

First you have to import pandas. The convention for this is as follows:

```Python
import pandas as pd
```

Note: I usually name my data frames `dta` the python convention is to usually use `df`

To create a data dataframe you can enter the following code:

```Python
dta = pd.DataFrame(
    [['sam', 328], ['ruby', 3213], ['jon', 121]],
    columns=['name', 'score']
)
```
<!-- 
### Importing data


- TODO:
 -->

### Common pandas commands and functions

- When you need to take a data frame and extract all of the observations (rows) that match some value. Where dta is the data frame column_name is the name of the column you're filtering and x is the value you want the observations from the target column to match. Doing this for one column you can do the following:

    ```Python
    dta = dta[dta["column_name"] == x]
    ```

    - Filtering from a list of values is a bit more complicated but the code to do this is pretty easy:

        ```Python
        dta = dta[dta["column_name"].isin(target_list)]
        ```

- For testing you usually do not want to run whatever you're doing on all of your data (unless you don't have too much data). In my case I often have millions of rows to process at a time. To make sure my code is working it is very useful to cut down on the number of rows you process just to see if everything is working right. Below is how I accomplish that. This code takes the first to the 10th row and all of the columns from the dataframe called dta. It then writes over the old dta dataframe with the smaller one.

    ```Python
    # this trims a dataframe from whatever length it was before to just 10 rows
    dta = dta.iloc[0:10,]
    # this is the same but to avoid accidentally leaving this code in my script the text afterwards helps me find it before I use a script into production
    dta = dta.iloc[0:10,] # TESTCODE: remove for production
    # another option is to use the head method to get the top rows
    dta = dta.head(10)  # TESTCODE:
    ```

- Splitting a dataframe into a list can sometimes be very helpful for either breaking up processing over time or (theoretically anyway python is NOT good at parallel processing) for parallel processing. I usually use this for breaking up really long processing times so that I can restart my computer or regain all of my computer's resources for something more intensive. API calls with query limits is a great example of this. I then usually use a for loop to write these to separate files in a subfolder for keeping track of them in my processing.

    ```Python
    # choose your chunk size
    chunk_size = 200000
    # or choose how many dataframes you want
    chunk_size = int(len(dta) / 20)
    # then create the list of dataframes
    dataframe_list = [dta[i:i+chunk_size] for i in range(0,dta.shape[0],chunk_size)]
    ```
    

- In networking creating a weighted two-mode network can be a bit complicated but I found [this question](https://stackoverflow.com/a/44906862) on stackoverflow that address this perfectly. The code given in the answer is as follows: `df = df.groupby(['Col1', 'Col2']).size().reset_index(name='Freq')`.

<!--
## Speed optimizations

SIDE: this doesn't appear to be any faster

Once you get up to tens of thousands some code will be pretty slow. To process all of that data faster you have to use some tricks. Be aware that if you do not have very large data frames using this code will not make any notable difference and sometimes this code can be much more complicated. When you optimize for a script that you don't need to you'll usually end up spending more time writing that faster code then it will take to just process it the slower way.

Filtering a data frame from a list is pretty fast but if you have a large list and a large data frame this will take a long time. An alternative way of processing this is to take the values of a column that you're trying to match and set those values as the index

```Python
dta = dta.set_index("link_id", drop=False)
dta = dta[dta.index.isin(linkid_list)]
```
-->

## Useful Functions

This is a collection of functions that I find to be useful in various scripts.

- Sometimes you need to see the whole dataframe below is a way to do that in just a couple of lines

    ```Python
    def display_full_dataframe(dta):
        """
        displays a dataframe without cutting anything off for being too long
        Arguments:
            dta {dataframe} -- a dataframe you wish to display
        """
        with pd.option_context("display.max_rows", None, "display.max_columns", None):
            print(dta)
    ```

- I have often needed to get the unique number of values in some column, below is some code that I use to do that
    - If you want the unique values as a list (or dataframe) then just replace the `nunique` with `unique`

    ```Python
    # this will give you the number of unique values in the "month_year" column
    dta_small["month_year"].nunique()
    # this gets the number of unique values for every column in the dataframe for each unique value in the "month_year" column
    dta_small.groupby("month_year").nunique()
    # this gets the number of unique values from the "author" column for each unique value found in the "month_year" column
    dta_small.groupby("month_year")["author"].nunique()
    # this gets count for each unique value in the"author" column and puts them into a dataframe for easy viewing result of the  print out are below
    dta_filtered = dta.author.value_counts()
    ```

    ```text
    AutoModerator   7973
    author          7548
    author          7423
    author          7295
                    ...
    author          1
    author          1
    author          1
    author          1
    author          1
    ```

- I have needed to create a list from a dataframe but needed by rows rather than by columns this is how you can do that

    ```Python
    row_list = dta.values.tolist()
    ```

- When you playing with data you don't want to have to reload the data over and over again so you can check to see if whatever you're working on works. Rather than load that data you can check to see if it is already loaded.

    ```Python
    if "dta" in globals(): # or locals for locally defined variables
        print("dta is already loaded")
    else:
        print("you need to load the data")
    ```

- Sometimes you need to add a column that is all of one value you can do this by using assign method. The example below crates a new column where every value in that column is the string testing:

    ```Python
    dta = dta.assign(file="testing")
    ```

- Dealing with dateitmes in python is not too difficult but there are some aspects of datetimes that require rote memorization. Often I want to convert one type of datetime into another. For all of the different formats you can go [here](https://strftime.org/) to find a list. Also below I have an example of converting a column to datetime then outputing a year_month column in this format `1990_01`.

    ```Python
    dta["pd_created_time"] = pd.to_datetime(dta["pd_created_time"])
    dta["month_year"] = pd.to_datetime(dta["pd_created_time"]).dt.strftime("%Y-%m")
    ```

- For network analysis it is useful to be able to convert between an adjacency matrix and an edgelist. The code below ([taken from here](https://stackoverflow.com/a/48219579)) can convert an adjacency matrix in a pandas dataframe into an edgelist:

    ```Python
    import pandas as pd
    import numpy as np
    dta.values[[np.arange(len(dta))]*2] = np.nan
    edgelist = dta.stack().reset_index()
    ```
