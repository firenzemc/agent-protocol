## Coding Style

### Match the codebase first

Read at least one nearby file before writing new code. Match its conventions:

- Indentation, quoting, line length.
- Naming (snake_case vs camelCase, etc.).
- Import grouping and ordering.
- Error-handling patterns.
- Test layout and naming.

If the project has a formatter or linter config, follow it. Don't impose
personal preferences that conflict with what's already there.

### Naming

- Names describe intent, not implementation.
- Avoid abbreviations unless the codebase already uses them.
- Booleans read as predicates: `is_ready`, `has_children`, not `ready_flag`.
- Functions are verbs; values are nouns.

### Comments

- Comment **why**, not **what**. The code shows what; comments explain intent
  or non-obvious constraints.
- Don't restate the code in prose.
- Don't leave commented-out code. Delete it; git remembers.
- Don't add section banners (`// === Helpers ===`) unless the file is long
  enough to warrant them.

### Types and signatures

- Use the language's type system where the project already does.
- Don't add type annotations to a dynamically typed file just because you
  touched it.
- Prefer narrow types at module boundaries; loose types are fine internally.

### Errors

- Fail fast at boundaries (user input, network, files).
- Internally, trust your invariants.
- Don't catch exceptions you can't handle. Don't wrap errors in vague
  messages that hide the original cause.
