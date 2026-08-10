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
Applying `lgta` is closely human-steered and requires a separate human gate.
The agent's review verdict alone does not authorize the label.

`lgth` records human judgment of the pull request as a whole and remains valid
across later commits.

The communication channels are separated. AI agents own the code
and documentation, issue and pull-request titles and bodies, and commit
messages. They do not post comments. Review and revision considerations and
changes are reflected only in commit messages. Humans own pull-request comments
and the `lgth` label.

AI agents own `dev` integration and testing; humans own approval for `main`.
Human review consists of one holistic comment and `lgth`. The comment has no
format requirement and may contain spelling or grammar errors, but it must
faithfully represent the human perception and consideration of the pull
request.

`AGENTS.md` is authoritative for branch topology, integration, verification,
and landing procedure. This file records responsibility and review ownership
without duplicating those operations.
