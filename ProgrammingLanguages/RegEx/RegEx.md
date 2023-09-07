# Useful Regex Code

A collection of Regex code that I've used on many occasions

- [Useful Regex Code](#useful-regex-code)
    - [Useful sites](#useful-sites)
    - [Get rid of trailing spaces](#get-rid-of-trailing-spaces)
    - [Hyphen work breaks at the end of a line](#hyphen-work-breaks-at-the-end-of-a-line)
    - [Capital at beginning and end of line](#capital-at-beginning-and-end-of-line)
    - [Two New Lines in a Row](#two-new-lines-in-a-row)
    - [New line followed by wording (not two blank line breaks)](#new-line-followed-by-wording-not-two-blank-line-breaks)
    - [Remove new lines in-between a split sentence](#remove-new-lines-in-between-a-split-sentence)
    - [Match everything in between to matches](#match-everything-in-between-to-matches)
    - [Match With Any Number of Words in Any Order](#match-with-any-number-of-words-in-any-order)

## Useful sites

1. https://regex101.com/
1. https://ihateregex.io/
1. https://www.regextester.com/

## Get rid of trailing spaces

```regex
 $
```

example text

```text
in the business of asking questions. It illustrates not only the impor- 
tance of the golden rule for asking questions—Ask what you want 
to know, not something else—but also, more important, the ambi- 
guities of language and the powerful force of context in interpret- 
ing the meaning of questions and answers. Our colleague had 
```

## Hyphen work breaks at the end of a line

```regex
(?<=[a-z])-$\n(?=[a-z])
```

example text

```text
in the business of asking questions. It illustrates not only the impor-
tance of the golden rule for asking questions—Ask what you want
to know, not something else—but also, more important, the ambi-
guities of language and the powerful force of context in interpret-
ing the meaning of questions and answers. Our colleague had
```

## Capital at beginning and end of line

```regex
^[A-Z].+[A-Z]$
```

example text

```text
Hypothesis 4. The fewer companies that a
movement has yet reached, the stronger the
association between CEO liberalism and employee activism.

METHODS

Research Context

The LGBT activist movement in corporate
```

## Two New Lines in a Row

```regex
$[\n]$[\n]
```

example text

```text
Chapter One

The Social Context
of Question Asking

The precise wording of questions plays a vital role in determining
the answers given by respondents. This fact is not appreciated as
fully as it should be, even in ordinary conversation. For example,
```

## New line followed by wording (not two blank line breaks)

```regex
(?<=[a-zA-z0-9,])\n(?=[a-zA-z0-9,])
```

example text

```text
Chapter One

The Social Context 
of Question Asking

The precise wording of questions plays a vital role in determining
the answers given by respondents. This fact is not appreciated as
fully as it should be, even in ordinary conversation. For example,

for more explicit removal of lines can remove the ones that split sentences using the code below
```

## Remove new lines in-between a split sentence

case sensitive

```regex
[a-z]$\n+[a-z]

[a-z]$\n^\n^[a-z]
```

case doesn't matter

```regex
\w$\n^\n^\w
```

example text

```text
questions that clarify their meaning. Sometimes

they only get corrected when expected behavior does not 
```

<!--
## Get the beginning of a article reference

and incomplete but more capable version [^\s]([^\.][a-z+A-Z+,\sa-z+A-Z+.\s]+[\s][0-9]{4}[\.])

```regex
[a-zA-Z]+[,\s]+[a-zA-Z]+[\.][[\s][0-9]{4}
```

example text

```text
Alford, Robert and Roger Friedland. 1985. Powers of Theory: Capitalism, the State and Democracy. New York: Cambridge University Press. Arendt, Hannah. 1958. The Origins of Totalitarianism. Cleveland, OH: World Publishing Company. Banfield, Edward. 1961. Political Influence. New York: Free Press. Beckfield, Jason. 2003. “Inequality in the World Polity: The Structure of International Organization.” American Sociological Review 68: 401–424.
```
-->

## Match everything in between to matches

I don't totally understand how this works but when you put what you're looking for on either side of the "middle section" it will only select that text

If you want to find something before your targeted text then replace the `study\/manual\/` with the match you want before your target text and replace the `\/` what what you want to find after your target text

```{regex}
(?<=study\/manual\/).*(?=\/)
```

example text

```text
https://www.lds.org/study/manual/general-handbook/title-page?lang=eng"
```

## Match With Any Number of Words in Any Order

This will return a match (for example when you use dta.col_name.str.contains("RegEx statement", regex=True, case=False) in a python pandas dataframe) when a given string contains all three words in any order with any amount of characters between them. The first RegEx statement below means: match if the string contains Reprehenderit AND incididunt AND Ullamco. The way I've used it is to get True or False return while using python. The second line of RegEx shown below is an example of how you can also use normal RegEx syntax to make the query more complicated (like checking for Reprehenderit OR fugiat AND incididunt AND Ullamco). You can get whole words using `\b` in the statement you can find more about there [here in a StackOverflow post](https://stackoverflow.com/a/74180275/8396684).

```regex
(?=.*Reprehenderit)(?=.*incididunt)(?=.*Ullamco)
(?=.*(Reprehenderit|fugiat))(?=.*incididunt)(?=.*Ullamco)
```

example text

```text
Reprehenderit qui fugiat excepteur fugiat non aliqua incididunt quis fugiat adipisicing. Ullamco mollit aliqua aliquip do aliqua. Lorem nisi id et velit in incididunt commodo velit incididunt reprehenderit aliquip mollit. Mollit sunt laborum esse sint. Excepteur excepteur fugiat nulla cupidatat quis. Quis sunt sint veniam laborum consectetur officia Lorem aute dolore est. Sit sit labore deserunt excepteur deserunt amet minim ex.
```
