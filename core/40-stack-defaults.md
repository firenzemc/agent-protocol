## Stack Defaults

When the project doesn't constrain the choice and the user hasn't specified,
default to widely-supported, low-friction tools. Override these whenever the
project or the user says otherwise.

### Languages

- **Python** — 3.11+, type hints at module boundaries, `pyproject.toml`,
  `ruff` for lint + format, `pytest` for tests.
- **TypeScript** — strict mode on, ESM, `vitest` for tests.
- **Shell** — `bash` with `set -euo pipefail`. Prefer Python for anything
  beyond ~50 lines.

### Package managers

- **Python** — `uv` if available, otherwise `pip` with a virtualenv.
- **Node** — match the lockfile (`pnpm-lock.yaml` → pnpm, etc.). Default
  to `pnpm` for new projects.
- **Rust** — `cargo`.

### Testing

- Co-locate tests with code when the language idiom allows; otherwise
  mirror the source tree under `tests/`.
- Test names describe behavior: `test_returns_empty_list_when_input_is_none`,
  not `test_1`.
- One behavior per test, not one assertion per test.

### Formatting and linting

- Use the project's existing config. Don't introduce a new formatter
  without asking.
- For greenfield projects: `ruff` (Python), `prettier` + `eslint` (JS/TS),
  `rustfmt` + `clippy` (Rust).

### Dependencies

- Don't add a dependency for something the standard library handles in a
  few lines.
- Pin major versions; let minor float unless the project pins more
  strictly.
- Check the existing lockfile before adding anything new.
