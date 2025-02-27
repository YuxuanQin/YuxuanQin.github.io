# The category of presheaves are cartesien closed

We will prove the title by using coend calculus, as hinted in [Coend Calculus](https://arxiv.org/abs/1501.02503) by [Fosco Loregian](https://tetrapharmakon.github.io/).

For consistence let's formulate what to prove:

**Theorem.** For any (small) category $\mathbf{C}$, its presheaf category $\hat{\mathbf{C}} := [\mathbf{C}^{\mathrm{op}}, {\mathrm{Set}}]$ is cartesien closed, i.e., for any presheaves $P, Q, R \in \hat{\mathbf{C}}$, there exist a exponential object $R^Q$ whi\hat{\mathbf{C}} is right adjoint to product:

$$\hat{\mathbf{C}}(P tm Q, R) eq \hat{\mathbf{C}}(P, R^Q);$$

*proof:* In the following calculus, the theorems/propositions in the comments after each equation are all in the book *Coend Calculus*.

$$
\begin{align}
\hat{\mathbf{C}}(P, \hat{\mathbf{C}}(\mathbf{y}_ {()} \times Q, R)) & = \int_c {\mathrm{Set}}(Pc, \hat{\mathbf{C}}(\mathbf{y}_c \times Q, R))  &(\text{By Thm 1.4.1}) \\
     & = \int_c {\mathrm{Set}} (Pc, \int_x {\mathrm{Set}}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.4.1}) \\
     & = \int_c\int_x {\mathrm{Set}} (Pc,  {\mathrm{Set}}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{Representables preserve limits}) \\
     & = \int_x\int_c {\mathrm{Set}} (Pc,  {\mathrm{Set}}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.3.1}) \\
     & = \int_x\int_c {\mathrm{Set}} (Pc \times \mathbf{C}(x, c), {\mathrm{Set}} (Qx, Rx)) &(\text{Set is cartesien closed}) \\
     & = \int_x {\mathrm{Set}} (\int^c Pc \times \mathbf{C}(x, c), {\mathrm{Set}} (Qx, Rx)) &(\text{Representables turn colimts into limits}) \\
     & = \int_x {\mathrm{Set}} (Px, {\mathrm{Set}} (Qx, Rx)) &(\text{By Prop 2.2.1}) \\
     & = \int_x {\mathrm{Set}} (Px \times Qx, Rx) &(\text{Set is cartesien closed}) \\
     & = \hat{\mathbf{C}}(P \times Q, R) &(\text{By Thm 1.4.1}) \\
        
\end{align}
$$

QED.

---

The source latex:

```latex
$$
\begin{align}
\hat{\mathbf{C}}(P, \hat{\mathbf{C}}(\mathbf{y}_ {()} \times Q, R)) & = \int_c {\rm Set}(Pc, \hat{\mathbf{C}}(\mathbf{y}_c \times Q, R))  &(\text{By Thm 1.4.1}) \\
     & = \int_c {\rm Set} (Pc, \int_x {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.4.1}) \\
     & = \int_c\int_x {\rm Set} (Pc,  {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{Representables preserve limits}) \\
     & = \int_x\int_c {\rm Set} (Pc,  {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.3.1}) \\
     & = \int_x\int_c {\rm Set} (Pc \times \mathbf{C}(x, c), {\rm Set} (Qx, Rx)) &(\text{Set is cartesien closed}) \\
     & = \int_x {\rm Set} (\int^c Pc \times \mathbf{C}(x, c), {\rm Set} (Qx, Rx)) &(\text{Representables turn colimts into limits}) \\
     & = \int_x {\rm Set} (Px, {\rm Set} (Qx, Rx)) &(\text{By Prop 2.2.1}) \\
     & = \int_x {\rm Set} (Px \times Qx, Rx) &(\text{Set is cartesien closed}) \\
     & = \hat{\mathbf{C}}(P \times Q, R) &(\text{By Thm 1.4.1}) \\
        
\end{align}
$$
```
