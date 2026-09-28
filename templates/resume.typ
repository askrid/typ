#let render-resume(title: none, author: none, margin: 0.55in, body) = {
  set document(title: title, author: author)
  set page(paper: "a4", margin: margin)
  set text(font: "New Computer Modern", size: 10.5pt, lang: "en")
  set par(justify: false, leading: 0.5em)
  show link: set text(fill: blue.darken(30%))
  body
}

#let section(title) = {
  v(3pt)
  text(size: 1.15em, weight: "bold")[#upper(title)]
  v(-4pt)
  line(length: 100%, stroke: 0.5pt)
  v(2pt)
}

#let entry(org, place, role: none, dates: none) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    strong(org), place,
  )
  if role != none or dates != none {
    grid(
      columns: (1fr, auto),
      align: (left, right),
      emph(role), text(size: 0.95em)[#dates],
    )
  }
  v(2pt)
}

#let bullets(..items) = {
  set list(marker: [•], indent: 0pt, body-indent: 0.5em, spacing: 0.45em)
  for it in items.pos() [- #it]
}

#let resume-header(name, contacts) = align(center)[
  #text(size: 1.9em, weight: "bold")[#name] \
  #v(2pt)
  #contacts
]

#let skills(..cells) = grid(
  columns: (auto, 1fr),
  row-gutter: 0.45em,
  column-gutter: 0.8em,
  ..cells.pos(),
)
