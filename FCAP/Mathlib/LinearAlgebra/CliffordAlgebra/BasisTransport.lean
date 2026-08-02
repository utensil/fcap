/-
Copyright (c) 2026 utensil. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
public import Mathlib.LinearAlgebra.ExteriorAlgebra.Basis

/-!
# Transported exterior bases

The module equivalence from a Clifford algebra to its exterior algebra gives a
coordinate basis once a basis of the generating module has been chosen. This
file records only the scalar and one-vector anchors of that choice; it does not
make a multiplication claim.
-/

@[expose] public section

namespace CliffordAlgebra

universe uι uR uM

variable {ι : Type uι} {R : Type uR} {M : Type uM}
variable [LinearOrder ι] [CommRing R] [AddCommGroup M] [Module R M]
variable [Invertible (2 : R)]

/-- Transport the exterior finite-subset basis along the inverse of the module
equivalence from a Clifford algebra to its exterior algebra. -/
noncomputable def transportedExteriorBasis (Q : QuadraticForm R M)
    (b : Module.Basis ι R M) : Module.Basis (Finset ι) R (CliffordAlgebra Q) :=
  b.ExteriorAlgebra.map (equivExterior Q).symm

@[simp]
theorem transportedExteriorBasis_apply (Q : QuadraticForm R M)
    (b : Module.Basis ι R M) (s : Finset ι) :
    transportedExteriorBasis Q b s = (equivExterior Q).symm (b.ExteriorAlgebra s) :=
  rfl

@[simp]
theorem transportedExteriorBasis_empty (Q : QuadraticForm R M)
    (b : Module.Basis ι R M) : transportedExteriorBasis Q b ∅ = 1 := by
  simp [transportedExteriorBasis, ExteriorAlgebra.basis_apply]

@[simp]
theorem transportedExteriorBasis_singleton (Q : QuadraticForm R M)
    (b : Module.Basis ι R M) (i : ι) :
    transportedExteriorBasis Q b {i} = CliffordAlgebra.ι Q (b i) := by
  have singleton_orderEmb {n : ℕ} (hcard : ({i} : Finset ι).card = n) (j : Fin n) :
      Finset.orderEmbOfFin {i} hcard j = i :=
    Finset.mem_singleton.mp (Finset.orderEmbOfFin_mem _ _ _)
  apply (equivExterior Q).injective
  rw [transportedExteriorBasis_apply, LinearEquiv.apply_symm_apply]
  simp [ExteriorAlgebra.basis_apply, ExteriorAlgebra.ιMulti_apply,
    Set.powersetCard.ofFinEmbEquiv_symm_apply, singleton_orderEmb]

end CliffordAlgebra
