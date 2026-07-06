---
version: alpha
name: Editorial Light
description: A brand-agnostic, warm-paper editorial design system for web and app interfaces. Light theme. Fork it and swap the tokens for your own brand.
colors:
  # Surfaces — warm off-white "paper", never pure white as the page
  bg-page: "#FAFAF7"        # primary page/app surface
  bg-1: "#FFFFFF"           # cards and raised surfaces
  bg-2: "#F2F2EC"           # secondary fill: inset panels, code/sample boxes
  bg-3: "#E6E6DE"           # tertiary fill: small tag backgrounds
  # Borders
  border: "#E6E6DE"         # default hairline
  border-strong: "#C9C9BE"  # emphasized border, dividers
  # Text — warm near-black ramp
  fg: "#2B2B27"             # primary text
  fg-2: "#5A5A54"           # secondary text
  fg-3: "#8A8A82"           # tertiary text, metadata, muted
  fg-4: "#C9C9BE"           # faint separators, disabled text
  # Accent — editorial gold
  accent: "#B8900A"         # accent text and active numerals (large/non-body)
  accent-strong: "#6B5200"  # high-contrast gold, safe for small text & focus rings
  accent-yellow: "#F5C518"  # highlighter fill (the signature marker band)
  accent-light: "rgba(245,197,24,0.18)"  # tinted accent surface
  accent-line: "rgba(245,197,24,0.55)"   # accent border
  # Status — fixed semantic vocabulary
  danger: "#C73056"         # errors, destructive actions, risk
  danger-bg: "rgba(199,48,86,0.10)"
  danger-line: "rgba(199,48,86,0.35)"
  success: "#2A7D52"        # success, positive state
  success-bg: "rgba(42,125,82,0.10)"
  warning: "#B8830F"        # warnings, in-between state
  warning-bg: "rgba(184,131,15,0.10)"
  muted: "#8A8A82"          # neutral / no-signal
typography:
  # Display & headings — Space Grotesk, tracking tightens as size grows
  heading-40: { fontFamily: Space Grotesk, fontSize: 40px, fontWeight: 600, lineHeight: 48px, letterSpacing: -0.022em }
  heading-32: { fontFamily: Space Grotesk, fontSize: 32px, fontWeight: 600, lineHeight: 40px, letterSpacing: -0.018em }
  heading-24: { fontFamily: Space Grotesk, fontSize: 24px, fontWeight: 600, lineHeight: 32px, letterSpacing: -0.01em }
  heading-20: { fontFamily: Space Grotesk, fontSize: 20px, fontWeight: 600, lineHeight: 28px, letterSpacing: -0.006em }
  heading-16: { fontFamily: Space Grotesk, fontSize: 16px, fontWeight: 600, lineHeight: 24px }
  # Body / copy — Inter
  copy-18: { fontFamily: Inter, fontSize: 18px, fontWeight: 400, lineHeight: 28px }
  copy-16: { fontFamily: Inter, fontSize: 16px, fontWeight: 400, lineHeight: 24px }
  copy-14: { fontFamily: Inter, fontSize: 14px, fontWeight: 400, lineHeight: 20px }
  # Labels — Inter, single-line, scannable
  label-14: { fontFamily: Inter, fontSize: 14px, fontWeight: 400, lineHeight: 20px }
  label-13: { fontFamily: Inter, fontSize: 13px, fontWeight: 400, lineHeight: 16px }
  # Buttons — medium weight
  button-14: { fontFamily: Inter, fontSize: 14px, fontWeight: 500, lineHeight: 20px }
  button-16: { fontFamily: Inter, fontSize: 16px, fontWeight: 500, lineHeight: 20px }
  # Mono — JetBrains Mono: kickers, metadata, code, tabular figures
  kicker-13-mono: { fontFamily: JetBrains Mono, fontSize: 13px, fontWeight: 500, lineHeight: 16px, letterSpacing: 0.12em, textTransform: uppercase }
  meta-12-mono: { fontFamily: JetBrains Mono, fontSize: 12px, fontWeight: 400, lineHeight: 16px, letterSpacing: 0.04em }
  code-14-mono: { fontFamily: JetBrains Mono, fontSize: 14px, fontWeight: 400, lineHeight: 20px }
  # Serif — pull-quotes / editorial asides
  quote-18-italic: { fontFamily: Newsreader, fontSize: 18px, fontWeight: 400, fontStyle: italic, lineHeight: 28px }
fonts:
  display: '"Space Grotesk", "Inter", system-ui, sans-serif'
  sans: '"Inter", system-ui, sans-serif'
  mono: '"JetBrains Mono", ui-monospace, SFMono-Regular, monospace'
  serif: '"Newsreader", Georgia, serif'
spacing:
  1: 4px
  2: 8px
  3: 12px
  4: 16px
  6: 24px
  8: 32px
  10: 40px
  16: 64px
  24: 96px
  base: 4px
breakpoints:
  sm: 401px
  md: 601px
  lg: 961px
  xl: 1200px
  2xl: 1400px
container: 1200px
rounded:
  sm: 6px
  md: 12px
  lg: 16px
  full: 9999px
elevation:
  raised: "0 2px 2px rgba(43,43,39,0.04)"
  popover: "0 1px 1px rgba(43,43,39,0.02), 0 4px 8px -4px rgba(43,43,39,0.04), 0 16px 24px -8px rgba(43,43,39,0.06)"
  modal: "0 1px 1px rgba(43,43,39,0.02), 0 8px 16px -4px rgba(43,43,39,0.04), 0 24px 32px -8px rgba(43,43,39,0.06)"
components:
  button-primary:   { backgroundColor: "{colors.fg}", textColor: "{colors.bg-1}", typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  button-secondary: { backgroundColor: "{colors.bg-1}", textColor: "{colors.fg}", border: "1px solid {colors.border-strong}", typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  button-tertiary:  { textColor: "{colors.fg}", typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  button-accent:    { backgroundColor: "{colors.accent-yellow}", textColor: "{colors.fg}", typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  button-danger:    { backgroundColor: "{colors.danger}", textColor: "#ffffff", typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  button-small:     { typography: "{typography.button-14}", rounded: "{rounded.sm}", padding: "0 8px", height: 32px }
  button-large:     { typography: "{typography.button-16}", rounded: "{rounded.sm}", padding: "0 16px", height: 48px }
  input:            { backgroundColor: "{colors.bg-1}", textColor: "{colors.fg}", border: "1px solid {colors.border-strong}", typography: "{typography.label-14}", rounded: "{rounded.sm}", padding: "0 12px", height: 40px }
  card:             { backgroundColor: "{colors.bg-1}", border: "1px solid {colors.border}", rounded: "{rounded.lg}", padding: "24px", shadow: "{elevation.raised}" }
  card-accent:      { backgroundColor: "{colors.accent-light}", border: "1px solid {colors.accent-line}", rounded: "{rounded.lg}" }
  card-danger:      { backgroundColor: "{colors.danger-bg}", border: "1px solid {colors.danger-line}", rounded: "{rounded.lg}" }
  tag:              { backgroundColor: "{colors.bg-1}", textColor: "{colors.fg-2}", border: "1px solid {colors.border-strong}", typography: "{typography.kicker-13-mono}", rounded: "{rounded.full}", padding: "4px 12px" }
  tag-solid:        { backgroundColor: "{colors.accent-yellow}", textColor: "{colors.fg}", typography: "{typography.kicker-13-mono}", rounded: "{rounded.full}", padding: "4px 12px" }
---

# Editorial Light

## Overview

A warm-paper editorial design system for web and app interfaces. The aesthetic
is print-on-paper: an off-white surface, a near-black warm text ramp, a single
gold accent used as a highlighter, and disciplined mono labels that make a UI
read like a well-set document rather than a dashboard. Prioritize readability
and accessibility, and use color to signal state or hierarchy, never decoration.

This is a brand-agnostic starting point. Fork it: keep the structure and swap
the token values for your own brand. Light theme only; a dark theme would
redefine the same token names.

## Colors

Surfaces are warm, not white. `bg-page` (`#FAFAF7`) is the page; `bg-1`
(`#FFFFFF`) lifts cards off it; `bg-2` (`#F2F2EC`) fills inset panels and code
boxes; `bg-3` (`#E6E6DE`) is the deepest fill. Text runs a four-step warm ramp:
`fg` primary, `fg-2` secondary, `fg-3` tertiary/metadata, `fg-4` faint/disabled.
Borders are `border` (hairline) and `border-strong` (emphasized, dividers).

**Gold is the signature.** `accent-yellow` (`#F5C518`) is a *highlighter*,
applied as a clipped band behind text (roughly the lower half of the line),
never a full fill — it mimics a marker stroke. `accent` (`#B8900A`) and
`accent-strong` (`#6B5200`) are the readable gold text tones. Mind contrast:
`accent` clears AA only for large text and numerals; use `accent-strong` (or
`fg`) for small text and focus rings.

**Status is a fixed vocabulary:** `danger` (red) for errors and destructive
actions, `success` (green) for positive state, `warning` (amber) for in-between
state, `muted` for no-signal — each with a low-alpha `*-bg` surface. Never
signal with color alone; pair it with an icon or text.

## Typography

Four families, each with one job:

- **Space Grotesk** (`fonts.display`) — headings, `heading-40` down to
  `heading-16`; tracking tightens as size grows.
- **Inter** (`fonts.sans`) — body and UI: `copy-18`/`copy-16`/`copy-14`,
  single-line `label-14`/`label-13`, and `button-*`. `copy-16` and `label-14`
  cover most text.
- **JetBrains Mono** (`fonts.mono`) — kickers, metadata, code, and tabular
  figures: `kicker-13-mono` (UPPERCASE, tracked) for section labels,
  `meta-12-mono` for metadata, `code-14-mono` for code. Prefer tabular figures
  when numbers must align in columns.
- **Newsreader** italic (`fonts.serif`) — the occasional pull-quote or aside
  (`quote-18-italic`).

Apply the tokens rather than hand-setting size, weight, or line-height.

## Layout

Spacing follows a 4px scale: 4, 8, 12, 16, 24, 32, 40, 64, 96px. Keep a
three-step rhythm — 8px inside a group, 16px between groups, 32-40px between
sections. Cards use 24px padding (16px compact, 32px for hero areas). Center
content in a 1200px column with side padding that grows at wider breakpoints,
and make every layout work from mobile to desktop. Breakpoints: `sm` 401px,
`md` 601px, `lg` 961px, `xl` 1200px, `2xl` 1400px.

## Elevation & Depth

Hierarchy comes from the tonal surface stack (`bg-page` > `bg-1` > `bg-2` >
`bg-3`) and hairline borders first, so shadows stay subtle and warm-tinted:

- Raised cards: `elevation.raised`
- Popovers and menus: `elevation.popover`
- Modals and dialogs: `elevation.modal`

Pair each elevation with the matching radius below.

## Motion

Design end-state-first: the visible final style is the base, and any entrance
animates *from* hidden so a non-animated render always shows content, never an
`opacity:0` pre-state. Use motion only when it clarifies a change. Keep it
short — roughly 150ms for state changes, 200ms for popovers, 300ms for overlays
— with a gentle ease. Avoid looping, decorative animation, and honor
`prefers-reduced-motion` by dropping nonessential motion.

## Shapes

Radii stay tight and editorial: `sm` 6px for controls, `md` 12px for menus and
popovers, `lg` 16px for cards and large surfaces, `full` for pills and avatars.
Keep one radius family per view rather than mixing rounded and sharp corners.

## Components

- **Button** — `primary` is a solid `fg` fill with a `bg-1` label, for the one
  most important action on a view; `secondary` is `bg-1` with a strong border;
  `tertiary` is transparent text for low-emphasis actions; `accent` fills gold
  for editorial emphasis; `danger` is solid red for destructive actions. Default
  is 40px; `small` 32px and `large` 48px (large steps up to `button-16`). Hover
  darkens the fill one step; disabled uses `bg-3`/`fg-3` and a not-allowed
  cursor. Focus shows a visible ring in `accent-strong` (or `fg`).
- **Input** — `bg-1` fill, strong border, `sm` radius, 40px tall.
- **Card** — `bg-1`, hairline border, `lg` radius, whisper shadow. Variants:
  `accent` (gold-tinted) and `danger` (red-tinted); a 4px left border in a
  status color is a common way to mark a card's theme.
- **Tag** — mono UPPERCASE pill; default is `bg-1` with a strong border,
  `solid` fills gold.
- **Highlight** — the gold marker band (`accent-yellow`) drawn behind a single
  important phrase as a clipped gradient, not a full background fill.

## Voice & Content

Copy is part of the design; keep it precise and free of filler.

- Title Case for labels, buttons, titles, tabs; sentence case for body, helper
  text, and toasts.
- Name actions with a verb and a noun (`Delete Member`), never `Confirm`/`OK`.
- Errors say what happened and what to do next.
- Toasts name the specific thing that changed and drop "successfully":
  `Project deleted`, not `Successfully deleted the project.`
- Empty states point to the first action.
- In-progress states use the present participle with an ellipsis: `Saving...`.
- Use numerals (`3 projects`); skip `please` and marketing superlatives.

## Do's and Don'ts

- Rank information with the surface stack and borders before reaching for shadow.
- Keep gold for the single most important phrase or action on a view.
- Hold WCAG AA contrast (4.5:1 for body text); use `accent-strong`/`fg` for
  small text and focus rings, not `accent`.
- Show the focus ring on every interactive element at `:focus-visible`; never
  remove an outline without a visible replacement.
- Apply the typography tokens instead of setting size/weight/line-height by hand.
- Don't full-fill text with `accent-yellow` — it's a highlighter band.
- Don't use pure white as the page; the surface is warm `bg-page`.
- Don't signal state with color alone; pair it with an icon or text label.
- Don't mix radius families, or more than the four type families, in one view.
