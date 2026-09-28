#let question-font = "Arial"
#let ink = rgb("#334b5c")

#let questionnaire(title: none, subtitle: none, body) = [
  #set document(title: title)
  #set page(
    paper: "a4",
    margin: (x: 24mm, top: 23mm, bottom: 22mm),
    numbering: "1",
  )
  #set text(font: "Libertinus Serif", size: 11pt, lang: "en")
  #set par(leading: 0.72em, spacing: 0.85em)

  #show link: set text(fill: rgb("#1558a6"))
  #show link: underline

  #set heading(numbering: none)
  #show heading.where(level: 1): it => block(
    above: 14pt,
    below: 12pt,
    sticky: true,
  )[
    #text(size: 21pt, weight: "regular", fill: ink)[#it.body]
    #v(5pt)
    #line(length: 100%, stroke: 0.5pt + luma(78%))
  ]
  #show heading.where(level: 2): it => block(
    above: 17pt,
    below: 11pt,
    sticky: true,
  )[
    #set par(leading: 0.5em)
    #text(
      font: question-font,
      size: 10pt,
      weight: "bold",
      fill: luma(15%),
    )[#it.body]
  ]

  #text(size: 27pt)[#title]
  #v(0pt)
  #align(right)[
    #text(font: question-font, size: 10pt, fill: ink)[#subtitle]
  ]

  #body
]

#let data-table(headers: (), ..cells) = table(
  columns: (1.4fr, 1fr, 1fr, 1fr),
  align: (left, right, right, right),
  inset: (x: 7pt, y: 6pt),
  stroke: none,
  table.hline(stroke: 0.5pt + luma(70%)),
  table.header(
    ..headers.map(label => text(
      font: question-font,
      size: 9pt,
      fill: ink,
      label,
    )),
  ),
  table.hline(stroke: 0.4pt + luma(85%)),
  ..cells.pos(),
  table.hline(stroke: 0.5pt + luma(70%)),
)
