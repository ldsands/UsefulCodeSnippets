# Typst

- [Typst](#typst)
    - [Typst Resources](#typst-resources)
    - [Typst Citation Notes](#typst-citation-notes)
    - [Typst Random Notes](#typst-random-notes)

## Typst Resources

- [Typst](https://typst.app/) "A new markup-based typesetting system that is powerful and easy to learn." It is meant to be something like a replacement for LaTeX.
- [Typst Documentation](https://typst.app/docs)
- If you sign in and then use the [same link as the homepage](https://typst.app/) you can generate or select templates to use in your projects that you can work on locally.

## Typst Citation Notes

- In the `SandsTemplate.typ` file I've included a bibliography function `bibHere` that places the bibliography at the location of the function. This allows for putting content such as appendices after the bibliography
- To cite an item you can do it one of two ways:
    - The "easy" way:`@kara_sex_2009`
    - The verbose way allows for more options: `#cite(<kara_sex_2009>)`
        - To suppress the author name you can use this as a template: `#cite(<kara_sex_2009>, form: "prose")`
        - To add page numbers or something similar: `@kara_sex_2009[p.~7]` or `#cite(<kara_sex_2009>, supplement: " p.~7")`

## Typst Random Notes

- You should use a template file to house the code needed to make styles and other customizations
    - As of 2023-11-16 I haven't figured out how to use a template in a different directory as the Typst file.
