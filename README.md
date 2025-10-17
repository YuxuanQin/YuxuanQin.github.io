# 个人主页

`HTML` 内容由 [pandoc](https://pandoc.org) 生成。

目前托管在 Github Pages 和 Cloudflare Pages，可通过以下网址访问：

- https://yuxuanqin.github.io
- https://qinyx.pages.dev

---

## 如何生成网页
需求：

- 自用 `.css` 文件；
- 网页标题栏默认用文章标题；

结果：
```
pandoc -s --css="/styles/styles.css" --shift-heading-level-by=-1  文件.md -o 文件.html
```
