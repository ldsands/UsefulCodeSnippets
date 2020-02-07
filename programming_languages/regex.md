# Useful Regex Code

## Useful sites

1. https://regex101.com/
1. https://ihateregex.io/
1. https://www.regextester.com/

## Get rid of trailing spaces

```regex
 $
```

## Hyphen work breaks at the end of a line

```regex
[a-z][\-]$[\n][a-z]
or
[\n][^\S]
```

in the business of asking questions. It illustrates not only the impor-
tance of the golden rule for asking questions—Ask what you want
to know, not something else—but also, more important, the ambi-
guities of language and the powerful force of context in interpret-
ing the meaning of questions and answers. Our colleague had

## Two New Lines in a Row

```regex
$[\n]$[\n]
```

Chapter One

The Social Context 
of Question Asking

The precise wording of questions plays a vital role in determining
the answers given by respondents. This fact is not appreciated as
fully as it should be, even in ordinary conversation. For example, 

## New line followed by wording (not two blank line breaks)

```regex
[^\n]$[\n][^\n\n]
```

Chapter One

The Social Context 
of Question Asking

The precise wording of questions plays a vital role in determining
the answers given by respondents. This fact is not appreciated as
fully as it should be, even in ordinary conversation. For example,

for more explicit removal of lines can remove the ones that split sentences using the code below

## Remove new lines in-between a split sentence

```regex
\w$\n^\n^\w
```

questions that clarify their meaning. Sometimes

they only get corrected when expected behavior does not 

## Get the beginning of a article reference

<!--and incomplete but more capible version [^\s]([^\.][a-z+A-Z+,\sa-z+A-Z+.\s]+[\s][0-9]{4}[\.]) -->

```regex
[a-zA-Z]+[,\s]+[a-zA-Z]+[\.][[\s][0-9]{4}
```

Alford, Robert and Roger Friedland. 1985. Powers of Theory: Capitalism, the State and Democracy. New York: Cambridge University Press. Arendt, Hannah. 1958. The Origins of Totalitarianism. Cleveland, OH: World Publishing Company. Banfield, Edward. 1961. Political Influence. New York: Free Press. Beckfield, Jason. 2003. “Inequality in the World Polity: The Structure of International Organization.” American Sociological Review 68: 401–424. 