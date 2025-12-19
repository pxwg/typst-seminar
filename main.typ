#import "preamble.typ": *

#show: thu-theme.with(
  title: [Typst 使用简介],
  subtitle: [玩得开心最重要！],
  author: [Xinyu Xiang],
  institution: [Department of Physics, Tsinghua University],
  date: [2025 年 12 月],
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
  - *但存在一些不令人满意的地方*
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
      - 重复编译 (输出困难)
      - 报错晦涩 (调试困难)
      - 全量编译 (预览困难)
      *使用相对困难，流畅度不佳*
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
  - *编译速度*：单次编译，增量编译，即时预览，快速反馈
]
#only(3)[
  - *编译速度*：单次编译，增量编译，即时预览，快速反馈
  - *单次编译*：不需要 `latex` -> `bibtex` -> `latex` -> `latex` 的重复编译链，一次生成
    - 本地 build 减少等待时间
    - CI 减少资源消耗 (省钱)
]

#only(4)[
  - *编译速度*：单次编译，增量编译，即时预览，快速反馈
  - *单次编译*：不需要 `latex` -> `bibtex` -> `latex` -> `latex` 的重复编译链，一次生成
    - 本地 build 减少等待时间
    - CI 减少资源消耗 (省钱)
  - *增量编译*：只重新编译修改过的部分，提升大文档的编译效率
    - 适合笔记等频繁修改的场景，真正*所见即所得*
]

#only(5)[
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
#only(6)[
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

= 玩起来！

#link("https://typst.app/docs/tutorial/")[#underline([官方文档])] #link(
  "https://typst.app/play/",
)[#underline([Playground])]

== 基本语法：标记

`Typst` 的语法设计简洁直观，易于上手。以下是一些基本的标记语法示例：
#example(title: [Example: Basic Markup])[
  ```typ
  = This is a Heading 1
  This is a paragraph with *bold text* and _italic text_.

  This is a embedded math formula $1 + 1 = 2$.
  And this is a block formula:
  $ Z = integral cal(D)[x(t)] exp(- S[x(t)])  $

  + This is a `numbered list` item
    - Sub-item
  + Another numbered item
  // We love typst!
  ```
]

== 基本语法：脚本

`Typst` 支持脚本编写，允许用户定义变量、函数等，以实现更复杂的排版需求。
#example(title: [Example: Basic Scripting])[
  ```typ
  #let radius = 10 // Define a variable
  #let area(r) = {
    let R = r*r // Local variable, using `let` keyword to define
    return [#R] + math.pi // Output is math object
  } // Define a function
  The area of a circle with radius $radius$ is $area(radius)$.
  ```
  这样就可以方便地进行计算和动态内容生成。注意，这里算出的 `area` 是一个数学对象，可以直接嵌入到文档中 (例如 $100 pi$)
]

```typ #if #for``` 等等基本的控制流语句的使用也类似于其他编程语言，语法简洁明了。

== 基本语法：模块

`Typst` 支持模块化编程，允许用户将代码分割成多个文件，便于管理和复用。同时，官方也提供了多种标准库。

#alternatives[
  - *模块导入*：使用 ```typ#import module: function1, ...``` 语句导入模块。
  - *标准库*：`Typst` 提供了丰富的标准库，如 `math`、`graphics` 等，方便用户进行数学计算和图形绘制。
  - *引用函数*：假设函数处于 `module` 中，则可以通过 ```typ #module.function(args)``` 的形式调用。
][
  *dictionary 的键值对引用*与函数引用完全相同，通过 `.` 操作符访问模块中的函数。

  #example(title: [Example: Dictionary])[
    ```typ
    #let colors = (
      primary: blue,
      secondary: green,
      accent: red,
    ) // Define a dictionary
    The primary color is #colors.primary. // Access dictionary value
    ```
  ]
]

== 一些进阶玩法：函数式编程的应用

`Typst` 是一门*函数式编程*语言，与`LaTeX` 的*命令式编程*有本质区别。

#alternatives[
  - 函数式变成的特点在于，所有的操作都是通过*函数调用*来实现的，而函数本身的输出只与输入有关，不会因为外部状态的变化而改变。
  - 例如：```typ #circle(radius: 10pt)``` 总是返回一个半径为 `10pt` 的圆形对象，无论它在文档中的位置如何。
  - 函数式的设计是 `typst` 可以实现*增量编译*的基础。
][
  - 函数式编程的一个基础：lambda 表达式
    - *匿名*函数，通过下列参数定义：
      - 指定参数列表`inputs: (arg1, arg2, ...)`
      - 指定输出行为`=> expression`
    #example(title: [Example: Addition Function])[
      ```typ
      #let add = (a, b) => a + b
      #add(2, 3)  // 返回 5
      ```
    ]
][
  #example(title: [Example: Theme Function])[
    ```typ
    #let test-theme(
      title: "",
      document,
    ) = {...} // some configuration code
    // Using the theme
    #show: doc => test-theme(
      title: [My Document],
      doc,
    ) // Which could be simplified as `show: test-theme.with(...)`
    ```
    这个用法或许是*颜控*最需要调用的函数！
  ]
][
  #example(title: [Example: Light/Dark Mode Detection])[
    在网页设计中，往往需要：
    - 确定当前整体是浅色模式还是深色模式
    - 根据模式切换不同的样式
    由于前端代码本质上生成了两份对应于深色/浅色模式的 CSS 与 HTML，Typst 渲染的的公式 (通过 `svg` embedding 嵌入到网页中) 也需要根据当前模式进行调整。具体而言，就是*预渲染两份不同的公式图片*，然后根据网页的模式进行切换。
  ]
]

#only(4)[#example(title: [Example: Light/Dark Mode Detection (Continued)])[
    ```typ
    #let theme-wrapper(render) = {
      let light = (color: black)
      let dark  = (color: white)
      // Using typst's html generation capabilities
      html.elem("div", render(light), attrs: (class: "show-light"))
      html.elem("div", render(dark),  attrs: (class: "show-dark"))
    }

    [$x^2 + y^2 = z^2$] => theme-wrapper(theme => {
       // render logic using theme.text-color and theme.bg-color
    }) // outputs both light and dark versions with appropriate classes
    ```
    (当然这个例子只是示例，实际代码会复杂一些)
  ]
]

== 一些进阶玩法：Typst 作为高阶 CSS + Markdown

`Markdown` 是一种轻量级标记语言，广泛用于编写文档和博客文章。`Markdown` 本身的排版能力有限，通常需要结合 `CSS` 来实现更复杂的样式需求。

#alternatives[#theorem(
    title: [Idea],
  )[
    设想这样的场景：
    - 深夜码字，使用暗色主题的编辑器
    - 预览窗口中，文档使用浅色主题进行渲染
    - $=>$ 结果：盐津虾新鲜出炉
    *需求*：编辑器和预览窗口中的主题风格保持一致
  ]
][
  *需求*：编辑器和预览窗口中的主题风格保持一致
  - Solution I: Markdown + CSS
  #figure(
    image(
      "/assets/md_vsc.png",
      width: 400pt,
    ),
    caption: [Markdown + CSS in VSCode],
  ) <fig-md_vsc>
]

#slide([
  *需求*：编辑器和预览窗口中的主题风格保持一致
  - Solution I: Markdown + CSS
    - 高度成熟的方案
    - *百花齐放*，各大编辑器、博客平台均有各自的实现，且不易统一
    - `pandoc` 等工具导出为 PDF 时，难以集成复杂的 CSS
  #pause
  - Solution II: LaTeX + X：
    - X$=$一些主题宏包 $==>$ 预览没有问题，但导出 PDF 就翻车 (除非手动调试)
    - X$=$特定 PDF 阅读器 $==>$ 折腾各大 PDF 阅读器的颜色配置 + 双向查找等功能，且*未必成功*
    - X$=$自定义宏包 $==>$ 想想都麻烦，且导出 PDF 仍然翻车
])

#slide([
  *需求*：编辑器和预览窗口中的主题风格保持一致

  #pause
  *细分需求*：
  - 编辑 + 预览工作流中，适配编辑器配色
  - 导出 PDF 时，正常的 PDF 排版风格

  #pause
  *问题*：需要通过*外界输入*来切换上述情况
])

#slide([
  *问题*：需要通过*外界输入*来切换*预览模式*与*输出模式*

  - Typst 具有*内置的参数输入系统*，可以通过命令行参数的形式传递变量给文档，从而实现动态配置文档内容和样式。

  #alternatives[][
    #example(title: none)[
      - API：```typ #sys.inputs``` A dictionary of input parameters.
      - Input from command arguments:
        - 编译：```bash typst c main.typ --input colored=false --input preview=false```
        - 这样就会传递两个 key 给 `main.typ`：`colored` 和 `preview`，value 分别对应 `true` 和 `false`。
        - 最后通过 ```typ #let colored = sys.inputs.at("colored", default: "false") == "true"``` 获取具体的参数值 (受制于 shell 的设计，`input` 只能有 `string` 类型，这里将其转换为了 `bool` 类型)。
    ]
  ][
    *Typst 的解决方案*：
    - 通过 `sys.inputs` 获取外界传入的参数
    - 预览时，为 `tinymist` LSP (用于 VSCode Typst 插件的预览) 传入 `preview=true` 参数
      - 手写深色主题的 typst 代码
      - 利用 `preview` 参数激活深色主题，以适配编辑器的暗色主题
    - 导出 PDF 时，不传入 `preview` 参数，使用浅色主题，以适配 PDF 的常规排版风格
  ]
])
