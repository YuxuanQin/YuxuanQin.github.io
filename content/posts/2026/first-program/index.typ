#import "/config.typ": template, tufted
#show: template.with(title: "我的第一个程序")

去年春夏，我因备考俄语四级，诞生了制作命令行俄语字典的想法，但由于一直惧怕实操，迟迟没有动手，前几天总算是下定决心把手弄脏，有了些成果。

= 成果展示
我制作的命令行俄语字典名为 `openrussian-tui`，已在 PyPi #link("https://pypi.org/project/openrussian-tui/")[上架]，可通过 `pip install openrussian-tui` 下载！

#tufted.full-width(image("./OpenRussian.svg"))

= 怎么做出来的？
这个程序的基本信息如下：

- 编程语言：python；
- tui 框架：#link("https://textual.textualize.io/")[`textual`]；
- 词义来源：#link("https://openrussian.org")[OpenRussian]；
- 打包工具：#link("https://hatch.pypa.io")[`hatch`]；

近来在网上冲浪的时候，偶见 Rust 的 tui 框架 #link("https://ratatui.rs")[`ratatui`]，同时还发现著名终端文件管理器 yazi 就是基于这个框架制作的，发生兴趣以后，尝试学习 Rust，以期有朝一日能用之制作命令行字典。

学着学着，我突然想到其他编程语言会不会也有类似的 tui 框架呢，一搜发现 python 也有。于是，苦于 rust 复杂的机制，我渐期望能用 python 完成本项目。浏览 textual 的文档后，发现其示例仓库中已有一个基于 #link("https://dictionaryapi.dev/")[Free Dictionary API] 制作的命令行字典，甚为惊喜，便速取学习之，以其源码不长，信心倍增。最后照猫画虎做出来了 `openrussian-tui`。

= 程序的基本逻辑
其实基本逻辑就是：抓取网站反馈的 `.json` 文件，解析后以 markdown 格式输出，其他细节（诸如菜单、外表、键位操作）都是 `textual` 库实现的，我不了解，暂时也没兴趣学习。

== 抓取 `.json` 文件
这个很简单，python 的 `request` 库就可以实现。

== 解析 `.json` 文件
这是最难的一步，并不是说像理解群对覆盖空间的作用那种难，而是计算五位数乘法那样繁琐：因为 `.json` 文件条目太多，必须得认真分析层级结构才能提取到有用信息（当然，希望有朝一日 AI 能做到）。

`.json` 是一种用于传输信息的格式，以其结构简单，也常被用作配置文件#footnote[VSCode 的配置文件似乎就是 `.json`]，也正因其结构简单，我有这个耐心去找需要的信息。一通替换以后，终于算是把词义、例句等等东西做出来了。

== 渲染 markdown
感谢 `textual`！

== 用 `hatch` 打包并发布至 PyPi
`hatch` 是 `textual` 官方教程中推荐的打包工具，其基本用途就是帮助用户把源码打包成 PyPi 规定的格式，最后发布之。我对其原理一窍不通，总之跟着 `textual` 的教程做下来，也算是发布成功了😆。

= 小结
基本就是这样了，如果说还有什么缺憾的话，那就是 python 程序为什么不能打包成可执行文件😆？想要可执行文件的话，可能以后还是得改成 Rust 写……

但是无论如何，能做出一个对自己有用的东西，我还是很开心的！
