#import "/config.typ": template, tufted
#show: template
= 更好的上网体验
<更好的上网体验>
最后更新于 `2025-11-10`。

下文 “浏览器” 都默认指 firefox。

= 具体设置
<具体设置>
== DNS 设置
<dns-设置>
- 对于一般用户，直接参考#link("https://coding.gs/2024/06/09/available-doh/")[DoH 推荐]中的服务，找到喜欢的以后，进入
  firefox 设置，搜索 `dns`，选择 `最大保护 -> 自定义`，填入链接即可。
- （海外）公用 DoH 容易被不明力量取缔，内地 DoH
  存在限速等现象，因此对于闲人而言，自建是非常好的选择，这里推荐
  RethinkDNS，请直接参考#link("https://docs.rethinkdns.com/dns/open-source/#deno-deploy")[官方文档]。自建完以后，和上一段一样设置，填入自己的
  DoH 服务网址即可。

== Libredirect 设置
<libredirect-设置>
到
#link("https://addons.mozilla.org/firefox/addon/libredirect/")[firefox 插件商店]下载即可。

下载完成后，进入插件设置，在 `Fetch public instances` 选项中选择
`codeberg`（因为 codeberg 能稳定直连，github
不行）。在服务列表中选择想要的服务，并点击测速选择最快的实例（instance），保存后退出。

这并不是访问 Wikipedia 的唯一方法。详见下文。

== 更换谷歌 cdn
<更换谷歌-cdn>
直接#link("https://addons.mozilla.org/zh-CN/firefox/addon/google-cdn-replace/")[安装]即可。

启用以后，就能更快地访问 stack overflow。

== 拦广告
<拦广告>
启用 #link("https://github.com/gorhill/uBlock")[uBlock Origin]
插件即可，注意某地区用户无法直接从插件商店下载，请按照项目主页说明手动下载，并在启用
firefox 开发者模式后手动安装。

== 各种小工具
<各种小工具>
这些工具都能在一定程度上帮助你访问各种国外服务。个人体验以 Accesser
为佳（当然，steamcommunity302 功能更多，游戏这块依然是不可替代的王者）。

=== Accesser（开源）
<accesser开源>
见#link("https://github.com/URenko/Accesser")[Github 仓库]。

有
#link("https://aur.archlinux.org/packages/python-accesser")[AUR 包]，下载后
`sudo` 运行。

为在 firefox 中使用本服务，按如下步骤操作：

+ 打开 `localhost:7654/cert/root.crt` 下载证书；
+ 在设置中搜索 `certificates`，点击 `view certificates` 按钮；
+ 在 `authorities` 一栏中点击 `import`
  按钮，找到刚下好的证书导入，两个选项都选上；
+ 导入完成后关闭；
+ 此后的操作，见#link("https://github.com/URenko/Accesser/wiki/Firefox%E8%AE%BE%E7%BD%AE%E6%96%B9%E6%B3%95")[官方指导]；

是一个 python 程序，所以有支持手机的可能性。

=== SteamCommunity 302（不开源）
<steamcommunity-302不开源>
羽翼城|Dogfight360
大佬制作的小软件，功能非常丰富，使用指南见#link("https://www.dogfight360.com/blog/18682/")[官方指导]。

有#link("https://aur.archlinux.org/packages/steamcommunity302")[AUR 包]。

不支持手机。

=== Sheas-Cealer（开源）
<sheas-cealer开源>
见#link("https://github.com/SpaceTimee/Sheas-Cealer")[Github 仓库]。

Linux 支持不佳；但支持手机。

== （可选）Vim 键位
<可选vim-键位>
用 vim 浏览网页，直接下载 #link("https://vimium.github.io/")[Vimium]。

配合 Libredirect 服务中的 search 一起使用更佳。
