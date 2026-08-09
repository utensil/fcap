# AI policy and provisional mechanism

In this file, "AI" refers to current trends in generative AI, especially large
language models. The acronym does not imply that these systems have achieved
human-level or superhuman intelligence or competence, as it may suggest to
many.

We believe in the transparent and responsible use of AI. We embrace AI as a
helpful technology with caveats, and a human is responsible for any errors in
work approved for merge.

Only frontier AI models that have proved competent in other professional
mathematical work recognized by professional mathematicians are used.
Guardrails, verification, and review performed by frontier AI models at higher
effort are used to gate correctness and quality.

As part of this transparency, we wish to make clear, for every change, which
parts are produced by AI agents acting under non-disclosed directives that may
or may not have been executed correctly, and which parts are the human touch.
The provisional mechanism below implements this policy.

`lgta` means "looks good to AI agent." `lgth` means "looks good to human."
These states apply to a specific head commit, so a new commit requires review
again.

The communication channels are separated. AI agents own the code
and documentation, issue and pull-request titles and bodies, and commit
messages. They do not post comments. Review and revision considerations and
changes are reflected only in commit messages. Humans own pull-request comments
and the `lgth` label.

AI agents also own `dev`, the persistent integration and testing branch for
pull-request work that has reached exact-head `lgta`. Such work is
squash-merged into `dev`, and the resulting integration unit receives
cache-first full repository verification. `dev` is not an implicit base for
new feature work.

After that verification, one holistic human comment and exact-head `lgth` make
the integration eligible for `main`. The comment has no format requirement
and may contain spelling or grammar errors, but it must faithfully represent
the human perception and consideration of the pull request.

Eligible contiguous `dev` integrations are rebased onto current `main` on a
temporary landing ref. Patch equivalence, `git range-diff`, cache-first full
verification, identities, and the exact range are checked before `main`
advances linearly. Feature pull requests are never squash-merged directly into
`main`; the landing uses neither a merge commit nor a second squash. Any
remaining `dev` suffix is rebased onto the new `main`, or `dev` is aligned with
`main` when no suffix remains.
