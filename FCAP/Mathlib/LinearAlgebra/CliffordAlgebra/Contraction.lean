/-
Copyright (c) 2026 utensil. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

/-!
# Contraction kernels for exterior transport

The change-of-form construction behind `equivExterior` contains a contraction
correction. This file isolates a vanishing criterion for that correction and
its two-generator orthogonal instance. It makes no claim about arbitrary
products or a multiplicative equivalence.
-/

@[expose] public section

namespace CliffordAlgebra

universe uR uM

variable {R : Type uR} {M : Type uM}
variable [CommRing R] [AddCommGroup M] [Module R M]
variable [Invertible (2 : R)]

/-- The exterior equivalence transports a product of orthogonal generators to
the corresponding product for the zero quadratic form. -/
theorem equivExterior_ι_mul_ι_of_isOrtho (Q : QuadraticForm R M) {m n : M}
    (h : Q.IsOrtho m n) :
    equivExterior Q (ι Q m * ι Q n) =
      ι (0 : QuadraticForm R M) m * ι (0 : QuadraticForm R M) n := by
  rw [equivExterior, changeFormEquiv_apply, changeForm_ι_mul_ι]
  simp [QuadraticMap.associated_isOrtho.mpr h]

omit [Invertible (2 : R)] in
/-- Left contraction by a dual vector vanishes on an ordered generator product
when it vanishes on every generator in the list. -/
theorem contractLeft_list_prod_ι_of_forall_eq_zero
    (Q : QuadraticForm R M) (d : Module.Dual R M) (l : List M)
    (h : ∀ m ∈ l, d m = 0) :
    contractLeft (Q := Q) d ((l.map (ι Q)).prod) = 0 := by
  induction l with
  | nil => simp
  | cons m l ih =>
    simp only [List.map_cons, List.prod_cons]
    rw [contractLeft_ι_mul, h m (by simp)]
    simp [ih (fun n hn ↦ h n (by simp [hn]))]

end CliffordAlgebra
