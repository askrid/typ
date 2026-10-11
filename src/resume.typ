#import "../templates/resume.typ": (
  bullets, entry, render-resume, resume-header, section, skills,
)

#show: render-resume.with(
  title: "Joonwoo Choi's Resume",
  author: "Joonwoo Choi",
  margin: 0.5in,
  size: 10pt,
)

#{
  set par(spacing: 0.9em)

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
    "Remote",
    role: "Software Engineer (Contract)",
    dates: "Sep 2026 – Present",
  )
  bullets(
    [Sole engineer responsible for building and running a game-development data platform for AI training and evaluation, serving 1,000+ contractors worldwide.],
    [Built payout workflows with duplicate-payment safeguards and recovery from partial failures. Implemented a streaming AI gateway enforcing scoped access and spending limits across concurrent requests.],
  )

  v(4pt)
  entry(
    "Moloco",
    "Seoul, South Korea",
    role: "Software Engineer",
    dates: "Mar 2023 – Jul 2025",
  )
  bullets(
    [Designed and implemented a runtime configuration system for 6,000+ globally distributed production pods. Used to apply emergency configuration changes in critical services.],
    [Built a company-wide A/B testing platform with the data science team, supporting 200+ concurrent experiments on real-time ad bidding and ML models in services handling 5M+ QPS.],
    [Led the migration of 10+ production services to the standard configuration system, coordinating with 5+ teams across the US and South Korea.],
    [Diagnosed and fixed production performance and cost issues, eliminating database query spikes caused by cache stampedes and cutting cloud storage costs from \$9,000/week to near zero.],
  )

  v(4pt)
  entry(
    "Nodeinfra",
    "Seoul, South Korea",
    role: "Software Engineer (Intern)",
    dates: "Jan 2022 – Mar 2022",
  )
  bullets(
    [Built a decentralized NFT marketplace with a Solidity smart contract that let buyers purchase fractional ownership of high-value NFTs.],
  )

  section("Projects")
  bullets(
    [#link("https://github.com/askrid/kernel")[*Deadline-based Linux DRM GPU Scheduler*]: Implemented an EEVDF-inspired scheduling policy in the Linux DRM GPU scheduler. Reduced interactive p99 latency from 167 ms to 24 ms under oversubscription in synthetic Vulkan benchmarks, while preserving proportional GPU sharing.],
    [#link("https://github.com/askrid/xv6-riscv-snu-unmatched")[*OpenSBI Hypervisor for xv6-riscv*]: Collaborated with #link("https://csl.snu.ac.kr/")[SNU Systems Software & Architecture Lab] to run xv6-riscv on SiFive FU740-C000. Independently designed and implemented an OpenSBI trap-and-emulate hypervisor, preserving kernel functionality with minimal overhead.],
    [#link("https://github.com/askrid/multilang-simtrans")[*Language Similarity and Machine Translation Study*]: Built an experiment pipeline to correlate language similarity with translation quality. Fine-tuned NLLB-200 and evaluated 15 language pairs, finding a strong correlation between typological similarity and fine-tuned COMET scores (Spearman ρ ≈ 0.90).],
  )

  section("Skills")
  skills(
    strong[Technical],
    [Go, C, C++, Python, TypeScript, SQL, Linux, GCP, Kubernetes, Docker, Terraform, Datadog, PostgreSQL, MySQL, Redis, BigQuery, React, Next.js],
    strong[Language],
    [Korean (Native), English (Proficient)],
  )

  section("Education")
  set par(spacing: 6pt, leading: 0.6em)
  entry(
    "Seoul National University",
    "Seoul, South Korea",
    role: "B.S. in Computer Science and Engineering, cum laude",
    dates: "Mar 2020 – Aug 2026",
  )
  [Cumulative GPA: 3.76\/4.3 #h(1em) Major GPA: 3.85\/4.3]
  parbreak()
  [Relevant Coursework: Operating Systems (A+), Database (A+), Software Engineering (A+), Algorithms (A),
    Computer Architecture (A), System Programming (A), Computer Networks (A), Computer Graphics (A)]
  parbreak()
  [Activities: First violin, #link("https://www.snupo.org/")[Seoul National University Philharmonic Orchestra (SNUPO)].]

  v(12pt)
  entry(
    "Sehwa High School",
    "Seoul, South Korea",
    role: "High School Diploma",
    dates: "Mar 2017 – Feb 2020",
  )
  [Academic Excellence Award (Highest Honors)]
  parbreak()
  [CSAT (2020 admission): Perfect scores in Korean (0.16% of candidates), math (Ga track, 0.58%), and English.]
}
