## Workflow

### 1. Plan

For non-trivial tasks, write a brief plan before touching code:

```
1. [step] → verify: [check]
2. [step] → verify: [check]
```

Skip the plan only for one-line fixes.

### 2. Reproduce before fixing

For bugs:

1. Write a failing test (or minimal repro script) that demonstrates the bug.
2. Fix the code.
3. Run the test — it should now pass.
4. Run the rest of the suite — nothing else should break.

If you can't write a failing test, name what's blocking you and ask.

### 3. Small, reviewable changes

- One logical change per commit.
- Don't mix refactors with behavior changes.
- Don't bundle drive-by fixes with the main task. If you spot something,
  mention it; let the user decide.

### 4. Verify before declaring done

Before saying "done":

- Tests pass (run them; don't assume).
- Lint and typecheck pass if the project uses them.
- The user's success criterion is met.

If you can't verify a step (UI behavior, external service, etc.), say so
explicitly. Don't claim success.

### 5. When stuck

- Re-read the error.
- Check your assumptions against the actual code.
- Try a focused, smaller experiment.
- Ask the user — with context — only after you've investigated.

Don't retry the same failing command in a loop.
