#let sans = "Work Sans"
#let serif = "Liberation Serif"

#let setup(author: (name: "", title: ""), version: "", body) = {
  set document(author: author.name, title: author.name + " (" + version + ")")
  set page(paper: "a4", margin: (x: 0.7in, y: 0.25in))
  show math.equation: set text(weight: 400)

  body
}

#let project(author: (name: "", title: ""), lang: "", body) = {
  set text(11pt, font: serif, lang: lang)

  align(center)[
    #block(text(font: sans, weight: 500, 1.75em, smallcaps(author.name)))
  ]

  pad(top: 0.5em, bottom: 0.5em, x: 2em, align(
    center,
  )[#stack(dir: ltr, spacing: 14pt, [#author.email], [#author.github])])

  set par(justify: true)

  body
};

#let space-line() = { line(length: 100%); v(-5pt) }

#let subsection-generic(content) = {
  pad(right: 12pt, content)
  v(10pt)
  space-line()
};

#let subsection-date(leftBody, rightBody, content: none) = {
  grid(
    columns: (1fr, auto),
    align(left)[ #leftBody ],
    align(right)[ #h(12pt) #rightBody ],
  )
  if content != none {
    v(4pt)
    pad(left: 4pt, right: 12pt, content)
  }
  v(10pt)
}

#let section-left(term) = [
  #show heading.where(level: 1): it => block(width: 100%)[
    #set text(font: sans, weight: "regular")
    #smallcaps(it.body)
  ]

  = #term
]

#let group(terms) = {
  v(1.345em)

  grid(columns: (2.3fr, 8fr), column-gutter: 2em, row-gutter: 2em, ..terms)
}

// ###############################################################################################

#let author = (
  name: "Jonas Meurer",
  email: "jmpunkt@outlook.com",
  github: link("https://github.com/jmpunkt")[github.com/jmpunkt],
)

#let edu(german) = [
  #subsection-date(if german [
    *TU Darmstadt - IT-Security M.Sc. (ohne Abschluss)*
  ] else [
    *TU Darmstadt - IT-Security M.Sc. (without degree)*
  ], if german [
    Darmstadt, Deutschland \
    04/2019 - 04/2022
  ] else [
    Darmstadt, Germany \
    04/2019 - 04/2022
  ])

  #subsection-date(
    if german [
      *TU Darmstadt - Informatik B.Sc.* \
      Abschlussarbeit:#text(
        lang: "en",
        style: "italic",
        [
          Investigating the Effects Of Inter-Process and Cross-Device Communication
          Strategies on Runtime Enforcement for Android
        ],
      )
    ] else [
      *TU Darmstadt - Computer Science B.Sc.* \
      Thesis: _Investigating the Effects Of Inter-Process and Cross-Device Communication
      Strategies on Runtime Enforcement for Android_
    ],
    if german [
      Darmstadt, Deutschland \
      10/2015 - 04/2019
    ] else [
      Darmstadt, Germany \
      10/2015 - 04/2019
    ],
  )

  #subsection-date(if german [
    *Viktoriaschule - Abitur* \
    Leistungskurse: _Mathematik und Physik_
  ] else [
    *Viktoriaschule - Abitur* \
    Advanced courses: _Math und Physics_
  ], if german [
    Darmstadt, Deutschland \
    2007 - 2015
  ] else [
    Darmstadt, Germany \
    2007 - 2015
  ])

  #space-line()
]

#let experience(german) = [
  #subsection-date(
    if german [
      *LCore Systems* \
      Rolle: Gründer, Software Entwickler und Architekt \
      Technologien: Rust, GraphQL, Typescript, SQL und Nix
    ] else [
      *LCore Systems* \
      Role: founder, software engineer, and architect \
      Technologies: Rust, GraphQL, Typescript, SQL und Nix
    ],
    if german [
      Darmstadt, Deutschland \
      2020 - 2024
    ] else [
      Darmstadt, Germany \
      2020 - 2024
    ],
    content: if german [
      - Entwicklung einer Plattform für die Vermittlung von Krankentransporten.
      - Reproduzierbare Builds für Rust und Typescript
    ] else [
      - Developed a transportation platform for rides paid by health care providers
      - Used Nix for reproducible build for Rust and Typescript
    ],
  )

  #subsection-date(
    if german [
      *TU Darmstadt - Fachbereich MAIS* \
      Rolle: Werksstudent \
      Technologien: Java, Bazel und Rust
    ] else [
      *TU Darmstadt - Department MAIS* \
      Role: student employee \
      Technologies: Java, Bazel, and Rust
    ],
    if german [
      Darmstadt, Deutschland \
      12/2019 - 09/2020
    ] else [
      Darmstadt, Germany \
      12/2019 - 09/2020
    ],
    content: if german [
      - Zusätzliche IPC Kanäle für das _runtime policy enforcment framworks_ (CliSeAu)
        hinzugefügt
      - Implementierung eines modularen Konfigurationssystem für mehrere
        Programmiersprachen und Plattformen
    ] else [
      - Added additional IPC channel to the _runtime policy enforcment framworks_ (CliSeAu)
      - Started a configuration framework which allows CliSeAu to run interact with
        different languages and target platforms.
    ],
  )

  #space-line()
]

#let projects(german) = [
  #subsection-date(
    if german [
      *Webinterface zum initialisieren eines Flugsimulators* \
      Gruppenprojekt (fünf Personen) \
      Technologien: Python, Django und Windows XP bis Windows 7
    ] else [
      *Starting Service For A Flight Simulator* \
      Group project (five people) \
      Technologies: Python, Django, and Windows XP until Windows 7
    ],
    [
      2018
    ],
    content: if german [
      - Mit benutzerdefinierten Startabfolgen die Software eines Flugsimulators
        initialisieren
      - Mit Auftraggebern in regelmäßigen Treffen Anforderungen evaluiert
      - Eine ausführliche Dokumentation über die benutzten Softwareentwicklungsmethoden
        erstellt
    ] else [
      - Allows starting the simulator with user-defined scripts
      - Evaluated the requirement and progress of the project with the client
      - Produced a detailed documentation of the project, including the progress and
        unser software-engineering methods
    ],
  )
  #space-line()
];

#let skills(german) = subsection-generic(
  if german [ *Sprachen* Deutsch (Muttersprache), Englisch (fließend)

    *Programmiersprachen*
    Rust, Nix, Typescript, SQL (Postgres), Python, C, Java und Web (HTML, CSS und
    Javascript)

    *Sonstiges*
    Emacs, Git und Linux ] else [

    *Languages*
    German (native tongue), Englisch (fluent)

    *Programming Languages*
    Rust, Nix, Typescript, SQL (Postgres), Python, C, Java und Web (HTML, CSS, and
    Javascript)

    *Misc*
    Emacs, Git, and Linux],
);

#let groups(german) = group(
  (
    section-left(if german [ Praktische \ Erfahrung ] else [ Work \ Experience ]),
    experience(german),
    section-left(if german [ Bildungsweg ] else [ Education ]),
    edu(german),
    section-left(if german [ Projekte ] else [ Projects ]),
    projects(german),
    section-left(if german [ Kompetenzen ] else [ Skills ]),
    skills(german),
  ),
)

