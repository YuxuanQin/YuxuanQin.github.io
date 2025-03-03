# 量词与集合交并补的关系

在读 Axler 的 [*Measure, Integration & Real Analysis*](https://measure.axler.net/)，其中第 36 页公式 2.49 引起了我的兴趣：Axler 是怎么写出来这种复杂的公式的？想到类型论中有着“积对于全称量词”、“余积对应存在量词”，我突然有了想法：

首先，给定一列良好函数 $\{f_i\}_{i \in I}$，使得所有的逐点极限皆存在，并定义

$$f(x) := \lim f_i(x),$$

此时可以断言：

$$f^{-1}((a, b)) = \bigcup_j \bigcup_m \bigcap_{k \ge m} f^{-1}_{k}((a, b)).$$

其实可以翻译成：

$$f^{-1}((a, b)) = \exist_j \exist_m \forall_{k \ge m}, x \in f^{-1}_{k}((a, b)).$$

这样便一目了然了。
