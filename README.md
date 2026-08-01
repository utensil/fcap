# FCAP

FCAP is read “F-cap”, and is a coined acronym for Formalized Clifford Algebra
Programme.

Its goal is to build a modern library of Clifford algebras in Lean for efficient
symbolic and numerical computation, with formal verification of both its
mathematical foundations and executable implementations.

This repository studies Clifford algebras and their symbolic and numerical
computation. Its Lean library is developed alongside expository notes and
worked calculations.

## Theme

The question is whether Lean can serve both as a formal language for the
abstract and concrete mathematics of Clifford algebras and as an implementation
language for symbolic and numerical computation in that field.

Implementing calculation makes it possible to derive mathematical results,
such as identities, formulas, and numerical values, and to construct executable
algorithms. Both the results and the algorithms can be subjected to formal
verification.

Bridging these otherwise separately developed domains is a challenge well
suited to Lean, both as a general-purpose programming language and as a theorem
prover. Clifford algebras, in turn, have a variety of related mathematical
constructions and a wide range of applications in physics, computer graphics,
robotics, and more, making it a rich subject for study.

FCAP is therefore an ambitious and challenging research programme. In its name,
“Programme” does not mean a single program written in a programming language,
but a sustained programme of mathematical, computational, and formal work.

## Approach

FCAP takes a gradual approach to the challenges across its domains through
small, testable vertical slices. Each slice is grounded in scholarly sources
and explicit calculations, and examined through formalization as theory
modeling to expose hidden assumptions. The workflow is informed, but not
dictated, by established reference projects.

Formalization is not only an endpoint. Missing hypotheses, ambiguous
constructions, and useful reformulations found in Lean are fed back into the
Forest notes and other mathematical materials, which are corrected or reshaped
when needed.

The inquiry remains open to the many symbolic and numerical libraries built
around different decompositions of Clifford algebras. Their designs reflect both
mathematical and performance considerations, and each pattern has advantages
for particular purposes. FCAP asks how the abstract formalization established
in Mathlib can be realized through these different patterns, so that their
relationships, trade-offs, and common foundations can be understood as a whole.

## Origins and guiding intuition

Clifford algebras (a.k.a. Geometric Algebra in the context of work pioneered by
David Hestenes) are the subject of FCAP. This direction was inspired by Chris
Doran and Anthony Lasenby's [*Geometric Algebra for
Physicists*](https://doi.org/10.1017/CBO9780511807497), which later led to
[`pygae/lean-ga`](https://github.com/pygae/lean-ga) and the paper [*Formalizing
Geometric Algebra in Lean*](https://arxiv.org/abs/2110.03551). That paper was
only the beginning of Eric Wieser's PhD thesis, [*Formalizing Clifford algebras
and related constructions in the Lean theorem
prover*](https://www.repository.cam.ac.uk/items/9ad1ac65-48c4-49cd-a00c-3cec6397a93b).
There is still ongoing work in mathlib in the same vein, and it can be viewed as
an example of formalization as theory modeling, where formalization recasts
mathematical theory through representations shaped by the possibilities and
constraints of the theorem prover's underlying type theory.

FCAP takes its initial ambition from [`lean-ga`'s original
goals](https://github.com/pygae/lean-ga/blob/master/docs/misc/goals.md): generic
and concrete formalization, verified data structures and algorithms, tactics,
code generation, symbolic rewriting, and bridges to other libraries. These are
related but not identical problems, and FCAP studies how their representations
and executable forms can be connected through explicit, verified refinements.

## Components

- Forest notes support theory building, mathematical foundations, and focused
  informal proofs and calculations.
- The Lean library has three connected layers: a mathematical layer built with
  Mathlib, an implementation layer for symbolic and numerical algorithms, and
  a software-verification layer for their stated properties and connections.
- Where useful, an optional Verso Blueprint records theorem dependencies and
  nontrivial adaptations made for formalization.

To build the Lean library:

```bash
lake exe cache get
lake build
```

## Conventions

The Lean code and project workflow follow applicable conventions from [Tau
Ceti](https://github.com/TauCetiProject/TauCeti). These conventions are adapted
for this project's approach; see [`AI_POLICY.md`](AI_POLICY.md) and
[`AGENTS.md`](AGENTS.md).
