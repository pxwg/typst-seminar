# 燎原沙龙 Typst 研讨会

本文档为燎原沙龙 Typst 研讨会的 slides，内容涵盖 Typst 的基础知识、进阶技巧以及实际应用案例，旨在帮助参与者更好地理解和掌握 Typst 排版系统。

## 使用方法

使用之前，请确保已安装 Typst 编译器。可以参考 [Typst 官方文档](https://typst.app/docs/) 进行安装。

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
