# Useful Python Modules

## Random Modules

- docx2txt
    - this module converts docx files into plain text then you can print it out or write it to a txt file etc
        - sometimes very handy for student papers to all be in the same format
    - pip install docx2txt
    - [see this script](useful_scripts/docx_to_txt.py) for an implementation that takes all docx files in the local folder and converts them to txt files
    
    ```python
    text = docx2txt.process(file)
    ```


## PySpark

This is a big data analysis packages that requires a bit of setup

- you need to install the Java JDK

```PowerShell
choco install jdk8
```
