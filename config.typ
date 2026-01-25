#import "tufted-lib/tufted.typ" as tufted

#let template = tufted.tufted-web.with(
  // 你可以在 header-links 中修改网站上方的导航栏都包含哪些页面
  // 例如，如果你想添加一个 Entry 页，你需要添加 `"/Entry/": "Entry"`
  // 然后在 `content/` 路径中新建 `Entry/`路径，在其中添加 `index.typ` 作为 Entry 页的内容
  header-links: (
    "/": [*主页*],
    "/whoami/": [*我是谁？*],
    "/interest/": [*兴趣*],
    "/posts/": [*博文*],
    "/links/": [*有用的网站*],
    "/quick-notes/": [*笔记*],
    "/readings/": [*读书*],
    "/misc/": [*杂物*],
  ),
  lang: "zh",
  title: "秦宇轩的个人主页",  // 标签页名称

  // 自定义 header 和 footer 元素
  // 数组格式，可以添加任意数量的内容，内容之间使用换行分隔
  footer-elements: (
    "无敌之人的博客",
    [模板：#link("https://github.com/Yousa-Mirage/Tufted-Blog-Template")[Tufted-Blog-Template]],
  ),
)
