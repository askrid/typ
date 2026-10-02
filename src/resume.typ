#import "../templates/resume.typ": (
  bullets, entry, render-resume, resume-header, section, skills,
)

#show: render-resume.with(
  title: "Joonwoo Choi's Resume",
  author: "Joonwoo Choi",
  size: 10pt,
)

#{
  resume-header("Joonwoo Choi", [
    #link("mailto:joonwoo3023@gmail.com")[joonwoo3023\@gmail.com]
    #h(4pt) | #h(4pt)
    #link("https://www.linkedin.com/in/joonwoo-choi-580872229/")[LinkedIn]
    #h(4pt) | #h(4pt)
    #link("https://github.com/askrid")[GitHub]
  ])

  v(4pt)

  section("Experience")
  entry(
    "Nitrode",
    "Remote (San Francisco, California)",
    role: "Software Engineer (Contract)",
    dates: "Sep 2026 – Present",
  )
  bullets(
    [Sole engineer for a platform serving 1,000+ contractors worldwide.],
    [Built an OpenAI-compatible streaming gateway with scoped access and spending limits enforced across concurrent requests.],
    [Built Stripe and Wise payout flows with idempotent processing and reconciliation to prevent duplicate payments and recover from partial failures.],
    [Built queued email delivery with retries, deduplication, and operator tools to diagnose failures and resend emails.],
  )

  v(4pt)
  entry(
    "Moloco",
    "Seoul, Korea",
    role: "Software Engineer (Full-time)",
    dates: "Mar 2023 – Jul 2025",
  )
  bullets(
    [Built full-stack internal tools (React/TypeScript, Go) and libraries for services handling 5M+ QPS.],
    [Built and owned the company-wide A/B testing framework for real-time bidding logic and ML model changes.],
    [Drove migration of 10+ services onto a new runtime configuration deployment system across 5K+ production pods.],
    [Owned project infrastructure and production operations, including monitoring and day-to-day troubleshooting.],
    [Identified and fixed a cache stampede that was overloading the production database.],
    [Cut cloud storage costs from \$9K/week to near zero by correcting a multi-region storage misconfiguration.],
  )

  v(4pt)
  entry(
    "Nodeinfra",
    "Seoul, Korea",
    role: "Software Engineer (Intern)",
    dates: "Jan 2022 – Mar 2022",
  )
  bullets(
    [Built a decentralized NFT marketplace using React for the web application and Solidity for smart contracts.],
  )

  section("Projects")
  bullets(
    [#link("https://github.com/askrid/kernel")[*Deadline-based Linux DRM GPU Scheduler*]: Extended the kernel's DRM scheduler with an EEVDF-inspired algorithm to prioritize interactive GPU jobs, reducing tail latency.],
    [#link("https://github.com/askrid/xv6-riscv-snu-unmatched")[*OpenSBI Hypervisor*]: Implemented an M-mode trap-and-emulate hypervisor on OpenSBI for xv6-riscv guests running on SiFive FU740-C000.],
    [#link("https://github.com/askrid/multilang-simtrans")[*Language Similarity and Machine Translation Study*]: Built an experiment pipeline to correlate language similarity with translation quality. Fine-tuned NLLB-200 and evaluated 15 language pairs.],
    [#link("https://github.com/askrid/cago")[*Full Stack Toy Project*]: Built a web application with Next.js and Django REST Framework. Set up containerized infrastructure and CI/CD.],
  )

  section("Skills")
  skills(
    strong[Programming],
    [Go, Python, C, C++, TypeScript, JavaScript, Shell, SQL],
    strong[Backend & Data],
    [Distributed systems, REST/gRPC APIs, PostgreSQL, MySQL, Redis, BigQuery],
    strong[Infrastructure],
    [GCP, Kubernetes, Docker, Helm, Terraform, Datadog, Sentry],
    strong[Frontend],
    [React, Next.js],
    strong[Development Tools],
    [GNU/Linux, Git, Vim],
    strong[Spoken Languages],
    [Korean (Native), English (Proficient)],
  )

  section("Education")
  entry(
    "Seoul National University",
    "Seoul, Korea",
    role: "B.S. in Computer Science and Engineering",
    dates: "Mar 2020 – Aug 2026",
  )
  [Cumulative GPA: 3.76\/4.3 #h(1em) Major GPA: 3.85\/4.3]
  parbreak()
  [Coursework: Operating Systems (A+), Database (A+), Software Engineering (A+),
    Computer Networks (A0), Algorithms (A0), System Programming (A0),
    Internet Security (A0), Natural Language Processing (A0)]
}
