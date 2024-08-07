# 二月二十九日小记

一月没写东西，趁着闰年独有的日子记录一下。

寒假去了趟 BICMR，本来以为是讲类型论的，结果其实是去打工。有几位讲师是做应用数学或者计算数学的，他们也只不过是会用而已，讲课的时候也带着一种常见的 —— 同时当然也是无可厚非的 —— 的态度：“我不关心类型论，能用就行”，既然这样我还来干嘛……不过当然有几位讲师非常了得（~~同时也非常抽象~~），编程能力极强，同时对各种类型论感觉也很懂，但是限于时间没能一领其功夫之全貌。

那两周算是刷完了 *Mathematics in Lean*，也算是完成了一次对形式化数学的 “祛魅”？近距离接触后反倒看到了更多丑陋的东西 —— `Lean` 的代码感觉还行，但用一大堆密密麻麻的英文代替简洁的数学符号，以及定理命名的方式都不讨人喜欢（我甚至怀疑这样低的可读性能否支撑其野心）。总体来说这次去北京还是有收获的，至少不再那么狂热地对待 Lean 了，现在的重心应该从真正动手证明定理转向了理论背景的学习。

另外我还了解到，Lean 的理论基础没那么好：至少在几周前，写一个互递归都会引入选择公理。但是就最近学 `Agda` 的体验来看，Lean 就算在理论上有许多缺陷，他的交互性还是非常好的，至少优于捆绑 Emacs 的且没有实时反馈的 Agda。

总之熬了几天夜也算是糊弄出一个 “成果”：[BICMR-ai4math 寒假研讨班第七组：一二三维 Lie 代数分类 (一维、二维)](https://github.com/bicmr-ai4math/Group7-1D-2D)。

---

回想起寒假前的小目标：

> - 读完《超实数导论》前三部分；
> - 范畴论扫干净李文威前三章；
> - 认真把多变量微分学了 (参考卓里奇)；
> - 读完《英雄与坟墓》；
> - Lean 做完教程。

当然和以前的制订的目标计划一样，没有完成…… 但是这个寒假还算是有收获吧。

## 数学
**寒假没学数学** 😭，好吧，这就是事实，一点都没学。所以下面是我最近在学的：

*Hyperreals* 最近刚好看完前三部分，进入 *Nonstandard Frameworks*，我个人认为这是非常有趣的一段，详细描述了宇宙 $\mathbb{U}$ 和 extending 映射 $^*(-)$ 究竟是如何实现的，关于怎么创造出 “基本元素” 即没有内部结构的 “individual”，本书采取了不断取幂集的方式：

$$
\begin{aligned}
  \mathbb{U_0}        &:= \mathbb{X}; \\
  \mathbb{U_{n + 1}}  &:= \mathbb{U_n} \cup \mathcal{P}(\mathbb{U_n}); \\
  \mathbb{U}          &:= \bigcup_{i \in \mathbb{N}} \mathbb{U}_i.
\end{aligned} 
$$

目前的主要成果：

- Robinson' Compactness Criterion: 
  $$ B \subseteq \mathbb{R}\ \text{compact} \Leftrightarrow ^*\!\!B \subseteq \bigcup_{r \in B} \text{hal}(r). $$
- Saturation;
- Overflow principle;
- ...

书中还不断出现 “internal”、“external” 字样，我很好奇这会不会和所谓内逻辑产生关联。

## 计算机
这可算是重头戏了：我把 Windows 删了，全覆盖安装了 GNU / Debian！有了上个学期的双系统体验，转向 GNU / Linux 也几乎是必然的。

（寒假还了解了一波刷机，两天内从兴奋到平静，一台电脑就够我折腾了，手机还是算了。不过也确实意识到一点：手机是我全权所有的，我换个系统也无可非议。然而手机厂商却限制 Bootloader 锁以防刷机，这令人感到疑惑且不满。）

如前所述，开始学 `Agda`，所以也开始使用 `Emacs`，本来想试试 `Neovim`，结果 GNU / Debian 上的软件包太旧了，一直都没学，我会不会因此变为一个 Emacs 用户呢？我还看到 Linus 及一众语言之父都用 Emacs，用 Vim 的欲望渐渐消散了。Agda 的证明方式我还是不太喜欢，可能是受了 Lean 影响的缘故吧，不过 HoTTEST 用这个那我也就跟着用了。目前除了跟着暑校以外，还在以随机频率阅读 plfa……

Haskell 跟着慕课做完了第一部分，已经注册赫尔辛基大学账号，但还没拿到学生编码，证书一时半会儿拿不到，同时由于理论基础几乎一头雾水，学习也就慢慢搁置了。最近在上 cat4prog，感觉还能跟上？而且现在看视频不用开字幕了，也算是有点变化。

我寒假还想上 Cosera（名字可能打错了，我一直没记住）上的 programming language 课，在读 *Proofs and Types* 的时候看到了操作语义和指称语义，在这个网课上也看到了，但暂时没时间学。

学校开始教 `C`，看到老师电脑上有 Minecraft，哈哈。

## 书
在孔网买了二手书；在学人书店买了书，书店挺大的，但是选书并不如博尔赫斯；在北京去豆瓣书店、万圣书园也买了一些书，万圣二楼没开，就一楼而言，数量不如先锋书店，质量因文学书籍全在二楼而不可评价，反倒小小的豆瓣书店我很喜欢；自己还打印了 *Frames and Locales*、*Proofs and Types*；最近在学校又借了一点，总之就是没时间读……

寒假之前说要读完的《英雄与坟墓》，到现在也算看了一半有余，并不很惊艳，也许是还没看到第三部分吧。

以下是所买所借书目，基本都是我想读的（太多了）：

- 《李贺诗歌笺注》，这是古版，注释远不如《编年笺注》丰富，但体量小巧，希望大学期间能读完吧。😭
- 《梨俱吠陀神曲选》，只希望有时间读……
- 《涅托奇卡·涅兹万诺娃》，这似乎是新译本
- 《毛诗草木鸟兽虫鱼疏广要》
- 《数学哲学：对数学的思考》，杨睿之译的，好想抽空读！
- 《古史纪年》，图书馆借的，没注释，现在读起来比较晕
- 《秃头歌女》，很想读，想看看埃尔诺常看的戏是怎么样的
- 《俄罗斯史》，厚不可量，看看古代史补充便罢

总之，没有时间读……

## 其他
回老家和外公外婆打牌，望着田野和天空发呆，一切都那么平静、那么美好，就这样度过了，仿佛天使轻轻吻我，如今反应过来尚有余温。

在那里我没有烦恼。

---

三月二日补记：

《古史纪年》读不下去还了，以后可能买本《往年纪事》读；*Lectures on Hyperreals* 差不多是把非标准框架读完了，其中的 Internal 和 External 似乎是和 Internal Set Theory 有关。昨天继续看 Programming with cat 发现 Monad 的模样居然和 Monoid 这么像，而且又有许多新概念出现，非常有趣！
