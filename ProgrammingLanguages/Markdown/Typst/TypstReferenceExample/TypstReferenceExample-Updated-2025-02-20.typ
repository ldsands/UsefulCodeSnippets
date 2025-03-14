#import "SandsTemplate-Updated-2025-02-20.typ": *

#show: article.with(
    title: "Typst Reference Example",
    authors: (
        "Author One": author-meta(
            "UIowa",
            "USU",
            email: "levi-sands@uiowa.edu",
        ),
        "Author Two": author-meta(
            "UIowa",
            cofirst: false,
        ),
    ),
    affiliations: (
        "UIowa": "University of Iowa",
        "USU": "Utah State University",
    ),
    abstract: [Et anim et ullamco sunt ullamco. Pariatur id eiusmod anim do Lorem officia. Nostrud pariatur ad et anim sit duis ullamco cillum nulla voluptate quis. Ipsum magna eu ullamco ad. In non sunt ullamco incididunt aliqua nostrud duis officia ea.],
    // date: "2025-02-20",
    keywords: ("Typst", "Template", "Journal Article"),
    bib: bibliography("TypstFiles/bib.bib"),
)

= Introduction

For paragraph settings you can change the padding around the text such as line spacing or the space between paragraphs. Example code is below.

#set par(
    first-line-indent: 1em,
    spacing: 1em,
    justify: true,
)

Tempor deserunt anim exercitation ut amet eu in nostrud. Aliquip exercitation id elit voluptate non velit ad. Incididunt aliqua non id fugiat eu mollit ullamco. Ut ea ullamco Lorem sint est Lorem ad Lorem cillum amet id et duis. Proident ea laboris amet labore consequat.

Exercitation elit sint fugiat cupidatat elit officia Lorem eu commodo culpa ullamco ipsum. Fugiat dolore laboris est nostrud et magna deserunt veniam eu excepteur. Sit cupidatat mollit quis cupidatat ex fugiat tempor quis dolor. Qui anim pariatur ad consequat et. Culpa anim elit laboris reprehenderit velit nisi ad duis adipisicing. Quis laborum sint magna elit. Ea ad incididunt duis aliquip.

Nostrud officia proident culpa eiusmod proident minim. Consectetur amet veniam irure quis voluptate. Sunt esse nostrud mollit deserunt dolore nulla amet adipisicing commodo proident duis. Fugiat sit elit ex id quis veniam. Id veniam nisi consectetur irure nostrud et mollit. Dolore Lorem mollit fugiat fugiat culpa minim do nostrud sint ad Lorem dolor proident. Labore voluptate elit cupidatat amet magna commodo non amet esse fugiat.

Veniam exercitation deserunt proident pariatur eiusmod tempor et. Nostrud dolor aliquip minim reprehenderit minim aute tempor. Ullamco irure labore excepteur non esse do labore ut fugiat deserunt sunt. Cupidatat ullamco dolor fugiat Lorem et laborum velit in incididunt ut elit ea ea.

Enim consectetur in non reprehenderit ullamco exercitation commodo duis esse. Deserunt ut velit consequat culpa eiusmod cupidatat quis incididunt elit. Sit nisi ullamco sit aliquip proident.

#highlight[Highlighting text]

#highlight(fill: green)[Highlighting text]

= Meat and Alternative Meat Terms and Their Uses

Note that this table (@terms_table) was created only from press releases

#figure(
    table(
        // if not using figure must add a "#" before table
        columns: (auto, auto, auto, auto, auto, auto, auto),
        [*term(s):*], [*Inc*], [*Inc Aligned*], [*Chl*], [*Chl Aligned*], [N Texts], [Count],
        "cell based", "Yes", "", "", "Yes", "98", "485",
        "(cell) cultured meat", "Yes", "Yes", "", "Yes", "27", "57",
        "clean meat", "Yes", "Yes", "", "Yes", "115", "649",
        "conventional meat", "", "Yes", "Yes", "Yes", "117", "233",
        "cultivated meat ", "", "", "", "Yes", "148", "999",
        "fake meat", "", "Yes", "", "Yes", "57", "180",
        "imitation meat", "", "Yes", "", "", "5", "6",
        "in vitro", "", "Yes", "", "Yes", "6", "7",
        "lab grown", "", "Yes", "", "Yes", "21", "84",
        "meat alternative|alternative meat", "Yes", "Yes", "Yes", "Yes", "84", "87",
        "meat substitute", "Yes", "Yes", "", "", "15", "17",
        "mock meat", "", "", "", "Yes", "5", "7",
        "plant based meat", "Yes", "Yes", "Yes", "Yes", "462", "1792",
        "real meat", "Yes", "Yes", "", "Yes", "25", "42",
        "synthetic meat", "", "Yes", "", "", "11", "17",
        "vegan meat", "", "", "", "", "", "",
        "vegetarian meat", "", "", "", "", "", "",
        "Totals", "", "", "", "", "", "",
    ),
    caption: [caption for the table],
) <terms_table>

@timeline to use the figure here and reference it in the document in a way that updates it when there is any change

#figure(
    image("pics/TimelineOfMajorEvents-Updated-2025-02-07.svg", width: 100%),
    caption: [caption for the figure],
) <timeline> // use @timeline to use the figure's number in the text can be used with tables too

- Usage Notes:
    - cell based
        - only one use by tyson
        - by Chl aligned used to talk about cell cultured meat
    - (cell) cultured meat:
        - always seems to refer to meat grown in a lab
        - Used mostly by Chl aligned mostly neutral otherwise
    - clean meat
        - mostly used by Chl aligned as a marketing term for cell cultured meat
    - conventional meat
        - almost all Chl aligned to refer to animal based meats
    - cultivated meat
        - all Chl aligned refer to cell cultured meat
    - fake meat
        - only one not Chl aligned
        - refers to both plant based and cell cultured meats
    - imitation meat
        - only used by Inc aligned
    - in vitro
        - only two Inc aligned
        - mostly used as a synonym for cell cultured meat
    - lab grown
        - when used by Inc aligned, refers to cell cultured meat often accompanied by fake meat
        - when used by Chl aligned, refers to cell cultured meat often for testing consumer thoughts about it
    - meat alternative|alternative meat
        - for Inc they talk about customer demand for meat alternatives
        - for Inc aligned they use meat alternatives often with plant based or fake or synthetic
        - Chl used 3 times to talk about their product as a category
        - Chl aligned also used it to talk about meat alternatives as a category
    - meat substitute
        - Inc use to talk about the category especially about demand for meat substitutes
        - Inc aligned use to talk about their product as a category and to paint the category as fake or deceptive etc.
    - mock meat
        - used to talk about vegetarian/vegan meat alternatives
    - plant based meat
        - the majority are used by Chl and Chl aligned
        - Inc aligned seem to use this in close proximity to fake or processed or something similar
    - real meat
        - Inc aligned use to contrast with meat alternatives
        - Inc use it to talk about their meat alternatives as favorably comparable to "real meat"
        - Chl aligned use to talk about cell-based meats as real meat without some negative associated with "real meat"
    - synthetic meat
        - only used by Inc aligned
    - vegan meat
    - vegetarian meat
- Not included above
    - franken (food) was a criticism targeted at companies for using genetically modified animal food in the early 2000s

== Meat and Alternative Meat Terms Usage Quotes

- (cell) cultured meat
    - Tyson (14f050d7): "tsn invested food tech startup memphis meats leader cultured_meat produced directly animal cells"
    - CCF (fc38261d): "cell cultured_meat gain market share claiming healthier real meat"
- clean meat
- conventional meat
- cultivated meat
- fake meat
- imitation meat
- in vitro
- lab grown
- meat alternative|alternative meat
- meat substitute
- mock meat
- plant based meat
- real meat
- synthetic meat
- vegan meat
- vegetarian meat

// cell based
// cell cultured
// clean meat
// cultured meat
// fake meat
// imitation meat
// in vitro
// lab grown
// meat alternative
// alternative meat
// meat substitute
// mock meat
// plant based meat
// real meat
// synthetic meat
// vegan meat
// vegetarian meat

== Different ways to cite sources

- #cite(<kara_sex_2009>, form: "prose")
- @kara_sex_2009
- @quinones_dreamland_2016
- @hagan_darfur_2009

== Quotations

Testing the quotation command. The quotation is below

You can adjust the amount of space between the quote and the attribution with the "pad" parameter. The default is 1em. (below you can see the code you'd need to use to change this)

// the line below makes it so you don't need the "block: true," in each quote
#set quote(block: true)
// the line below makes the quote expand closer to the width of the page
#show quote: set pad(x: 0.75em)
// the line below makes the space above and below the quote block much smaller
#show quote: set block(above: 2%, below: 2%)

#quote(
    attribution: [from the Henry Cary literal translation of 1897],
)[I seem, then, in just this little thing to be wiser than this man at any rate, that what I do not know I do not think I know either.]

// quote template
#quote(
    // XXXX
    attribution: [XXXX XXXX-XX],
)["XXXX"]

#pagebreak()

#bibHere()

#pagebreak()

== Appendix 1: Testing Blue and Red Text

testing my custom color text commands

#redText["This is red text."]

#blueText["This is blue text."]
