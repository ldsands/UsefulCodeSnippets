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

    - filtering from a list of values is a bit more complicated but the code to do this is pretty easy:

        ```Python
        dta = dta[dta["column_name"].isin(target_list)]
        ```

- for testing you usually do not want to run whatever you're doing on all of your data (unless you don't have too much data). In my case I often have millions of rows to process at a time. To make sure my code is working it is very useful to cut down on the number of rows you process just to see if everything is working right. Below is how I accomplish that. This code takes the first to the 10th row and all of the columns from the dataframe called dta. It then writes over the old dta dataframe with the smaller one.

    ```Python
    dta = dta.iloc[0:10,]
    ```

- splitting a dataframe into a list can sometimes be very helpful for either breaking up processing over time or (theoretically anyway python is NOT good at parallel processing) for parallel processing. I usually use this for breaking up really long processing times so that I can restart my computer or regain all of my computer's resources for something more intensive. API calls with query limits is a great example of this. I then usually use a for loop to write these to separate files in a subfolder for keeping track of them in my processing.

    ```Python
    n = 200000  #chunk row size
    dataframe_list = [dta[i:i+n] for i in range(0,dta.shape[0],n)]
    ```

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

- sometimes you need to see the whole dataframe below is a way to do that in just a couple of lines

    ```Python
    with pd.option_context('display.max_rows', None, 'display.max_columns', None):  # more options can be specified also
        print(dta)
    ```

- I have often needed to get the unique number of values in some column, below is some code that I use to do that
    - if you want the unique values as a list (or dataframe) then just replace the `nunique` with `unique`

    ```Python
    # this will give you the number of unique values in the "month_year" column
    dta_small["month_year"].nunique()
    # this gets the number of unique values for every column in the dataframe for each unique value in the "month_year" column
    dta_small.groupby("month_year").nunique()
    # this gets the number of unique values from the "author" column for each unique value found in the "month_year" column
    dta_small.groupby("month_year")["author"].nunique()
    ```
