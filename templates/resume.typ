#let render-resume(margin: 0.55in, include-interests: false) = {
  set document(title: "Joonwoo Choi's Resume", author: "Joonwoo Choi")
  set page(paper: "a4", margin: margin)
  set text(font: "New Computer Modern", size: 10.5pt, lang: "en")
  set par(justify: false, leading: 0.5em)

  show link: set text(fill: blue.darken(30%))

  let section(title) = {
    v(3pt)
    text(size: 1.15em, weight: "bold")[#upper(title)]
    v(-4pt)
    line(length: 100%, stroke: 0.5pt)
    v(2pt)
  }

  let entry(org, place, role: none, dates: none) = {
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

  let bullets(..items) = {
    set list(marker: [•], indent: 0pt, body-indent: 0.5em, spacing: 0.45em)
    for it in items.pos() [- #it]
  }

  align(center)[
    #text(size: 1.9em, weight: "bold")[Joonwoo Choi] \
    #v(2pt)
    #link("mailto:joonwoo3023@gmail.com")[joonwoo3023\@gmail.com]
    #h(4pt) | #h(4pt)
    #link("https://www.linkedin.com/in/joonwoo-choi-580872229/")[LinkedIn]
    #h(4pt) | #h(4pt)
    #link("https://github.com/askrid")[GitHub]
  ]

  v(4pt)

  section("Education")
  entry(
    "Seoul National University",
    "Seoul, Korea",
    role: "B.S. in Computer Science and Engineering",
    dates: "2020 – 2026",
  )
  [Cumulative GPA: 3.76\/4.3 #h(1em) Major GPA: 3.85\/4.3]

  section("Experience")
  entry(
    "Moloco",
    "Seoul, Korea",
    role: "Software Engineer",
    dates: "Mar 2023 – Jul 2025",
  )
  bullets(
    [Built internal operations tooling full stack (React/TypeScript, Go) and server libraries handling 5M+ QPS.],
    [Built and owned the company-wide A/B testing framework adopted by most engineering and data science teams as the company's primary system for evaluating product performance.],
    [Drove migration of 10+ services onto a new runtime configuration deployment system across 5K+ production pods.],
    [Identified and fixed a cache stampede that was overloading the production database.],
    [Cut \$9K/week in cloud spend to near zero after tracing the cost to a misconfigured multi-regional cloud storage.],
  )

  v(4pt)
  entry(
    "Nodeinfra",
    "Seoul, Korea",
    role: "Software Engineering Intern",
    dates: "Jan 2022 – Mar 2022",
  )
  bullets(
    [Built a decentralized NFT marketplace using React for the web application and Solidity for smart contracts.],
  )

  section("Projects")
  bullets(
    [#link("https://github.com/askrid/kernel")[*Deadline-based Linux DRM GPU Scheduler*]: Extended the kernel's DRM scheduler with an EEVDF-inspired algorithm to prioritize interactive GPU jobs, improving the tail latency.],
    [#link("https://github.com/askrid/xv6-riscv-snu-unmatched")[*OpenSBI Hypervisor*]: Implemented an M-mode trap-and-emulate hypervisor on OpenSBI for xv6 guests running on SiFive FU740-C000.],
    [#link("https://github.com/askrid/multilang-simtrans")[*Language Similarity and Machine Translation Study*]: Built an experiment pipeline to correlate language similarity with translation quality. Fine-tuned NLLB-200 and evaluated 15 language pairs.],
    [#link("https://github.com/askrid/cago")[*Full Stack Toy Project*]: Built a web application with Next.js and Django REST Framework. Set up containerized infrastructure and CI/CD.],
  )

  section("Skills")
  grid(
    columns: (auto, 1fr),
    row-gutter: 0.45em,
    column-gutter: 0.8em,
    strong[Programming], [Go, Python, C, C++, TypeScript/JavaScript, Shell, SQL],
    strong[Tools], [GNU/Linux, Git, Vim],
    strong[Frontend], [React, Next.js, Vite, SWR, MUI],
    strong[Backend], [REST/gRPC APIs, Django, PostgresSQL/MySQL, Redis, Bigtable, BigQuery, Pub/Sub],
    strong[Infrastructure], [GCP, Kubernetes, Docker, Helm, Terraform, Datadog, Sentry],
    strong[Spoken Languages], [Korean (Native), English (Proficient)],
  )

  section("Coursework")
  [Operating Systems (A+), Principle and Practice of Software Development (A+),
    Database (A+), Computer Networks (A0), Natural Language Processing (A0),
    Computer Graphics (A0), Computer Vision (A0), Internet Security (A0),
    Algorithms (A0), System Programming (A0)]

  if include-interests {
    section("Interests")
    [First violin in a university orchestra, freestyle skiing, mountain biking]
  }
}
