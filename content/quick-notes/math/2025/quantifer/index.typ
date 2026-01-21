#import "/config.typ": template, tufted
#show: template
= 量词与集合交并补的关系
<量词与集合交并补的关系>
在读 Axler 的
#link("https://measure.axler.net/")[#emph[Measure, Integration & Real Analysis]]，其中第
36 页公式 2.49 引起了我的兴趣：Axler
是怎么写出来这种复杂的公式的？想到类型论中有着“积对于全称量词”、“余积对应存在量词”，我突然有了想法：

首先，给定一列良好函数
${ f_i }_(i in I)$，使得所有的逐点极限皆存在，并定义

$ f \( x \) := lim f_i \( x \) \, $

此时可以断言：

$ f^(- 1) \( \( a \, b \) \) = union.big_j union.big_m sect.big_(k gt.eq m) f_k^(- 1) \( \( a \, b \) \) . $

其实可以翻译成：

$ f^(- 1) \( \( a \, b \) \) = exists_j exists_m forall_(k gt.eq m) \, x in f_k^(- 1) \( \( a \, b \) \) . $

这样便一目了然了。
