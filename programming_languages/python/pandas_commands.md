# Pandas Commands

## Getting started with pandas

First you have to import pandas. The convention for this is as follows:

```python
import pandas as pd
```

Note: I usually name my data frames `dta` the python convention is to usually use `df`

To create a data dataframe you can enter the following code:

```python
dta = pd.DataFrame(
    [['sam', 328], ['ruby', 3213], ['jon', 121]],
    columns=['name', 'score']
)
```

## Importing data



## Common pandas commands

- When you need to take a data frame and extract all of the observations (rows) that match some value. Where dta is the data frame column_name is the name of the column you're filtering and x is the value you want the observations from the target column to match. Doing this for one column you can do the following:

    ```python
    dta = dta[dta["column_name"] == x]
    ```

    - filtering from a list of values is a bit more complicated but the code to do this is pretty easy:

        ```python
        dta = dta[dta["column_name"].isin(target_list)]
        ```

- for testing you usually do not want to run whatever you're doing on all of your data (unless you don't have too much data). In my case I often have millions of rows to process at a time. To make sure my code is working it is very useful to cut down on the number of rows you process just to see if everything is working right. Below is how I accomplish that. This code takes the first to the 10th row and all of the columns from the dataframe called dta. It then writes over the old dta dataframe with the smaller one.

    ```python
    dta = dta.iloc[0:10,]
    ```

<!--
## Speed optimizations

TODO: this doesn't appear to be any faster

Once you get up to tens of thousands some code will be pretty slow. To process all of that data faster you have to use some tricks. Be aware that if you do not have very large data frames using this code will not make any notable difference and sometimes this code can be much more complicated. When you optimize for a script that you don't need to you'll usually end up spending more time writing that faster code then it will take to just process it the slower way.

Filtering a data frame from a list is pretty fast but if you have a large list and a large data frame this will take a long time. An alternative way of processing this is to take the values of a column that you're trying to match and set those values as the index

```python
dta = dta.set_index("link_id", drop=False)
dta = dta[dta.index.isin(linkid_list)]
```
-->
