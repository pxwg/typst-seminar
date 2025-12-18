#import "@preview/touying:0.6.1": *
#import themes.university: *

#let color_palette_light = (
  background: white,
  text: black,
  primary: rgb("#660099"),
  secondary: rgb("#660099").lighten(20%),
  tertiary: rgb("#e6d9f2"),
  mantle: rgb("#f3f3f3"),
  accent: rgb("#a83252"),
)

#let color_palette_dark = (
  background: rgb("#11262d"),
  text: rgb("#c0c8cc"),
  primary: rgb("#a8cbec"),
  secondary: rgb("#7365ca"),
  tertiary: rgb("#051a20"),
  mantle: rgb("#051a20"),
  accent: rgb("#e1b8d4"),
)

#let inputs = sys.inputs
#let colored = inputs.at("colored", default: "false") == "true"
#let preview = inputs.at("preview", default: "false") == "true"

#let current-colors = if preview { color_palette_dark } else {
  color_palette_light
}

#let block-box(stroke-color, title, body) = {
  box(
    stroke: 1pt + stroke-color,
    width: 100%,
    fill: current-colors.mantle,
    inset: (x: 8pt, y: 8pt),
    radius: 4pt,
    [
      #text(fill: stroke-color, weight: "bold")[#title]
      #v(0.5em)
      #set text(fill: current-colors.text)
      #body
    ],
  )
}

#let definition(title: "Definition", body) = block-box(
  current-colors.primary,
  title,
  body,
)
#let theorem(title: "Theorem", body) = block-box(
  current-colors.accent,
  title,
  body,
)
#let proof(body) = block(
  stroke: (left: 2pt + current-colors.secondary),
  inset: (left: 1em),
  width: 100%,
  below: 1em,
)[
  #text(style: "italic", fill: current-colors.secondary)[Proof.] #body #h(
    1fr,
  ) $qed$
]

#let thu-theme(
  title: "",
  subtitle: "",
  author: "",
  date: datetime.today(),
  institution: "Tsinghua University",
  ..args,
  body,
) = {
  let handout-mode = preview

  show: university-theme.with(
    aspect-ratio: "16-9",

    config-page(
      margin: (top: 3em, bottom: 2em, x: 2em),
    ),
    config-colors(
      primary: current-colors.primary,
      secondary: current-colors.secondary,
      tertiary: current-colors.tertiary,
      neutral-light: current-colors.mantle,
      neutral-dark: current-colors.text,
    ),
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      date: date,
      institution: institution,
    ),
    // config-methods(handout: handout-mode),
    header-right: self => {
      utils.display-current-heading(level: 1)
    },
    header-left: self => {
      utils.display-current-heading(level: 2)
    },
    footer: self => {
      set align(horizon)
      set text(size: 10pt, fill: current-colors.primary.lighten(20%))
      grid(
        columns: (1fr, 1fr, 1fr),
        align(left, self.info.author),
        align(center, self.info.institution),
        align(right, context utils.slide-counter.display()
          + " / "
          + utils.last-slide-number),
      )
    },
    ..args,
  )

  set page(fill: current-colors.background)
  set text(
    fill: current-colors.text,
    size: 20pt,
  )
  show math.equation: set text(font: "Libertinus Math")

  set enum(indent: 1em, spacing: 1em)
  set list(indent: 1em, spacing: 1em)

  set par(leading: 0.8em)

  body
}
