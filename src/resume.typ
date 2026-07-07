#set document(title: "Joonwoo Choi's Resume", author: "Joonwoo Choi")
#set page(paper: "a4", margin: 0.7in)
#set text(font: "New Computer Modern", size: 11pt, lang: "en")
#set par(justify: false, leading: 0.6em)

#show link: set text(fill: blue.darken(30%))

#let section(title) = {
  v(6pt)
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

// Tight bullet list.
#let bullets(..items) = {
  set list(marker: [•], indent: 0pt, body-indent: 0.5em, spacing: 0.55em)
  for it in items.pos() [- #it]
}

// ---- Header ----
#align(center)[
  #text(size: 1.9em, weight: "bold")[Joonwoo Choi] \
  #v(2pt)
  #link("mailto:joonwoo3023@gmail.com")[joonwoo3023\@gmail.com]
  #h(4pt) | #h(4pt)
  #link("https://www.linkedin.com/in/joonwoo-choi-580872229/")[LinkedIn]
  #h(4pt) | #h(4pt)
  #link("https://github.com/askrid")[GitHub]
]

#v(4pt)

// ---- Education ----
#section("Education")
#entry(
  "Seoul National University", "Seoul, Korea",
  role: "B.S. in Computer Science and Engineering",
  dates: "Feb 2020 – Aug 2026",
)
Cumulative GPA: 3.76\/4.3 #h(1em) Major GPA: 3.85\/4.3

// ---- Experience ----
#section("Experience")

#entry(
  "Moloco", "Seoul, Korea",
  role: "Software Engineer",
  dates: "Mar 2023 – Jul 2025",
)
#bullets(
  [Built and maintained a company wide A/B testing framework used across product and infrastructure teams.],
  [Built, maintained, and migrated a runtime configuration deployment system serving 5K+ pods in production.],
  [Reduced infrastructure costs by improving API cache performances and optimizing cloud resources.],
  [Worked full-stack: React/TypeScript frontend, Go backend, and Go server libraries handling 5M+ concurrent requests/second.],
)

#v(4pt)

#entry(
  "Nodeinfra", "Seoul, Korea",
  role: "Software Engineering Intern",
  dates: "Jan 2022 – Mar 2022",
)
#bullets(
  [Built a decentralized NFT marketplace (web app and smart contracts) using React and Solidity.],
)

// ---- Projects ----
#section("Projects")
#bullets(
  [*Deadline-based Linux DRM GPU Scheduler*: Extended the DRM scheduler with an EEVDF-inspired algorithm, improving interactive tail latency.],
  [*OpenSBI Hypervisor*: Implemented an M-mode trap-and-emulate hypervisor on OpenSBI for xv6 guests running on SiFive FU740-C000.],
)

// ---- Skills ----
#section("Skills")
#grid(
  columns: (auto, 1fr),
  row-gutter: 0.5em,
  column-gutter: 0.8em,
  strong[Programming], [C, Go, Python, TypeScript/JavaScript, C++],
  strong[Tools], [GNU/Linux, Git, Vim],
  strong[Languages], [Korean (Native), English (Proficient)],
)

// ---- Coursework ----
#section("Coursework")
Operating Systems (A+), Principle and Practice of Software Development (A+),
Database (A+), Computer Networks (A0), Natural Language Processing (A0),
Computer Graphics (A0), Computer Vision (A0), Internet Security (A0),
Algorithms (A0), Logic Design (A0), System Programming (A0)
