# *Frames and Locales* 读书笔记

*Frames and Locales* 是一本关于无点拓扑 (point-free topology) 的著作。这种新拓扑旨在用代数的观点研究拓扑空间：任给拓扑空间 $(X, \tau)$，它的开集族 $\tau$ 天然构成一个完备分配格，因而是一个 Heyting 代数，等等等等。全体 Frames 构成的范畴 $\bold{Frm}$ 有许多比拓扑空间范畴 $\bold{Top}$ 好的性质，因而引起了学者的兴趣。

我于 [nlab -- Introduction to topology 1](https://ncatlab.org/nlab/show/Introduction+to+Topology+--+1) 初见 “frame” 字样，此后我对这门学科开始产生兴趣，本页面用于发布、储存我的学习笔记。**更新频率为每周一次**（至少我希望如此 😄）

- [pdf](./frames.pdf)
- [typst 源码](./frames.typ)
- [自用 typst 模板](./template.typ)

---

编译说明：[typst](https://typst.app) 是一种新兴的排版语言，使用方便、容易上手，为避免在雕花上浪费太多时间，我没有用 TeX 组织笔记，如果你因为某种原因想自己手动编译，为避免折腾，请一并下载上文的源码及模板，并执行：

```bash
typst compile frames.typ
```
