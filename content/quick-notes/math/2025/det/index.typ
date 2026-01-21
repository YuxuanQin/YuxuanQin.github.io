#import "/config.typ": template, tufted
#show: template
= The definition of determinat
<the-definition-of-determinat>
Main reference: #link("https://linear.axler.net/")[#emph[Linear Algebra Done Right]] by
Sheldon Axler.

== Definition
<definition>
For vector space $V$ with base field $bb(k)$ and a fixed basis
$\( e_i \)$, we use $upright(A l t)_n \( V \)$ to denote its all
alternating n-froms. It's a well known fact that this is also a vector
space with dimension $1$.

For any endomorphism $T$ on $V$, i.e., a matrix, we define a
endomorphism of $upright(A l t)_n \( V \)$ as
$alpha mapsto T^(*) alpha$, the latter applied to a vector $\( v_i \)$
in $V$ as $T^(*) alpha \( v_i \) = alpha \( T v_i \)$.

We thus obtain a endomorphism $T^(*) \( - \)$ on
$upright(A l t)_n \( V \)$, since
$upright(A l t)_n \( V \) tilde.equiv bb(k)$, $T^(*)$ must be identified
with a scalar multiplication $c dot.op -$, and the constant $c in bb(k)$
is unique.

Finally, we define $upright(d e t) med T$ as the unique constant $c$ in
$bb(k)$.

== Some quick facts
<some-quick-facts>
- The determinat of identity matrix is what you want:
  $upright(d e t) \( upright(i d) \) = 1$ by definition.
- Determinat plays well with multiplication:
  $upright(d e t) \( A B \) = upright(d e t) A dot.op upright(d e t) B$
  for all morphisms $A$ and $B$. Again this is a immediately result by
  definition.
- Definition plays well with scalar:
  $upright(d e t) \( c A \) = c^n upright(d e t) A$, by definition.
- Determinat encodes the invertibility of morphisms: For all morphisms
  $A$, $A$ invertible if and only if $upright(d e t) A eq.not 0$.
  - #emph[Proof]: If $upright(d e t) A eq.not 0$, we need to prove that
    $A$ is an isomorphism. Thanks to the rank theorem of vector spaes,
    we only need to prove $A$ is injective, which is equivalent to that
    kernel is trivial. For all non-zero $v in V$, we can extend it into
    a basis $\( v \, e_i \)$, choose an alternating n-form
    $alpha eq.not 0$, we have $alpha \( v \, e_i \) eq.not 0$, so
    $alpha \( T v \, T e_i \) = T^(*) alpha \( v \, e_i \) = upright(d e t) T dot.op alpha \( v \, e_i \) eq.not 0$.
    Note that for for vectors $\( w_i \)$, $alpha \( w_i \) eq.not 0$ if
    and only if these vectors independant. So, we have that
    $T v eq.not 0$. Since $v$ is arbitrary we deduce that $T$ injective.

    The other direction is simple, due to determinat plays well with
    multiplication.
