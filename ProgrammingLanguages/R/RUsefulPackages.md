# Useful R Packages

A list of useful packages that I use when programming in R

- [Useful R Packages](#useful-r-packages)
    - [Installing packages](#installing-packages)
    - [File storage and usages](#file-storage-and-usages)
    - [Data manipulation and cleaning](#data-manipulation-and-cleaning)
    - [Statistical analysis](#statistical-analysis)
    - [Visualization](#visualization)
    - [Document creation](#document-creation)
    - [Utilities](#utilities)

## Installing packages

This is how I do it (much faster and easier)

1. first i check to see if the package pacman is installed if not then I install it if it is then I load it
1. I then use `pacman::p_load` to install and/or load the packages in a list
1. the `here::here()` command sets the working directory to the location of the script being run
1. below is the code that I use to execute the above steps

```r
if(!"pacman" %in% installed.packages()) install.packages("pacman")
pacman::p_load(here, tidyverse, fst, Hmisc, data.table, fBasics, car, knitr, RStata, multilevel, openxlsx)
here::here()
```

## File storage and usages

- [fst](https://cran.r-project.org/web/packages/fst/index.html)
    - I used this file format for my work on my thesis because the fst file format is both very fast and very compressible
- [openxlsx](https://cran.r-project.org/web/packages/openxlsx/index.html)
    - Useful for both reading and writing excel files when needed
    - Kind of a pain to learn but very powerful

## Data manipulation and cleaning

- [tidyverse](https://www.tidyverse.org/)
    - This is pretty much an all inclusive data manipulation set of packages I mostly use [dplyr](https://dplyr.tidyverse.org/)
    - It makes data manipulation much easier to learn in r
    - Also included [ggplot](https://ggplot2.tidyverse.org/)
- [data.table](https://cran.r-project.org/web/packages/data.table/index.html)
    - This is a lot like dplyr and other packages from the tidyverse but much faster
    - [dtplyr](https://dtplyr.tidyverse.org/) is dplyr written using data.table as a backend for faster speed
- [car](https://cran.r-project.org/web/packages/car/index.html)
    - Very easily readable recoding there are many other ways to do it but I really like this one because of how easy it is to read
        - It also looks more like Stata which is probably why I gravitated toward it when I was first learning R
    - The example below recodes the value of 2 to 0 instead

    ```r
    dta$B1SC3A <- bio$B1SC3A %>% car::recode("2=0")
    ```

## Statistical analysis

- [Hmisc](https://cran.r-project.org/web/packages/Hmisc/index.html)
    - I primarily use this for `Hmisc::describe` a very useful descriptive statistic command for glancing at variables
- [fBasics](https://cran.r-project.org/web/packages/fBasics/index.html)
    - I use this to create basic descriptive statistics table (with markdown output) with the following function (note the use of the knitr and kableExtra packages)

    ```r
    statstbltrans <- function(x){
        pacman::p_load(data.table, fBasics)
        x1 <- x %>% fBasics::basicStats() %>% round(digits = 3)
        x2 <- x1 %>% data.table::transpose()
        colnames(x2) <- rownames(x1)
        rownames(x2) <- colnames(x1)
        x2 <- dplyr::select(x2, Mean, "Standard Deviation" = Stdev, Minimum, Maximum, Missing = NAs)
    }
    dta_table <- statstblcount(dta)
    dta_table <- knitr::kable(dta_table) %>%
        kableExtra::kable_styling("condensed", full_width = F)
    ```

- [multilevel](https://cran.r-project.org/web/packages/multilevel/index.html)
    - I use it for [Sobel Goodman Tests](https://en.wikipedia.org/wiki/Sobel_test) example explanation and code example below
        - Sobel(pred,med,out); Arguments:
            - pred - The predictor or independent variable (X).
            - med - The mediating variable (M).
            - out - The outcome or dependent variable (Y).

    ```r
    bio$Lifestyle_vars <- with(bio, (Smoke_Work + Smoked + Alcohol + Exercise + Fast_Food_Wk + Sugar_Drink_day + FruitsVegg_day + Grains_day + Self_control))
    with(bio, multilevel::sobel(Abuse_Neglect,Lifestyle_vars,Allostatic_Load)
    ```

## Visualization

- [kableExtra](https://cran.r-project.org/web/packages/kableExtra/index.html)
    - This allows for a bit more customization for markdown tables
        - There is an example of this under the [fBasics package](#Statistical-analysis)

## Document creation

- [knitr](https://cran.r-project.org/web/packages/knitr/index.html)
    - Used for "knitting" together rmarkdown files
    - Knitr plus rmarkdown together allow for you to do all of your cleaning, analysis and make your document in one file it is very powerful and if it weren't for my advisor's insistence on using MS Word for editing my thesis I would have done it in rmarkdown
    - See [this website](https://rmarkdown.rstudio.com/) for more details

## Utilities

- [RStata](https://cran.r-project.org/web/packages/RStata/index.html)
    - This is useful for running things in stata from your r scripts it is kind of a pain to use
    - See example below

    ```r
    options("RStata.StataPath"= "\"C:\\Program Files (x86)\\Stata14\\StataSE-64\"")
    options("RStata.StataVersion" = 14.2)
    stata_src <- "
    set more off, permanently
    regress Allostatic_Load NonWhite Female Age Abuse_Neglect Respondent_Edu Child_Neg_Event Smoke_Work Smoked Alcohol Exercise Fast_Food_Wk Sugar_Drink_day FruitsVegg_day Grains_day Self_control Financial_Sit   Adult_Neg_Event Perceived_Inequality_Family Perceived_Stress Life_Satisfaction Partner_Affectual_Solidarity Abuse_Neglect_Adult_Neg_Event
    "
    stata(stata_src, data.in = bio, data.out = TRUE)
    ```

- [here](https://cran.r-project.org/web/packages/here/index.html)
    - Helps with setting working directory no matter the location or operating system
    - See [installation code example](#Installing-packages) for the usage of this package
- [pacman](https://cran.r-project.org/web/packages/pacman/index.html)
    - This makes it incredibly easy to install packages in r along with their required packages
    - See [installation code example](#Installing-packages) for the usage of this package
