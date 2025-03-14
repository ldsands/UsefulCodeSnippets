
// Updated on 2025-02-20 by Levi Sands
// Most of this was copied from [this repo on 2025-02-14](https://github.com/HPDell/typst-starter-journal-article/blob/main/lib.typ)

// https://typst.app/docs/reference/text/text/#parameters-font
// Embedded fonts are Libertinus Serif, New Computer Modern, New Computer Modern Math, and DejaVu Sans Mono
#let uni-font = "Libertinus Serif" // for changing the font for all text
#let font-size = 11pt // default is 11pt or 1 em
// setting the hypenation to false
#set text(font: uni-font, size: font-size) // for changing the font and base font size for all text
// #set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false) // for changing the font and base font size for all text and preventing hyphenation
// #let sans-font = "DejaVu Sans Mono" // should use 9pt for this to have it take about the same space as Libertinus Serif I don't really like this font very much, it is also much larger than the default Libertinus Serif
// #let serif-font = "Libertinus Serif" // my preferred serif font, a lot like times new roman
// #let serif-font = "New Computer Modern"
// #let serif-font = "New Computer Modern Math"

#let author-meta(
    ..affiliation,
    email: none,
    alias: none,
    address: none,
    cofirst: false,
) = {
    let info = (
        "affiliation": affiliation,
    )
    if email != none {
        info.insert("email", email)
    }
    if alias != none {
        info.insert("name", alias)
    }
    if address != none {
        info.insert("address", address)
    }
    if cofirst != none {
        info.insert("cofirst", cofirst)
    }
    info
}

#let default-title(title) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    show: block.with(width: 100%)
    set align(center)
    set text(font: uni-font, size: 1.75em, weight: "bold")
    title
}

#let default-author(author) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    text(author.name)
    super(author.insts.map(it => str(it + 1)).join(","))
    if author.corresponding {
        footnote[
            Corresponding author. Address: #author.address.
            #if author.email != none {
                [Email: #underline(author.email).]
            }
        ]
    }
    if author.cofirst == "thefirst" {
        footnote("cofirst-author-mark")
    } else if author.cofirst == "cofirst" {
        locate(loc => query(footnote.where(body: [cofirst-author-mark]), loc).last())
    }
}

#let default-affiliation(id, address) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    set text(size: 0.8em)
    super([#(id + 1)])
    address
}

#let default-author-info(authors, affiliations) = {
    {
        set align(center)
        set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
        show: block.with(width: 100%)
        authors.map(it => default-author(it)).join(", ")
    }
    let used_affiliations = authors.map(it => it.insts).flatten().dedup().map(it => affiliations.keys().at(it))
    {
        show: block.with(width: 100%)
        set align(center)
        set par(leading: 0.4em)
        used_affiliations
            .enumerate()
            .map(((ik, key)) => {
                default-affiliation(ik, affiliations.at(key))
            })
            .join(linebreak())
    }
}

// default version below I prefer centered version
// #let default-author(author) = {
//   text(author.name)
//   super(author.insts.map(it => str(it+1)).join(","))
//   if author.corresponding {
//     footnote[
//       Corresponding author. Address: #author.address.
//       #if author.email != none {
//         [Email: #underline(author.email).]
//       }
//     ]
//   }
//   if author.cofirst == "thefirst" {
//     footnote("cofirst-author-mark")
//   } else if author.cofirst == "cofirst" {
//     locate(loc => query(footnote.where(body: [cofirst-author-mark]), loc).last())
//   }
// }

// #let default-affiliation(id, address) = {
//   set text(size: 0.8em)
//   super([#(id+1)])
//   address
// }

// #let default-author-info(authors, affiliations) = {
//   {
//     show: block.with(width: 100%)
//     authors.map(it => default-author(it)).join(", ")
//   }
//   let used_affiliations = authors.map(it => it.insts).flatten().dedup().map(it => affiliations.keys().at(it))
//   {
//     show: block.with(width: 100%)
//     set par(leading: 0.4em)
//     used_affiliations.enumerate().map(((ik, key)) => {
//       default-affiliation(ik, affiliations.at(key))
//     }).join(linebreak())
//   }
// }

#let default-abstract(abstract, keywords) = {
    // Abstract and keyword block
    if abstract != [] {
        stack(
            dir: ttb,
            spacing: 1em,
            ..(
                [
                    #set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
                    #heading([Abstract])
                    #abstract
                ],
                if keywords.len() > 0 {
                    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
                    text(weight: "bold", [Key words: ])
                    text([#keywords.join([; ]).])
                } else { none },
            ),
        )
    }
}

#let default-bibliography(bib) = {
    show bibliography: set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    show bibliography: set text(1em)
    show bibliography: set par(first-line-indent: 0em)
    // changed to asa style by Levi Sands
    set bibliography(title: [References], style: "american-sociological-association")
    bib
}

// This allows me to create the bibliography wherever I want (e.g. before appendices)
// must uncomment the 3 bib lines after the body section of the article function to use it like normal
#let bibHere() = {
    show bibliography: set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    show bibliography: set par(first-line-indent: 0em)
    show bibliography: set text(1em)
    bibliography("TypstFiles/bib.bib", title: text[References], full: false, style: "american-sociological-association")
}

#let default-body(body) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    show heading.where(level: 1): it => block(above: 1.5em, below: 1.5em)[
        #set pad(bottom: 2em, top: 1em)
        #it.body
    ]
    set par(first-line-indent: 2em)
    // added this line on 2025-02-21 to prevent hyphenation
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    // added justify by Levi Sands on 2025-02-14
    set par(justify: true)
    set footnote(numbering: "1")
    body
}

#let article(
    // Article's Title
    title: "Article Title",
    // A dictionary of authors.
    // Dictionary keys are authors' names.
    // Dictionary values are meta data of every author, including
    // label(s) of affiliation(s), email, contact address,
    // or a self-defined name (to avoid name conflicts).
    // Once the email or address exists, the author(s) will be labelled
    // as the corresponding author(s), and their address will show in footnotes.
    //
    // Example:
    // (
    //   "Auther Name": (
    //     "affiliation": "affil-1",
    //     "email": "author.name@example.com", // Optional
    //     "address": "Mail address",  // Optional
    //     "name": "Alias Name", // Optional
    //     "cofirst": false // Optional, identify whether this author is the co-first author
    //   )
    // )
    authors: ("Author Name": author-meta("affiliation-label")),
    // A dictionary of affiliation.
    // Dictionary keys are affiliations' labels.
    // These labels show be constent with those used in authors' meta data.
    // Dictionary values are addresses of every affiliation.
    //
    // Example:
    // (
    //   "affiliation-label": "Institution Name, University Name, Road, Post Code, Country"
    // )
    affiliations: ("affiliation-label": "Affiliation address"),
    // The paper's abstract.
    abstract: [],
    // The paper's keywords.
    keywords: (),
    // The bibliography. Accept value from the built-in `bibliography` function.
    bib: none,
    // Templates for the following parts:
    // - `title`: how to show the title of this article.
    // - `author-list`: how to show the list of the authors.
    // - `author`: how to show each author's information.
    // - `affiliation`: how to show the affiliations.
    // - `abstract`: how to show the abstract and keywords.
    // - `bibliography`: how to show the bibliography.
    // - `body`: how to show main text.
    // Please see below for more information.
    template: (:),
    // Paper's content
    body,
) = {
    // Set document properties
    set document(title: title, author: authors.keys())
    show footnote.entry: it => [
        #set par(hanging-indent: 0.54em)
        #set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
        #it.note #it.note.body
    ]
    set footnote(numbering: "*")
    show "cofirst-author-mark": [These authors contributed equally to this work.]

    let template = (
        title: default-title,
        author-info: default-author-info,
        abstract: default-abstract,
        bibliography: default-bibliography,
        body: default-body,
        ..template,
    )

    // Title block
    (template.title)(title)

    set align(left)
    // Restore affiliations' keys for looking up later
    // to show superscript labels of affiliations for each author.
    let inst_keys = affiliations.keys()

    // Find co-fisrt authors
    let cofirst_index = authors
        .values()
        .enumerate()
        .filter(meta => "cofirst" in meta.at(1) and meta.at(1).at("cofirst") == true)
        .map(it => it.at(0))

    let author_list = ()

    // Authors and affiliations
    // Authors' block
    // Process the text for each author one by one
    for (ai, au) in authors.keys().enumerate() {
        let author_list_item = (
            name: none,
            insts: (),
            corresponding: false,
            cofirst: "no",
            address: none,
            email: none,
        )

        let au_meta = authors.at(au)
        // Write auther's name
        let aname = if au_meta.keys().contains("name") and au_meta.name != none {
            au_meta.name
        } else {
            au
        }
        author_list_item.insert("name", aname)

        // Get labels of author's affiliation
        let au_inst_id = au_meta.affiliation.pos()
        let au_inst_primary = ""
        // Test whether the author belongs to multiple affiliations
        if type(au_inst_id) == array {
            // If the author belongs to multiple affiliations,
            // record the first affiliation as the primary affiliation,
            au_inst_primary = affiliations.at(au_inst_id.first())
            // and convert each affiliation's label to index
            let au_inst_index = au_inst_id.map(id => inst_keys.position(key => key == id))
            // Output affiliation
            author_list_item.insert("insts", au_inst_index)
        } else if (type(au_inst_id) == str) {
            // If the author belongs to only one affiliation,
            // set this as the primary affiliation
            au_inst_primary = affiliations.at(au_inst_id)
            // convert the affiliation's label to index
            let au_inst_index = inst_keys.position(key => key == au_inst_id)
            // Output affiliation
            author_list_item.insert("insts", (au_inst_index,))
        }

        // Corresponding author
        if au_meta.keys().contains("email") or au_meta.keys().contains("address") {
            author_list_item.insert("corresponding", true)
            let address = if not au_meta.keys().contains("address") or au_meta.address == "" {
                au_inst_primary
            } else { au_meta.address }
            author_list_item.insert("address", address)

            let email = if au_meta.keys().contains("email") and au_meta.email != none {
                au_meta.email
            } else { none }
            author_list_item.insert("email", email)
        }

        if cofirst_index.len() > 0 {
            if ai == 0 {
                author_list_item.insert("cofirst", "thefirst")
            } else if cofirst_index.contains(ai) {
                author_list_item.insert("cofirst", "cofirst")
            }
        }

        author_list.push(author_list_item)
    }

    (template.author-info)(author_list, affiliations)

    (template.abstract)(abstract, keywords)

    show: template.body

    body

    // Display bibliography.
    // The bibliography puts the bibliography at the end of the document
    // commented out by Levi Sands on 2025-02-14 to use bibHere() instead
    // if bib != none {
    //   (template.bibliography)(bib)
    // }
}

// Added by Levi Sands on 2025-02-14
// Define a function to create a text with a specific color
// example: #redText["This is red text."]
#let blueText(term, color: blue) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    text(color, term)
}

// Added by Levi Sands on 2025-02-14
// Define a function to create a text with a specific color
// example: #blueText["This is blue text."]
#let redText(term, color: red) = {
    set text(font: uni-font, size: font-size, hyphenate: false, ligatures: false)
    text(color, term)
}
