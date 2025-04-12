# The definition of determinat
Main reference: [*Linear Algebra Done Right*](https://linear.axler.net/) by Sheldon Axler.

## Definition
For vector space $V$ with base field $\mathbb{k}$ and a fixed basis $(e_i)$, we use ${\mathrm{Alt}_n(V)}$ to denote its all alternating n-froms. It's a well known fact that this is also a vector space with dimension $1$.

For any endomorphism $T$ on $V$, i.e., a matrix, we define a endomorphism of ${\mathrm{Alt}_n(V)}$ as $\alpha \mapsto T^*\alpha$, the latter applied to a vector $(v_i)$ in $V$ as $T^*\alpha(v_i) = \alpha(Tv_i)$.

We thus obtain a endomorphism $T^*(-)$ on ${\mathrm{Alt}_n(V)}$, since ${\mathrm{Alt}_n(V)} \cong \mathbb{k}$, $T^*$ must be identified with a scalar multiplication $c \cdot -$, and the constant $c \in \mathbb{k}$ is unique.

Finally, we define $\mathrm{det}\ T$ as the unique constant $c$ in $\mathbb{k}$.

## Some quick facts
- The determinat of identity matrix is what you want: $\mathrm{det} (\mathrm{id}) = 1$ by definition.
- Determinat plays well with multiplication: $\mathrm{det} (A B) = \mathrm{det} A \cdot \mathrm{det} B$ for all morphisms $A$ and $B$. Again this is a immediately result by definition.
- Definition plays well with scalar: $\mathrm{det}(c A) = c^n \mathrm{det} A$, by definition.
- Determinat encodes the invertibility of morphisms: For all morphisms $A$, $A$ invertible if and only if $\mathrm{det} A \neq 0$.
  - *Proof*: If $\mathrm{det} A \neq 0$, we need to prove that $A$ is an isomorphism. Thanks to the rank theorem of vector spaes, we only need to prove $A$ is injective, which is equivalent to that kernel is trivial. For all non-zero $v \in V$, we can extend it into a basis $(v, e_i)$, choose an alternating n-form $\alpha \neq 0$, we have $\alpha(v, e_i) \neq 0$, so $\alpha(Tv, Te_i) = T^*\alpha(v, e_i) = \mathrm{det} T \cdot \alpha(v, e_i) \neq 0$. Note that for for vectors $(w_i)$, $\alpha(w_i) \neq 0$ if and only if these vectors independant. So, we have that $Tv \neq 0$. Since $v$ is arbitrary we deduce that $T$ injective.

       The other direction is simple, due to determinat plays well with multiplication.
