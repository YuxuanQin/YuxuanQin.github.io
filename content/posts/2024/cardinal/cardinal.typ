== 基数
<基数>
直接贴链接：#link("https://math.jhu.edu/~eriehl/arithmetic.pdf")[Categorifying Cardinal Arithmetic]

我们真的需要 “基数” 吗？上面那个报告（又一次）激起了读
#link("https://golem.ph.utexas.edu/category/2021/06/large_sets_1.html")[Large Sets 1]
的欲望（暑假说要读来着，结果到现在都只读完第一部分）

最近开始重新了解集合论，乃是因为伴随函子定理：

#quote(block: true)[
若 $F : cal(C) arrow.r cal(D)$ 保极限，且 $cal(C)$
完备，则它有右伴随当且仅当其满足某种解集条件
]

前面都好说，但是后面的解集条件却值得讨论一番：譬如说群的遗忘函子
$U : upright("Grp") arrow.r upright("Set")$，Mac Lane
书上的证明考虑了一些基数问题，但是我发现 “其实” 不用考虑，只要取
$S arrow.r U G$ 本身足矣，这个箭头当然有到 $S arrow.r U G$ 的箭头
$U upright("id")_G$。

那么，Mac Lane 为什么要考虑 “不必要”
的基数问题呢？答案在于，伴随函子定理要求其解集是个小集合。问题恰恰出在这里，如果采用
Grothendieck 宇宙，理应能无限扩大使得 $upright("Grp")$ 是小范畴。

要进一步了解范畴论尺寸问题，目前有如下几份资料

- #link("https://arxiv.org/pdf/0810.1279")[Set Theory for Category Theory],
  Michael Shulman, 2008.
- #link("https://arxiv.org/abs/1304.5227")[Universe for Category Theory],
  Zhen Lin Low, 2014. （看名字像个华人，但网上搜不到任何信息）

少摸鱼多读书……

另外，最近在读 Co/end
Calculus，已读完第一章，希望继续，得去打印出来，看电脑老是干别的事情去了。

读这个是因为其他资料都太#strike[差]难了，Mac Lane
书上寥寥几笔带过，之前打出来的那本抽象同伦论的书也没讲多少（前几天在读这本书，跟着#strong[验证]了几个结果，还是不太懂）。

#horizontalrule

昨晚上看完了一部很长的电影《大象席地而坐》，四小时，我第一次看这么长的电影，但不觉得拖沓。这电影让我想起残雪《苍老的浮云》，估计是两个人的作品都这么琐碎、痛苦、无望，但残雪的书更甚，在她那里，一切都没有尽头，那是一种稀松平常的压抑，#strong[没有什么好惊讶的]。

还了《波斯札记》和《戏剧》，后者很无聊。

最后，终于配好了 sway 的输入法🤣，之前打字没有候选框，昨天下了 arch
社区做的 sway-im，终于有了！看来以后要想舒服地用 sway，只能继续用 arch
衍生版了。
