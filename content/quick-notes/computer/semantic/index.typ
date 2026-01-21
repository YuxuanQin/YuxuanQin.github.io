#import "/config.typ": template, tufted
#show: template
= Denotational Semantics (指称语义)
<denotational-semantics-指称语义>
这是我阅读 #link("https://en.wikibooks.org/wiki/Haskell/Denotational_semantics")[Haksell Wiki book/Denotational Semantics]
的笔记。

给定一串符号序列，我怎么赋予它意义？譬如 `Int -> Int`，把 `Int` 与
$bb(Z)$
联系起来，把原来的表达式与数学中的函数联系起来，这是很自然的做法。这种把无意义的符号#strong[指向]已经有意义的物件，从而赋予表达式语义的手段，可以认为是指称语义。

函数式编程与指称语义强绑定，命令式编程与#strong[操作]语义强绑定：在命令式语言中，一段程序常常伴随有副作用，我怎么在数学世界中描述这个副作用呢？譬如在
C 语言中定义的如下函数：

```c
int f (int x) {
  return x + 1;
  printf ("this is not pure");
}
```

我该怎么给它写签名？

#quote(block: true)[
#strong[注意]

其实可以用单子 (Monad)
给它写签名，在文章中也提到了这一点。要给命令式程序赋予指称语义，这是一种常见办法。
]

被指向的数学对象，一同构成了所谓#strong[语义域] (Semantics Domain)。

== 选取什么样的语义域？
<选取什么样的语义域>
看起来，一切对应都是很显然的，但是考虑：

```haskell
shaves :: Integer -> Integer -> Bool
1 shaves 1 = True
2 shaves 2 = False
0 shaves x = not (x `shaves` x)
_ shaves _ = False
```

文章说，把 `1`, `2`, `3` 想象为男人，则这个 `shaves`
函数表明了这个人是否给自己刮胡子，譬如说，`1` 给自己刮胡子，而 `2`
不给自己刮胡子，而 `0`
则是修面师傅，只给那些不刮胡子的懒汉刮胡子，那么我们该如何决定
`0 shaves 0` 的值呢？

很明显，这是罗素悖论，所以 `Haskell`
的定义域，也就是类型签名的前段，并不是数学意义上的定义域 —— `shvaes`
无论如何不能给 `0`
赋值。所以，数学让了步，我们的语义域中容纳了#strong[部分函数] (英文
partial functions，如果有歧义，备选译名 “偏函数”)，也就是说，我们承认
${ f : bb(Z) arrow.r bb(Z) }$
这个集合中的某些函数可以偷懒：对某些元素不进行定义。

== $tack.t$ 与部分函数
<bot-与部分函数>
为了解决上面这种情况，也就是为了定义函数，我们引入了特殊值
$tack.t$，念作
bottom，当函数无法在某一点取值时，我们强行赋予这个值。所以，当我们指称到数学对象的时候，那些集合其实都暗含这个元素，譬如说，$bb(Z)$
不再是简单的 ${ 0 \, 1 \, 2 \, dots.h }$，而是

$ { tack.t } union { 0 \, 1 \, 2 \, 3 \, dots.h.c } $

为避免歧义，这种添加了 bottom
的集合通常加一个下标，譬如上面这个集合，一般写作 $bb(Z)_tack.t$，也记为
$bb(Z)$ 的#strong[提升]
(lifting)。可见，几乎每个类型，或者说语义域当中的集合都含有这样一个
bottom，我们用不同的下标区分即可。

注意，这个 bottom 并不止是一个新元素，它在 Haskell 中写作
`undefined`，它暗含了“不可能停止”、“完全没意义”的意思。我们看这个函数：

$ g \( x \) = cases(delim: "{", 1 \, & x = tack.t \,, tack.t \, & upright("otherwise") \;) $

这个函数太怪了，也就是说，它能对没有意义的东西 (bottom)
赋予意义，而对有意义的东西竟不能赋予意义！这引出了 “更有定义”
的概念：很显然，任何整数都比 bottom 有意义，我们用符号

$ tack.t subset.sq n $

表示这一点，类似地，用 $k subset.sq m$ 表示 $m$ 更有意义，或者 $k$ 和
$m$ 其实相等。注意，这是 $bb(Z)_tack.t$ 上的偏序。

#quote(block: true)[
#strong[例子]

$1 subset.eq.sq 1$，因为 $1 = 1$；
$1 subset.eq.sq.not 2$，因为这两个数的定义层级显然是一样的，同时，$1 eq.not 2$。
]

当然，这个偏序也能拓展到函数层面，只需注意函数层面的
“更有定义”，乃是逐点的：

$ f subset.eq.sq g thin arrow.l.r.double thin forall x \, f \( x \) subset.eq.sq g \( x \) . $

#quote(block: true)[
#strong[注意]

- 判定某个表达式等不等于
  bottom，其实等价于判断这个表达式会不会停机。所以在 Haskell 中，不能对
  bottom 做模式匹配！
- bottom 同化别人的能力是无限大的：任何整数与 bottom 作运算，结果都是
  bottom（也许 $0 dot.op tack.t$ 不算？也许这就牵涉到惰性求值了。）
]

== 关于 $subset.eq.sq$ 单调
<关于-sqsubseteq-单调>
部分函数应当关于上面这个偏序单调——我给你更有意义的输入，你至少得给我同等意义的东西。

== 都单调了，还不研究一下收敛？
<都单调了还不研究一下收敛>
我们可以用这个单调性来研究收敛，譬如说探究阶乘函数的收敛序列，首先：

$ upright("fact") \( n \) = cases(delim: "{", 1 \, & n = 0 \,, n dot.op upright("fact") \( n - 1 \) \, & upright("otherwise") \;) $

其次定义如下单调的函数序列：

$ f_0 \( x \) := tack.t \, f_1 \( x \) := cases(delim: "{", 1 \, & x = 0 \;, tack.t \, & upright("otherwise") \;) \, f_2 \( x \) := cases(delim: "{", 1 \, & x = 0 \;, 1 \, & x = 1 \;, tack.t \, & upright("otherwise") \;) \, dots.h $

\(别忘了函数的 “更有定义” 是逐点的，所以显然有
$f_k subset.eq.sq f_(k + 1)$，更严谨——也更啰唆——的定义参考原文，那里用了泛函来定义这个序列。）

== $subset.eq.sq$ 是完备偏序
<sqsubseteq-是完备偏序>
对于一个偏序集而言，如果每条链都有上确界和下确界，那么我们称这个偏序是完备偏序
(Complete Partial Order,
#strong[cpo])，显然，对于整数而言，上面这个偏序是完备的。因此我们可以利用整数上的
cpo 来定义收敛的函数序列：因为函数是逐点定义的！

$ upright("fact") : n mapsto sup { f_0 \( n \) \, f_1 \( n \) \, f_2 \( n \) \, dots.h } \, $

上式确有定义，因为右侧是在整数中取上确界，而自然数关于 $subset.eq.sq$
完备！

== 严格与非严格
<严格与非严格>
考虑

```haskell
one :: Int -> Int
one _ = 1
```

那么，`one (undefined :: Int)` 的结果应该是什么？基本上有两种观点：

- 当然是 `1`，因为 `one` 根本不考虑输入值；
- 当然是 `undefined`，因为输入值是不可理解的！

第一种观点是非严格语义，也是 Haskell
的默认求值策略；而第二种则是严格语义，是 ML 和 Lisp
的默认策略。更详细点，如果对任意 $f$，

$ f \( tack.t \) = tack.t \, $

那么这个编程语言就是严格的，当然，反过来也成立——这就是“严格语言”的定义。

#quote(block: true)[
#strong[注记]

- 非严格语义的求值策略常被称为惰性求值。
- 同时，Lisp 的严格语义也昭示着关于 `thunk`
  的讨论是有意义的——模拟惰性求值。
]

== 代数数据类型 (Algebraic Data Types)
<代数数据类型-algebraic-data-types>
#strong[注意，我们讨论几乎每个类型都被提升了。]

把某个类型的全体语义对象汇集到一起，我们说这是一个域 (domain)。

#quote(block: true)[
#strong[跑题]

Domain Theory 的 Domain，正是这里提到的 Domain！
]

如果一个域只有一层意义，那么我们说这是一个平坦域 (Flat domain)，例如
`Integer`，它的意义层级可以描绘成：

```
 1    2    3  ...
  \   |   /
   \  |  /
    \ | /
     bot
```

其中，意涵少的东西在下面，或者干脆点，这是一幅 Hesse
图。它只有一层意义，因为 bottom 没有意义。当然，`Bool` 也是平坦域。

再看看 `Maybe`
类型，我们将发现严格语言和非严格语言的不同之处！首先来看看非严格语言：

```
               Just True      Just False
                     \          /
                       \      /
        Nothing        Just bot
             \          /
              \        /
               \      /
                 bot
```

在这里，`Just bot` 并不等于 `bot`，为什么？(#strike[Since Just bot is
just bot!])，因为它多了个构造器
`Just`，同时，他们的性态也不同——我们可以构造一个用以区分他们的函数：

```haskell
foo (Just _) = True
foo Nothing  = Fasle
```

在这里，`foo $ Just bot = True`，而 `foo bot = bot`！

但是对于严格语言而言，既然 `f bot = bot` 对任意 `f`
都成立，那么上面那个图当然必须得是平坦的。

#quote(block: true)[
#strong[注记]

- 书上说，严格语言中的所有图都是平坦的；
- 非平坦图在惰性求值中有用处。
]


剩下的内容感觉没写完，而且也主要是关于 Haskell 本身的，姑且速记如下：

- `~` 符号可以强制输入值进入哪条赛道，做到#strong[强制]惰性：

  ```haskell
  f ~(Just x) = x + 1
  f Nothing   = 0      -- 其实这一行根本没效果
  ```

  这样所有输入值都会被认作是 `Just x` 的形式，事实上也确实如此，执行
  `f Nothing`，ghci 会提示
  `*** Exception: <interactive>:(6,1)-(7,13): Non-exhaustive patterns in Just x`，所以下面那一行定义根本不会被识别！上面所说的强制惰性便是指，你给我的输入，我甚至懒到连
  `Just ...` 的形式都不检查了，全盘收下便是。

- `!` 强制严格求值，主要是在定义类型的时候使用：

  ```haskell
  data Maybe' a = Just' !a | Nothing'
  ```

  这样，每当程序中出现 `Just' ...`
  的时候，省略号里的内容都会被严格求值。

最后，对于数学中常见的 `... = SomeThingAbout(x), where x satisfy ...`
句式，我们可以在 Haskell 中用 `let` 句式来模拟：

```haskell
nat :: [Int]
nat = let
        nat = 1 : (map (+1) nat)
      in
        nat
```

上面这段代码和如下数学表达式是一样的：

$ upright("nat") = U "where" U = 1 union "addOne" ( upright("nat") ) . $

所以，只要把定义物满足的条件写在 `let` 语句中即可。

五月二十二日早晨
