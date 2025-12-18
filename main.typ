#import "preamble.typ": *

#show: thu-theme.with(
  title: [Typst 使用简介],
  subtitle: [快速上手与实用技巧],
  author: [Xinyu Xiang],
  institution: [Department of Physics, Tsinghua University],
  date: datetime.today(),
)

#title-slide()
#outline()

= 动机：Why Typst?

== Typst 的前辈

如果要谈论 `Typst` 被发展的动机，我们就不得不提到它的前辈 `LaTeX`。


#alternatives[#align(center)[
    #figure(
      image("/assets/latex_logo.png", width: 200pt),
      caption: [LaTeX 标志],
    ) <fig-latex_logo>
  ]
][
  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    gutter: -200pt,
    figure(
      image("/assets/latex_logo.png", width: 160pt),
      caption: [LaTeX 标志],
    ),
    figure(
      image("/assets/arxiv_logo.jpg", width: 160pt),
      caption: [Arxiv 标志],
    ),
  )
]

#pause

- `LeTeX` 已经有 30 多年的历史了
#alternatives[
  - *自然有很多好处！！*
    - 老资历，用户广泛，出版业、预印本服务器的事实标准
    - 扩展性好，社区资源丰富 (喜欢我 `TeXLive` 一下子装了 $5 "GB"$ 的宏包吗？)
    - 经受住了时间的考验 (稳定性好，支持复杂排版)
][
  - *但我不认为大家喜欢 ta*
    - ```tex\begin{...} ... \end{...}```，```tex\command{...}```
    - 编译慢 (尤其是大文档)
    - 错误信息晦涩难懂
]

#slide[
  #table(
    columns: (1fr, 1fr),
    inset: 1em,
    align: top,
    stroke: (x, y) => if y == 0 { (bottom: 0.5pt + gray) } else { none },

    [*Good Features*], [*Bad Features*],

    [
      - 用户广泛 (支持良好)
      - 宏包丰富 (功能强大)
      - 复杂排版 (成果漂亮)
      *排版利器*
    ],
    [
      - 语法冗长 (编写困难)
      - 全量编译 (输出困难)
      - 报错晦涩 (调试困难)
      *使用困难*
    ],
  )

  #pause

  #alternatives[
    *在实际生活中，我们常常使用 `LaTeX` 去做_笔记_，*在笔记撰写中，$ "使用乐趣、编辑效率" >> "排版成果" $
    _例子_: 课程笔记、日常笔记
  ][
    我们还可能有*更进阶*的需求：例如，写个 blog 发到自己的博客上，这需要：
    - 为 HTML 编辑、输出特定样式
    - 方便地集成到静态网站架构 (如 Astro、Hugo 中)
  ][
    - 记笔记：快速编辑、所用所得、#underline[稳定输出 PDF 供存档] (这个需求淘汰了`Markdown`)
    - 写博客：为不同 Target 定制样式、集成到对应工作流
    在这些：$"使用体验" and "灵活性" >> "排版严谨性"$的场合，`LaTeX` 力不从心。
  ]
]

== Typst

`Typst` 是一个新兴的排版系统，旨在解决 `LaTeX` 目前存在的一些问题，包括但不限于：
- *语法*：语法简洁，易于上手
#only(1)[
  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    [
      ```tex
      \section{Introduction}
      This is a simple document.
      Here is a list:
      \begin{itemize}
        \item First item
        \item Second item
      \end{itemize}
      And here is an equation:
      \begin{equation}
        \mathcal{L} = \frac{1}{2} m v^2 - V(x)
      \end{equation}
      ```
    ],
    [
      ```typst
      = Introduction
      This is a simple document.
      Here is a list:
      - First item
      - Second item
      And here is an equation:
      $ cal(L) = 1/2 m v^2 - V(x) $
      ```
    ],
  )
]
// HACK: avoid wrong slide counting while using #only and #pause
#only(2)[
  - *编译速度*：增量编译，即时预览，快速反馈
  #link("./assets/typst_preview.mp4")[#underline(
      [I'm a Typst preview demo video. Click to play.],
    )]
]
#only(3)[
  - *编译速度*：增量编译，即时预览，快速反馈
  - *错误信息*：友好的错误提示，易于调试，甚至在编辑器中直接显示错误

  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    [
      #figure(
        image(
          "/assets/typst_error.png",
        ),
        caption: [Typst 错误提示示例],
      ) <fig-typst_error>
    ],
    [
      #figure(
        image("/assets/latex_error.png", width: 80%),
        caption: [LaTeX 错误提示示例],
      ) <fig-latex_error>],
  )
]
#only(4)[
  - *现代化*：内置对网页、屏幕等多种输出格式的支持，适应现代工作流

  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    [
      #figure(
        image("/assets/typst_site.png"),
      )
    ],
    [
      #figure(
        image("/assets/typst_site_1.png", height: 250pt),
      )
    ],
  )

]
