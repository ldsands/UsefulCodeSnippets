// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
//   abstract: [],
  authors: (),
  date: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    paper: "us-letter",
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 25mm),
    numbering: "1",
    number-align: center,
  )

  // Save heading and body font families in variables.
  let body-font = "Linux Libertine"
  let sans-font = "Inria Sans"
//   let included_font = "DejaVuSansMono-Bold.ttf"
//   let included_font = "DejaVuSansMono-BoldOblique.ttf"
//   let included_font = "DejaVuSansMono-Oblique.ttf"
//   let included_font = "DejaVuSansMono.ttf"
//   let included_font = "FiraMath-Regular.otf"
//   let included_font = "IBMPlexSansDevanagari-Regular.ttf"
//   let included_font = "IBMPlexSerif-Regular.ttf"
//   let included_font = "InriaSerif-Bold.ttf"
//   let included_font = "InriaSerif-BoldItalic.ttf"
//   let included_font = "InriaSerif-Italic.ttf"
//   let included_font = "InriaSerif-Regular.ttf"
//   let included_font = "LinLibertine_R.ttf"
//   let included_font = "LinLibertine_RB.ttf"
//   let included_font = "LinLibertine_RBI.ttf"
//   let included_font = "LinLibertine_RI.ttf"
//   let included_font = "New Computer Modern"
//   let included_font = "NewCM10-Bold.otf"
//   let included_font = "NewCM10-BoldItalic.otf"
//   let included_font = "NewCM10-Italic.otf"
//   let included_font = "NewCM10-Regular.otf"
//   let included_font = "NewCMMath-Book.otf"
//   let included_font = "NewCMMath-Regular.otf"
//   let included_font = "NotoColorEmoji.ttf"
//   let included_font = "NotoSansArabic-Regular.ttf"
//   let included_font = "NotoSansSymbols2-Regular.ttf"
//   let included_font = "NotoSerifCJKjp-Regular.otf"
//   let included_font = "NotoSerifCJKsc-Regular.otf"
//   let included_font = "NotoSerifCJKtc-Regular.otf"
//   let included_font = "NotoSerifHebrew-Bold.ttf"
//   let included_font = "NotoSerifHebrew-Regular.ttf"
//   let included_font = "PTSans-Regular.ttf"
//   let included_font = "Roboto-Regular.ttf"
//   let included_font = "TwitterColorEmoji.ttf"
//   let included_font = "Ubuntu-Regular.ttf"
//   let linux_font = "Liberation Mono"
  let linux_font = "Liberation Sans"
//   let linux_font = "Liberation Serif"
//   let linux_font = "DejaVu Sans Mono"
//   let linux_font = "DejaVu Sans"
//   let linux_font = "DejaVu Serif"
//   let linux_font = "Noto Sans"
//   let linux_font = "Noto Serif"
//   let linux_font = "Open Sans"

//   Set body font family.
//   set text(font: body-font, lang: "en")
//   show heading: set text(font: sans-font)
//   set text(font: included_font, lang: "en")
//   show heading: set text(font: included_font)
  set text(font: linux_font, lang: "en")
  show heading: set text(font: linux_font)

  // Title row.
  align(center)[
    // #block(text(font: sans-font, weight: 700, 1.75em, title))
    // #block(text(font: included_font, weight: 700, 1.75em, title))
    #block(text(font: linux_font, weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.email \
        #author.affiliation \
        #author.postal \
        #author.phone
      ]),
    ),
  )

//   // Abstract.
//   pad(
//     x: 2em,
//     top: 1em,
//     bottom: 1.1em,
//     align(center)[
//       #heading(
//         outlined: false,
//         numbering: none,
//         text(0.85em, smallcaps[Abstract]),
//       )
//       #abstract
//     ],
//   )

  // Main body.
  set par(justify: true)

  body

  // // Display bibliography.
  // // note: if you need any content after the bibliography you'll need to comment this section out then use the bibliography function in your document where you want the bibliography to appear.
  // if bibliography-file != none {
  //   pagebreak()
  //   show bibliography: set text(10pt)
  //   // styles I use for easy access: american-sociological-association, apa, mla
  //   bibliography(bibliography-file, title: text(10pt)[References], full: false, style: "american-sociological-association")
  }
}

// if bibliography-file != none {
//   #let bibHere() = {
//     pagebreak()
//     show bibliography: set text(10pt)
//     // styles I use for easy access: american-sociological-association, apa, mla
//     bibliography(bibliography-file, title: text(10pt)[References], full: false, style: "american-sociological-association")
//   }
// }

#let bibHere() = {
  // The path to a bibliography file if you want to cite some external works.
  // bibliography-file: none,
  // bibliography-file: "TypstFiles/bib.bib",
  // pagebreak()
  // show bibliography: set text(10pt)
  // styles I use for easy access: american-sociological-association, apa, mla
  // bibliography("TypstFiles/bib.bib", title: text(10pt)[References], full: false, style: "american-sociological-association")
  bibliography("TypstFiles/bib.bib", title: text[References], full: false, style: "american-sociological-association")
}

#let blueText(term, color: blue) = {
  text(color, term)
}
#let redText(term, color: red) = {
  text(color, term)
}