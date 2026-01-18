#import "/config.typ": template, tufted
#show: template
= 十二月小记之二
<十二月小记之二>
上次记录以来生了一次病，身上忽冷忽热，在寝室躺了一周，前三天几乎没有除睡觉以外的欲望，应该是新冠。写此文以庆贺#strong[复活]！

== 数学
<数学>
这几天又知道了一些名词，也算是有一些收获吧，姑记录于此，备考。

- 借了 Goldblatt 所著 #emph[Lectures on the Hyperreals] (GTM 
  188)，这是我第一本 GTM 嘿嘿，算是对非标准分析的初步理解，超实数
  Hyperreals 的 (其中一种) 构造尤其简单：全体实数序列 (意味着可数项分量)
  $r = chevron.l r_1 \, r_2 \, dots.h chevron.r$ 的等价类。即
  $""^convolve bb(R) := bb(R)^(bb(N)) \/ equiv$,
  $r equiv s med med i f f med med { k in N : r_k = s_k } in F$，其中
  $F$ 是 $N$ 上的 (某个) 非主超滤。 　

  用超实数证明中值定理显得很简单，主要依据是转换原理，把区间分为无穷多长度无穷小的段，然后根据有限段的推理，得出无穷段的结论。最后依赖于一个比较重要的纲领完成证明：两个实数无穷接近，那么它们是同一个实数。
  　

  另外书中提到，如果承认连续统假设，则如是构造出来的超实数在同构意义下唯一，即这样的超实数集不依赖于滤子
  $cal(F)$ 的选取。

- 借了汪芳庭先生的《算术超滤》希望能在寒假读一读。另外，还借了许全华的《泛函分析讲义》，意外地发现这本书有一张学长留下的纸条：

#quote(block: true)[
=== 彩蛋
<彩蛋>
许全华的泛函大概是目前你所能找到的中文泛函分析教材 (本科水平)
中最好的。事实上，泛函的中文教材中只有 Kolmogorov, Lax 的值得一看。但
Kolmogorov 的两册太老了 (但很详细，如对于 Fourier
算子的矩阵表示，见下册，是别的教材中没有的)，Lax 很丰富但相对太简单了。

许书好在涉及了一些较现代的内容 (尤其是习题，可以参考 Albiac 的
#emph[Topics in Banach Space Theory]
(GTM 233))，这也是由于许全华继承了法国 Pisier，Maurey
泛函学派。这与某变分学院士的书形成对比。学过本书后，你可以继续学习上述
Albiac 的书，或了解 Assaf Naor
的工作，这些都是国内泛函研究不曾涉及的、比较奇趣的主题。

不愿留下姓名的学长 \
QQ:850458544
]

- 开始了解构造主义数学：今天看了一个科普视频 #emph[Five Stages of
  Accepting Constructive Mathematics] (本视频有
  #link("https://www.ams.org/journals/bull/2017-54-03/S0273-0979-2016-01556-4/S0273-0979-2016-01556-4.pdf")[pdf 稿]
  并
  #link("https://www.ias.edu/video/members/1213/0318-AndrejBauer")[录像]，请注意这个链接指向
  YouTube；另有
  #link("https://www.bilibili.com/video/BV1Bt411m7DN")[国内搬运])，而且还挺认真地读了
  #link("https://ncatlab.org/nlab/show/constructive+mathematics")[nlab 上关于构造主义数学的词条]，算是有了一个大概的了解。

  - 构造主义者#strong[并不认为]排中律是错的，他们只是#strong[不承认]。
  - 构造主义者通常也#strong[不承认]选择公理，因为选择公理蕴含排中律
    (视频中给出了证明，注意这个蕴含关系直到 1970 年才被发现)。
  - 没有排中律我们也能做很多事。
  - 同样地，没有选择公理我们也能做很多事，例如在无点拓 (Point-free /
    Pointless Topology) 中，可以在不承认选择公理与排中律的情况下证明
    Tychonoff 定理
    (当然，这是在#strong[无点拓扑]中；于通常的拓扑学而言，本定理甚至蕴含选择公理)。
  - 就算是传统数学家 (#strike[都什么年代还在做传统数学])
    也有关心构造主义数学的理由：在一些非常有趣的范畴里，它们的 "内逻辑"
    (Internal logic) 可能不支持选择公理，乃至排中律。另外有一些 Topos
    似乎能作为构造主义数学生存的土壤。

辑录一些适合读的文章于此 (构造主义数学、HoTT 等)：

- #link("https://www.ams.org/journals/bull/2018-55-04/S0273-0979-2018-01616-9/S0273-0979-2018-01616-9.pdf")[AN INTRODUCTION TO UNIVALENT FOUNDATIONS FOR MATHEMATICIANS]
- #link("http://www2.masfak.ni.ac.rs/cmfp2013/Nis%20lecture%20170113.pdf")[Introducing Constructive Mathematics]
- #link("https://arxiv.org/pdf/1711.01477.pdf")[An introduction to univalent foundations for mathematicians]
- #link("https://arxiv.org/pdf/1703.03007.pdf")[Homotopy type theory: the logic of space]
- #link("https://projecteuclid.org/journals/review-of-modern-logic/volume-6/issue-3/Interview-with-a-constructive-mathematician/rml/1204835729.full")[INTERVIEW WITH A CONSTRUCTIVE MATHEMATICIAN]
- #link("https://unimath.github.io/SymmetryBook/book.pdf")[S Y M M E T R Y]
  ------ 一本据说用类型论视角探讨群论的书
- #link("https://web.math.princeton.edu/~nelson/papers/warn.pdf")[Warning Signs of a Possible Collapse of Contemporary Mathematics]
  ------ 一位极端的构造主义数学家 Edward Nelson
  向学界发出的警告。(他不是民科，至少此人曾在普林斯顿任教，另外 nlab
  称他为 #emph[Ultrafinitism]。)

#strong[准备先读 five stage 的 pdf，再读 interview]。

== 其他
<其他>
现在看来似乎这里才是重头戏，数学几乎没咋学。😂

买了《亡灵书》《古埃及圣书字导读》，目前看着还挺有意思的，但是古埃及的字那么多象形符号，居然大部分是用来表音的？！只能说对汉字更生一分喜爱。而且最近又开始读《诗经》了，读到
“赳赳武夫，公侯干城” 的时候感叹自己高三古文没白读，还能记起来 “干”
指盾牌。

借了穆齐尔《在世遗作》、波拉尼奥《重返暗夜》，还有一位不太认识的作家
------ 让 · 热内 ------ 的作品《阳台》，寒假准备读完 ……
嘶，之前买的《英雄与坟墓》还没读呢，上面那么多数学材料还没读呢 ……
(更别说暑假买的一堆书)

借了《分析哲学导论》，读了开头。

对了，还买了徐明《符号逻辑讲义》，很可惜是盗版！



== 寒假计划
<寒假计划>
暂时不写太详细了：

- 读完《超实数导论》前三部分；
- 范畴论扫干净李文威前三章；
- 认真把多变量微分学了 (参考卓里奇)；
- 读完《英雄与坟墓》；
- Lean 做完教程。

这些做完之后应该也没时间了。
