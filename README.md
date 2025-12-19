# 燎原沙龙 Typst 研讨会

本文档为燎原沙龙 Typst 研讨会的 slides，内容涵盖 Typst 的基础知识、进阶技巧以及实际应用案例，旨在帮助参与者更好地理解和掌握 Typst 排版系统。

## Quick Start

本次燎原沙龙会涉及实操环节，为了获得更好的体验，建议同学们提前准备好相应的环境。

### VSCode 环境

使用 VSCode 作为 Typst 的编辑环境。请安装 [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 插件来获得代码高亮和预览功能。

> 这是一个一站式解决方案，集成了 Typst 语言支持和预览功能，适合大多数用户使用。

### 其他编辑器

如果你尝试使用其他编辑器，可以尝试使用 CLI 进行编译。这要求你先安装对应的 Typst 编译器，请参考 [Typst 的 GitHub 官方仓库](https://github.com/typst/typst#Installation) 进行下载。

## 下载预编译 PDF

可以[直接下载](https://github.com/pxwg/typst-seminar/releases)预编译好的 PDF 文件。

## 本地编译

编译之前，请确保已安装 Typst 编译器。可以参考 [Typst 的 GitHub 官方仓库](https://github.com/typst/typst#Installation) 进行安装。

- 标准编译
```bash
typst c main.typ --input handout=true
```
- 编译为 slides
```bash
typst c main.typ --input handout=false
```
- 编译为深色预览
```bash
typst c main.typ --input preview=true
```
