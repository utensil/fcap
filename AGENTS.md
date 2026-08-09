# Contributor instructions

## Scope

- Work on a dedicated feature branch and worktree. Treat `main` as a review and
  merge surface.
- Keep `FCAP.lean` import-free. The library glob builds every `FCAP/` module,
  while an accumulating root import creates conflicts between parallel work.
- Start independent work from the current `main`. If work depends on pull
  requests with `lgta`, record their numbers and the exact base commit in the
  pull-request body. Use a temporary branch containing only the named
  prerequisites when more than one is needed. Never use `dev` as an implicit
  feature base.
- Inspect the branch, status, recent history, and complete diff before editing.
- Preserve unrelated work already present in the worktree.
- Keep each change within the files and acceptance criteria of the current
  task.

## Commit discipline

- Make one logical change per commit.
- Stage only the intended paths, using commands such as
  `git add -- README.md AGENTS.md`. Never include unrelated modifications.
- Review `git diff --cached` and run `git diff --cached --check` before
  committing.
- Use a conventional commit subject such as `docs:`, `feat:`, `fix:`, or
  `refactor:`.
- Give every commit both a concise subject explaining why the change exists and
  a body describing the material change.
- Record verification in the commit body when it is key and nontrivial. Do not
  repeat routine commands, job counts, or generic success statements.
- Push with an explicit refspec and read the remote branch back after every
  milestone.

## GitHub communication

- AI agents own code and documentation, the `dev` integration branch, issue and
  pull-request titles and bodies, and commit messages.
- Do not post comments or apply `lgth`. Read human comments and address them
  through commits or an updated issue or pull-request body.
- Record review and revision considerations and changes only in commit
  messages.
- Keep general policy in `AI_POLICY.md`; repository operating instructions
  belong in `AGENTS.md`.

## Review states

- `lgta` means "looks good to AI agent." It applies to an exact pull-request
  head, so a new commit requires review again.
- A reviewed feature pull request with `lgta` is squash-merged into `dev`.
  `dev` is the persistent integration and testing branch, not an implicit base
  for new feature work. The resulting `dev` commit is the integration unit.
- Run the cache-first full repository verification against that exact
  integration unit. Only after it passes may a human post the holistic review
  comment and apply `lgth`, meaning "looks good to human."
- A contiguous `dev` range whose integrations all have exact-head `lgth` may
  be prepared for `main` on a temporary landing ref. Rebase the already
  squashed range onto the current `main`, then check patch equivalence,
  `git range-diff`, cache-first full verification, author and committer
  identities, and the exact proposed range.
- Advance `main` linearly to the verified rebased range. Never squash a
  feature pull request directly into `main`, create a merge commit, or apply a
  second squash. Rebase any remaining `dev` suffix onto the new `main`; if no
  suffix remains, align `dev` with `main`.

## Verification

- Follow applicable Tau Ceti and mathlib conventions.
- Restore the pinned Mathlib cache with `lake exe cache get` when the worktree
  or pin requires it, then run the full `lake build FCAP` before every public
  push.
- Treat a skipped or unavailable check as unverified, not as a pass.
- Keep public prose in American English and separate mathematical results from
  physics motivation or hypotheses.
