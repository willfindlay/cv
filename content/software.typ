#import "../lib/cv-template.typ": *

#cv-section[Open-Source Software]

#cv-subsection[Creator/Maintainer]

#cv-entry(
  [Experimental Container Security Mechanism using eBPF],
  [BPFContain],
  [],
  [],
  description: cv-items(
    (
      [Designed and implemented a container security framework using eBPF programs and LSM hooks.],
      [Tech stack for this project includes Rust, libbpf-rs, and eBPF.],
      [BPFContain is the subject of ongoing research and development, and will be the topic of my 2021 Master's Thesis.],
      [Full source code available: #link("https://github.com/willfindlay/bpfcontain-rs")[https://github.com/willfindlay/bpfcontain-rs]],
    )
  )
)

#cv-entry(
  [eBPF-Based Process Confinement Mechanism],
  [bpfbox],
  [],
  [],
  description: cv-items(
    (
      [Designed and implemented the first eBPF-based policy enforcement engine and a high-level policy language for process confinement.],
      [This work was #link("https://dl.acm.org/doi/10.1145/3411495.3421358")[published at ACM CCSW'2020].],
      [Full source code available: #link("https://github.com/willfindlay/bpfbox")[https://github.com/willfindlay/bpfbox]],
    )
  )
)

#cv-entry(
  [eBPF-Based Intrusion Detection System],
  [ebpH],
  [],
  [],
  description: cv-items(
    (
      [Designed and implemented an intrusion detection system for Linux based on eBPF.],
      [Establishes per-executable system call profiles in order to establish normal behaviour and detect anomalies.],
      [Full source code is available: #link("https://github.com/willfindlay/ebpH")[https://github.com/willfindlay/ebpH].],
    )
  )
)

#cv-subsection[Contributor]

#cv-entry(
  [eBPF Programming Framework for Python],
  [bcc],
  [],
  [],
  description: {
    cv-items(
      (
        [Regular contributor to a large open-source project.],
        [Implemented the following major features:
          #list(
            indent: 2em,
            body-indent: 0.5em,
            [Support for the ringbuf eBPF map],
            [Enhanced support for LSM probes],
            [Python support for stack and queue eBPF maps],
          )
        ],
        [Full source code is available: #link("https://github.com/iovisor/bcc")[https://github.com/iovisor/bcc].],
      )
    )
  }
)

#cv-entry(
  [Rust Implementation of libbpf],
  [libbpf-rs],
  [],
  [],
  description: {
    cv-items(
      (
        [Implemented several major features to an open-source Rust project:
          #list(
            indent: 2em,
            body-indent: 0.5em,
            [Support for the ringbuf eBPF map],
            [Enhanced support for LSM probes],
            [Bugfixes and general API improvements],
          )
        ],
        [Full source code is available: #link("https://github.com/libbpf/libbpf-rs")[https://github.com/libbpf/libbpf-rs].],
      )
    )
  }
)
