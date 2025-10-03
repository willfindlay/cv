#import "../lib/cv-template.typ": *

#cv-section[Academic Experience]

#cv-entry(
  [Research Assistant],
  [Carleton University],
  [Ottawa, Canada],
  [Apr. 2019 -- Present],
  description: cv-items(
    (
      [Member of the #link("https://www.cisl.carleton.ca/")[CCSL/CISL] research group.],
      [Researching Extended BPF for runtime security implementations under the Linux kernel.],
      [Co-supervised by #link("https://people.scs.carleton.ca/~soma/")[Dr. Anil Somayaji] and #link("https://dbarrera.xyz/")[Dr. David Barrera].],
      [Designed and developed ebpH, an anomaly detection system for Linux, using eBPF.
        #list(
          indent: 2em,
          body-indent: 0.5em,
          [This work was the subject of my undergraduate #link("https://www.cisl.carleton.ca/~will/written/coursework/undergrad-ebpH-thesis.pdf")[Honours Thesis].]
        )
      ],
      [Designed and developed bpfbox, a process confinement tool for Linux, using eBPF.
        #list(
          indent: 2em,
          body-indent: 0.5em,
          [This work was #link("https://dl.acm.org/doi/10.1145/3411495.3421358")[published at ACM CCSW'2020].]
        )
      ],
    )
  )
)

#cv-entry(
  [Teaching Assistant, COMP4000/5012 Distributed Operating Systems],
  [Carleton University],
  [Ottawa, Canada],
  [Sept. 2021 -- Present],
  description: cv-items(
    (
      [Assisted the professor with planning and developing course material for a 50 student mixed graduate and undergraduate seminar course],
      [Created bi-weekly quizzes based on the content of research papers],
      [Designed two implementation experiences for students, focused around Kubernetes deployments in the cloud],
      [Graded assignments, term papers, and exams],
    )
  )
)

#cv-entry(
  [Head Teaching Assistant, COMP3000 Operating Systems],
  [Carleton University],
  [Ottawa, Canada],
  [Sept. 2018 -- Sept. 2021],
  description: cv-items(
    (
      [Nominee for the #link("https://carleton.ca/tasupport/taawards/edc-outstanding-ta-awards/")[Outstanding Teaching Assistant Award] in the 2018/2019, 2019/2020, and 2020/2021 academic years.],
      [Ran tutorial sessions for groups of 50 students.],
      [Took a leadership role to ensure tutorials proceeded smoothly.],
      [Held weekly office hours and workshops for students.],
      [Graded assignments and tests and gave appropriate feedback.],
      [Developed a #link("https://github.com/willfindlay/tabot")[Discord bot] to help manage the class Discord server, used during the COVID-19 pandemic.],
      [Developed new tutorials which are now used each semester:
        #list(
          indent: 2em,
          body-indent: 0.5em,
          [#link("https://homeostasis.scs.carleton.ca/wiki/index.php/Operating_Systems_2020W:_Tutorial_6")[Concurrency tutorial]],
          [#link("https://homeostasis.scs.carleton.ca/wiki/index.php/Operating_Systems_2020W:_Tutorial_8")[Kernel memory management tutorial]],
          [#link("https://homeostasis.scs.carleton.ca/wiki/index.php/Operating_Systems_2020W:_Tutorial_9")[eBPF tutorial]],
          [#link("https://homeostasis.scs.carleton.ca/wiki/index.php/Operating_Systems_2019F:_Tutorial_9")[Rootkit tutorial]],
        )
      ],
    )
  )
)
