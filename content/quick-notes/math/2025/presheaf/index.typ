#import "/config.typ": template, tufted
#show: template.with(title: "The category of presheaves are cartesien closed")
#set text(lang: "en")

= The category of presheaves are cartesien closed
We will prove the title by using coend calculus, as hinted in
#link("https://arxiv.org/abs/1501.02503")[Coend Calculus] by
#link("https://tetrapharmakon.github.io/")[Fosco Loregian].

For consistence let's first formulate what to prove:

#strong[Theorem.] For any (small) category $upright(bold(C))$, its
presheaf category
$hat(upright(bold(C))) := \[ upright(bold(C))^(upright(o p)) \, upright(S e t) \]$
is cartesien closed, i.e., for any presheaves
$P \, Q \, R in hat(upright(bold(C)))$, there exist a exponential object
$R^Q$ whi is right adjoint to product:

$ hat(upright(bold(C))) \( P times Q \, R \) tilde.equiv hat(upright(bold(C))) \( P \, R^Q \) \; $

#emph[proof:] Denoting the standard yoneda embedding as $upright(bold(y)_(-))$, we now define exponential object $P^Q$ is as
$P^Q \( c \) := hat(upright(bold(C))) \( upright(bold(y))_c times Q \, R \)$.


The theorems/propositions in the comments after each equation are all in the book #emph[Coend Calculus], and 


#tufted.full-width[
$ hat(upright(bold(C))) \( P \, hat(upright(bold(C))) \( upright(bold(y))_(\( \)) times Q \, R \) \) & tilde.equiv integral_c upright(S e t) \( P c \, hat(upright(bold(C))) \( upright(bold(y))_c times Q \, R \) \) & \( upright("By Thm 1.4.1") \)\
 & tilde.equiv integral_c upright(S e t) \( P c \, integral_x upright(S e t) \( upright(bold(C)) \( x \, c \) times Q x \, R x \) \) & \( upright("By Thm 1.4.1") \)\
 & tilde.equiv integral_c integral_x upright(S e t) \( P c \, upright(S e t) \( upright(bold(C)) \( x \, c \) times Q x \, R x \) \) & \( upright("Representables preserve limits") \)\
 & tilde.equiv integral_x integral_c upright(S e t) \( P c \, upright(S e t) \( upright(bold(C)) \( x \, c \) times Q x \, R x \) \) & \( upright("By Thm 1.3.1") \)\
 & tilde.equiv integral_x integral_c upright(S e t) \( P c times upright(bold(C)) \( x \, c \) \, upright(S e t) \( Q x \, R x \) \) & \( upright("Set is cartesien closed") \)\
 & tilde.equiv integral_x upright(S e t) \( integral^c P c times upright(bold(C)) \( x \, c \) \, upright(S e t) \( Q x \, R x \) \) & \( upright("Representables turn colimts into limits") \)\
 & tilde.equiv integral_x upright(S e t) \( P x \, upright(S e t) \( Q x \, R x \) \) & \( upright("By Prop 2.2.1") \)\
 & tilde.equiv integral_x upright(S e t) \( P x times Q x \, R x \) & \( upright("Set is cartesien closed") \)\
 & tilde.equiv hat(upright(bold(C))) \( P times Q \, R \) & \( upright("By Thm 1.4.1") \)\
 $
]

QED.


Source of TeX:

```latex
\begin{align}
\hat{\mathbf{C}}(P, \hat{\mathbf{C}}(\mathbf{y}_ {()} \times Q, R)) & \cong \int_c {\rm Set}(Pc, \hat{\mathbf{C}}(\mathbf{y}_c \times Q, R))  &(\text{By Thm 1.4.1}) \\
     & \cong \int_c {\rm Set} (Pc, \int_x {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.4.1}) \\
     & \cong \int_c\int_x {\rm Set} (Pc,  {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{Representables preserve limits}) \\
     & \cong \int_x\int_c {\rm Set} (Pc,  {\rm Set}(\mathbf{C}(x, c) \times Qx, Rx)) &(\text{By Thm 1.3.1}) \\
     & \cong \int_x\int_c {\rm Set} (Pc \times \mathbf{C}(x, c), {\rm Set} (Qx, Rx)) &(\text{Set is cartesien closed}) \\
     & \cong \int_x {\rm Set} (\int^c Pc \times \mathbf{C}(x, c), {\rm Set} (Qx, Rx)) &(\text{Representables turn colimts into limits}) \\
     & \cong \int_x {\rm Set} (Px, {\rm Set} (Qx, Rx)) &(\text{By Prop 2.2.1}) \\
     & \cong \int_x {\rm Set} (Px \times Qx, Rx) &(\text{Set is cartesien closed}) \\
     & \cong \hat{\mathbf{C}}(P \times Q, R) &(\text{By Thm 1.4.1}) \\
        
\end{align}
```
