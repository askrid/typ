#import "../templates/questionnaire.typ": data-table, questionnaire

#show: questionnaire.with(
  title: [Written interview],
  subtitle: [
    Joonwoo Choi \
    Software Developer (Backend SaaS) at Canonical
  ],
)

= Engineering experience

== What kinds of software projects have you worked on before? Which operating systems, development toolchains, languages, databases?

I worked full time at Moloco from March 2023 to July 2025, building infrastructure for
real-time bidding (RTB) in digital advertising. My main projects were an A/B testing
platform and a runtime configuration system. I worked in Go, built interfaces in React and
TypeScript, and took responsibility for infrastructure and production operations. The data
stack included MySQL, Redis, BigQuery, and Pinot. I also worked on a partial migration of
analytical workloads from BigQuery to Pinot.

My systems projects have involved modifying the Linux kernel's DRM GPU scheduler and OpenSBI
firmware. I used C and tools including GCC, GDB, QEMU, and KUnit. My daily-driver desktops
are Arch Linux with pacman and an Intel-based Mac running macOS with Homebrew. My
development environment at Moloco was also macOS.

Earlier, I built an NFT marketplace with React and Solidity during an internship at
Nodeinfra. My recent contract work at Nitrode uses Next.js, TypeScript, and PostgreSQL
through Supabase for a contractor operations platform.

== Would you describe yourself as a high quality coder? Why?

Yes. I care about whether the next engineer can understand and maintain what I write.
I dislike one-off solutions that solve today's problem by making the next change harder.

At Moloco, demanding code reviews pushed me to explain my choices and consider alternatives.
I also operated what I built, so I had to deal with the consequences of those choices after
deployment. My work included migrations, production fixes, and cleaning up temporary code.
I review the design and implementation closely because I am responsible for the code
that ships.

== Would you describe yourself as an architect of resilient software? If so, why, and in which sorts of applications?

Yes. My strongest example is limiting the production impact of new experiments in an RTB
system. An experiment could change bidding behavior without a new service binary being
deployed, so I designed an experiment canary separate from the binary deployment canary.

An experiment intended for a 50/50 control and treatment split could start with 1% control, 1%
treatment, and 98% of traffic outside that experiment. The allocation applied across all
pods. We checked CPU and memory usage, signs of memory leaks, mean and p99 request latency,
and bid-request and bid-response rates. We also compared bid-response behavior with traffic
outside the experiment. Because the canary served live production traffic, we could examine
advertising outcomes such as click-through rate (CTR).

After we had enough evidence that an experiment was healthy, the platform could
automatically increase its allocation to the configured level. When we saw anomalies, we
investigated them and decided how to proceed.

== Outline your thoughts on open source software development. What is important to get right in open source projects? What open source projects have you worked on? Have you been an open source maintainer, on which projects, and what was your role?

I have worked directly with the Linux kernel and OpenSBI codebases for my own systems
experiments. These projects grew out of personal curiosity. They are not publicly maintained
projects, and my changes have not been merged upstream. I have not been an open source
maintainer.

What I admire about open source is the willingness to share how something works, down to
the implementation, so that someone else can learn from it and build further. For a project
to last, contributors also need clear expectations, useful reviews, and documentation that
helps people understand the code. Compatibility matters because other people's work may
depend on decisions that seem local to the project.

== Describe your experience building large systems with many services - web front ends, REST APIs, data stores, event processing and other kinds of integration between components. What are the key things to think about in regard to architecture, maintainability, and reliability in these large systems?

Moloco's A/B testing platform had to fit into an RTB system with request parsing and
batching, real-time machine learning inference, and concurrency control. Data scientists
also needed to analyze large volumes of bid requests and responses. Experiments were central
to decisions about bidding logic and models. Hundreds ran concurrently, and each owner
needed to distinguish the effect of their change from other experiments.

We built the platform in-house because those requirements were too specific for an external
product. I worked across the Go backend, infrastructure, and React interfaces used by
engineers and data scientists. The experiment logic had to fit within the bidding system's
latency budget while producing data that people could trust.

In a system like this, I want explicit boundaries between components. What data does each
component own? What happens if an update is delayed or a dependency fails? Those questions
need answers before teams build against an interface. Reliability also depends on being able
to see whether a change reached its consumers. In our configuration system, we reported each
pod's configuration version to Datadog and checked adoption by service.

== How comprehensive would you say your knowledge of a Linux distribution is, from the kernel up? How familiar are you with low-level system architecture, runtimes and Linux distro packaging? How have you gained this knowledge?

My first Linux distribution was Ubuntu through Windows Subsystem for Linux (WSL). I now
use Arch Linux with pacman as a daily-driver desktop.
Coursework gave me a foundation in operating systems, while personal projects required me to
work through the details of a running system.

For my GPU scheduling project, I extended the Linux DRM scheduler with an EEVDF-inspired
algorithm intended to reduce tail latency for interactive GPU jobs. I ran KUnit tests, built
modified kernels, prepared EFI images with mkinitcpio, and booted them through systemd-boot.
I then used a custom Vulkan benchmark suite on my hardware to evaluate the scheduling
changes.

My knowledge is deepest in kernel development, boot configuration, and how low-level
changes affect application behavior. My package-management experience is as a user.
I have not worked on language runtimes or built distribution packages.

#pagebreak(weak: true)

== Describe any experience you have with low-level embedded systems engineering, on Linux or other embedded operating systems

A university laboratory wanted to run student-submitted xv6-riscv kernels on a SiFive
FU740-C000 system instead of QEMU. The kernels expected to execute machine-mode operations,
but on the target setup OpenSBI occupied machine mode and the kernels ran at a lower
privilege level.

I modified OpenSBI to trap and emulate the relevant operations. This let us keep the
existing kernels' behavior instead of rewriting their machine-mode code for the hardware.
The modified system ran the student kernels and passed the course's grading test suites.

== Describe your experience with large-scale IT operations, SAAS, or other running services, in a devops or IS or system administration capacity

At Moloco, I handled deployment and day-to-day production issues for my projects. I migrated
more than ten services across over 5,000 production pods to a new runtime configuration
system. Our workflow used GitHub Actions for testing and deployment triggers, with Harness
carrying out deployments.

For a caching change in that system, I added a query parameter to let clients opt into the
new implementation. I first tested it in a sandboxed deployment using production builds and
pods across regions, receiving mirrored production bid requests. Responses from this
environment were not sent to ad exchanges, so we could test service behavior under
production conditions without participating in live auctions.

I then monitored the binary deployment canary and gradually enabled the new implementation
from 1% to 100% of production pods. Once the migration was complete, I removed the temporary
query parameter and old implementation.

== Describe your experience with public cloud based operations - how well do you understand large-scale public cloud estate management and developer experience?

Google Cloud Platform (GCP) is the cloud platform I know best. At Moloco, I used Terraform and
Kubernetes for services deployed across multiple regions. I owned the infrastructure and
monitoring for my projects within the company's broader cloud environment.

I also investigated cloud costs. In one case, I traced approximately \$9,000 per week to a
misconfigured storage setup spanning multiple regions and reduced that cost to near zero.

For developers, I value infrastructure and deployment processes they can inspect and
reproduce. Someone changing a service should be able to understand its dependencies and
investigate a failed deployment without relying on undocumented knowledge.

== Describe your experience with enterprise infrastructure and application management, either as a user running enterprise operations, or as a vendor targeting the enterprise market

My experience is with shared internal infrastructure at Moloco. Experiment and
configuration changes could alter bidding behavior independently of scheduled binary
deployments. When a production problem appeared, on-call engineers needed to know what had
changed in those systems as well.

I consolidated audit records into one pipeline and a shared view with controlled access,
using Datastream for change data capture. This gave on-call engineers a place to investigate
changes that would not appear in binary deployment history.

#pagebreak(weak: true)

== Outline your thoughts on quality in software development. What practices are most effective to drive improvements in quality?

Good reviews question the model as well as the code. An implementation can be correct on
its own terms and still misunderstand the workflow it is meant to support. In my contract
work with Nitrode, I spent time separating concepts such as applications, accounts, and
contractor assignments before building the workflows around them.

Tests should concentrate on behavior that is costly to get wrong, especially concurrency,
retries, and partial failures. I want them to catch regressions and save repeated manual
checking. I also think teams need to fix recurring sources of mistakes, including confusing
interfaces and duplicated logic, instead of adding another workaround each time.

== Outline your thoughts on documentation in large software projects. What practices should teams follow? What are great examples of open source docs?

Documentation should be easy to read and give enough context to make sense of its subject.
A technically accurate document is still difficult to use if the reader cannot tell why the
system exists or how it fits into the surrounding work.

For internal design documents, I want to know why something was introduced, what changed,
and why the current approach was chosen. I appreciate an honest explanation of what is not
ideal and what the team plans to improve. It should be clear which parts describe today's
behavior and which describe future plans.

Guides need that context too. ArchWiki's
#link(
  "https://wiki.archlinux.org/title/Arch_boot_process",
)[guide to the Arch boot process]
explains the stages and components involved, which helps readers understand their own setup
rather than just follow a sequence of commands.

Teams should review documentation for readability and update it alongside the code. More
detail is only useful when it helps someone understand the system or do their work.

== Outline your thoughts on user experience, usability and design in software. How do you lead teams to deliver outstanding user experience?

I think usability starts with understanding the task someone is trying to finish. At
Moloco, I built interfaces used by engineers and data scientists, so the frontend was part
of my responsibility even when the main work was in the backend.

In my contract work with Nitrode, requesting changes to a contractor's submission needed
to include feedback and a way for the contractor to submit a revision. Changing a status
field alone would not have made the feature useful.

I would bring that approach to team reviews by walking through the whole task together,
including what happens when something goes wrong. It is easier to spot a missing step that
way than by reviewing each screen or endpoint separately.

#pagebreak(weak: true)

== Outline your thoughts on performance in software engineering. How do you ensure that your product is fast?

I find micro-optimization interesting, but I start with the design and the workload.
At production scale, database I/O and network calls can dominate request time. Data access
patterns, unnecessary round trips, and concurrent access to shared resources deserve
attention early.

At Moloco, configuration updates triggered concurrent cache misses when notified services
all requested the same value. I changed the strategy to populate Redis before notifying
consumers. The database query spikes disappeared and the cache hit rate approached 100%.

My approach to checking performance is to combine benchmarks for critical code, integration
tests under representative load, and production monitoring. Each catches something different.
I look at latency, throughput, and resource use, including tail latency because averages can
hide slow requests. A lower query count is useful evidence, but I would measure response
times before claiming that users saw a speed improvement.

== Outline your thoughts on security in software engineering. How do you lead your engineers to improve their security posture and awareness?

Security needs to cover every way an operation can happen. In my contract work with
Nitrode, which uses Supabase, sensitive profile fields needed protection through both the
application backend and the client-accessible database API. Checking only the backend
routes would have left a path for unauthorized updates.

I would use examples like this in code reviews to make security concrete. Who is making the
request, what should they be allowed to do, and where is that checked? Shared authorization
patterns help, but engineers still need to understand what those patterns protect and what
they leave to the caller.

== Outline your thoughts on devops and devsecops. Which practices are effective, and which are overrated?

The practices I value make software easier to deploy and operate. At Moloco, owning
production support gave me a practical reason to use infrastructure as code, automated
checks, monitoring, and gradual rollouts. Access controls and separation between environments
need to be part of that setup too.

I am skeptical of adopting another platform or approval process just because it is common
elsewhere. It should prevent a failure we care about or remove work we repeatedly do.
Otherwise, the team inherits another thing to maintain.

#pagebreak()

= Industry leadership experience

== Describe your speaking experience at industry events and conferences

I have not spoken at industry events or conferences.

== Are you a thought leader in any particular area of technology?

I would not describe myself as an industry thought leader. My experience is primarily in
building and operating software.

== Describe any experience working with startups. What did you draw from that experience that would be relevant for this application?

At Moloco, my responsibility extended from the backend to infrastructure, interfaces, and
production support. I liked having that ownership. It taught me to make decisions with the
whole system in mind and to stay involved after a feature shipped.

That is relevant to Landscape because much of my work involved changing the behavior of
running services safely. With configuration deployment, sending an update was only part of
the job. We also needed to know which services had received it and investigate those that
had not. I would bring that operational experience to managing Ubuntu fleets.

My contract work with Nitrode has required more decisions about scope as requirements
evolved. I have learned to distinguish choices that need careful design now from details
that can stay simple until there is a clearer need.

== Describe any experience working in a public company. What is important for your colleagues to know about being a public company?

I have not worked at a publicly listed company.

#pagebreak()

= Education

== How did you rank in your high school, in your final year in maths and hard sciences? Which was your strongest?

Mathematics was one of my strongest subjects, alongside physics and biology. I was almost
always in the top ten of my year in these subjects, in a cohort of approximately 400
students. I also earned full marks in mathematics on South Korea's national university
entrance examination, the CSAT.

== How did you rank in your high school, in your final year in languages and the arts? Which was your strongest?

Languages were another strength. I was almost always in the top ten of my year and earned
full marks in Korean and English on the CSAT. I also consistently received A grades in
music and particularly enjoyed playing the violin.

== Please state your high school graduation results or university entrance results, along with the system used, and how to understand those. For example, in the US, you might give your SAT or ACT scores. In Germany, you might give your scores 1-5.

I ranked first in my school on the CSAT for 2020 university admission, also known as
Suneung, with full marks in Korean, mathematics (Ga track), and English. The CSAT is South Korea's
national university entrance examination.

The #link("https://www.korea.kr/common/download.do?fileId=189219581")[official score-distribution spreadsheets (ZIP)]
put those results in context.

#data-table(
  headers: ([Subject], [Candidates], [Perfect scores], [Percentage]),
  [Korean],
  [483,068],
  [777],
  [0.16%],
  [Mathematics Ga],
  [153,869],
  [893],
  [0.58%],
)

English was reported by grade band, so the published results do not give a separate
perfect-score count.

University admission in South Korea is highly competitive, especially for Seoul National
University (SNU). Early admission considers school records and broader assessment, while
regular admission relies heavily on the national examination. My school performance and
CSAT results made both routes viable, and I entered SNU through regular admission.

== What sort of high school student were you? Outside of class, what were your interests and hobbies? What would your high school peers remember you for, if we asked them?

I was serious about studying, but I also played the violin, enjoyed games, and listened to
rock and heavy metal as well as classical music. I got to know my music teacher well
through my enthusiasm for playing the violin.

I think my peers would remember me as someone driven and independent, with his own tastes
and interests.

#pagebreak(weak: true)

== Which university and degree did you choose? What other universities did you consider, and why did you select that one?

I chose a B.S. in Computer Science and Engineering at Seoul National University. SNU was
my clear first choice because of its standing as Korea's leading university and the chance
to study alongside exceptionally strong students. My main decision was what to study.

My results also made top medical schools a realistic option. I chose computer science
because I wanted to build things that could benefit many people. The reach of software
through the internet appealed to me, and I already enjoyed solving algorithm problems in
my high school's programming club.

I was also drawn to the openness of the field. I could study real implementations and learn
from people who chose to share their work. That made software engineering a field I wanted
to be part of.

== At university, did you do particularly well at any area of your degree?

I was most interested in the fundamentals of computer science and engineering. I earned
A+ grades in operating systems, databases, and a software engineering course, and A grades
in most of my computer science courses. Operating systems was one of the most demanding
courses I took, so that result meant a lot to me.

== Overall, what was your degree result and how did that reflect on your ability?

I graduated cum laude with a cumulative GPA of 3.76/4.3 and a major GPA of 3.85/4.3.
I did particularly well in the systems subjects that interested me most. My overall record
reflects consistent work across the degree, with stronger results in the areas I wanted to
pursue further.

== In high school and university, what did you achieve that was exceptional?

My first high-school examination placed me around 100th out of approximately 400 students.
By the end of four semesters, I ranked first overall for that semester, at a school in
one of Seoul's most academically competitive areas.

I did this without private academic lessons. Private tutoring was the norm among my peers,
and to my knowledge I was the only student in my school studying without it. I relied on
school education and independent study. That progress is something I am proud of because I
had to work out how to improve for myself.

== What leadership roles did you take on during your education?

I held no formal leadership positions during my education.

#pagebreak()

= Context

== Outline your thoughts on the mission of Canonical. What is it about the company's purpose and goals which is most appealing to you? What do you see as risky or unappealing?

#link("https://canonical.com/company")[Canonical's mission] of extending the impact of
open source appeals to me. I admire the people who share their work, and I also appreciate
how much engineering it takes to make that work dependable enough for others to use every
day. I would like to contribute to that.

The risk I see is spreading engineering effort across too many initiatives. Compatibility,
upgrades, and documentation need sustained attention. I would want to understand how
Canonical protects time for that work.

== Who are Canonical's key competitors, and how should Canonical set about winning?

For enterprise Linux management, Red Hat and SUSE are relevant competitors.
#link(
  "https://access.redhat.com/products/red-hat-satellite/",
)[Red Hat Satellite]
manages Red Hat infrastructure, while
#link(
  "https://www.suse.com/products/multi-linux-manager/",
)[SUSE Multi-Linux Manager]
serves mixed Linux environments.
#link("https://ubuntu.com/landscape")[Landscape] focuses on Ubuntu estates.

I would focus on the daily effort of operating Ubuntu. Fitting existing workflows, making
upgrades predictable, and simplifying failure recovery would give customers practical reasons
to choose Canonical and stay with it.

== Why do you most want to work for Canonical?

I want to bring my interest in Linux closer to my professional work. My systems exploration
has mostly happened through personal and university projects. Canonical would let me combine
that interest with my production backend experience and work on open source professionally.

== What would you most want to change about Canonical?

I would focus on reducing the manual work needed to carry out and verify fleet changes in
Landscape. At Moloco, I learned that sending an update is only part of the job. Operators
also need to know where it took effect, whether it caused problems, and what still needs
attention.

I would start by finding where customers spend the most time checking results or
recovering from failed changes. That would guide improvements to gradual rollouts, visibility into incomplete
operations, and the steps needed to recover. I would want the backend and interface to give
a consistent account of what happened on each machine.

I would measure success by the time operators spend on each rollout and the frequency of
incidents requiring manual investigation. My experience with configuration deployment and production support
would give me a practical starting point.

== What gets you most excited about this role?

#link("https://ubuntu.com/landscape")[Landscape] is infrastructure that other engineers
use to do their work. I enjoyed building that kind of software at Moloco, especially when
I could work through a problem from the backend to the interface used by another team.
Doing that for Ubuntu users would let me contribute my production experience while
deepening my knowledge of Linux administration.
