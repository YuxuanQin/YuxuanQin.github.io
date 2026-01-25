#import "/config.typ": template, tufted
#show: template.with(title: "我的 Typst 配置")
= 我的 Typst 配置
<我的-typst-配置>
感谢开源！

以下是我的 Typst 配置：

== 字体
<字体>
感谢为 Typst
作出贡献的所有人，字体终于不再是噩梦，一个普通人再也不需要为了字体修一个
LaTeX 博士了！！！！！！

```typst
// 地区
#set text(lang: "zh", region: "cn")  // 语言：中文，地区：中国大陆

// 正文字体
#set text(font: (
  (name: "libertinus serif"),  // 西文字体
  "Noto Serif CJK SC"  // 汉文字体
))
#set text(size: 12pt)  // 字体大小

// 数学字体
#show math.equation: set text(font: (
  (name: "New Computer Modern Math", covers: "latin-in-cjk"),  // 西文字体
  "Noto Serif CJK SC",  // 汉文字体
))
```

== 引用块
```typst
#set quote(block: true)     // 启用引用块

#show quote: block.with(
  fill: luma(220),          // 背景色
  inset: 9pt                // 边框距
)
```

== 段落样式
<段落样式>
```typst
// 首行缩进
#set par(first-line-indent: (amount: 2em, all: true))

// 段落文字对齐
#set par(justify: true)

// 描述型列表分隔符，把方框内的东西换成你想要的
#set terms(separator: [*:* ])
```

== 自定义数学符号
<自定义数学符号>
谁他妈想用 `tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆谁他妈想用
`tilde.equiv`？😆谁他妈想用 `tilde.equiv`？😆

```typst
// 自定义符号
#let iso = symbol("≅")
#let hp = symbol("≃")
#let mset = $bold("Set")$
#let sset = $bold("sSet")$
#let mgrp = $bold("Grp")$
#let mtop = $bold("Top")$
#let simp = $"Simp"$
#let sing = $"Sing"$
#let inj  = $arrow.hook.r$
#let ch   = $"Ch"$
```

== 宏包
<宏包>
感谢所有人！

=== `conjak`：汉文日期格式
<conjak汉文日期格式>
- #link("https://typst.app/universe/package/conjak")[网址]；
- 基本格式：`#conjak.指令(datetime 格式)`；
- 例子：

```typst
最后编译于#conjak.cjk-date-format(datetime.today()) \
```

这个会显示譬如 “二〇〇五年九月九日” 的日期。

=== `theorion`：定理环境
<theorion定理环境>
牛逼就完了兄弟！

- #link("https://typst.app/universe/package/theorion")[网址]；
- 基本格式：`#定理环境(title: 名字)[内容]`，注意有些定理环境没有
  `title`，譬如 `proof`；
- 例子：

```typst
#theorem(title: [$1 + 1 = 2$ is ture])[
As stated, we claim $1 = 1$.
]
```

=== `fletcher`：画交换图
<fletcher画交换图>
牛逼牛逼牛逼牛逼牛逼牛逼牛逼！ 
- #link("https://typst.app/universe/package/fletcher/")[网址]；
- 基本格式：我不知道，兄弟，我都是在线画图的 Grinning Squint 😆 #link("https://quiver.theophile.me/")[在线画图]
