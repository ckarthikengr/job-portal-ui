# Technical Specification — Issue #10

## 1. Issue Overview

| Field       | Value                                                                 |
| ----------- | ---------------------------------------------------------------------|
| Title       | Inside the footer, when user hovers on "Contact Us" no text being displayed |
| Description | Hovering over the "Contact Us" footer link showed no tooltip text, unlike the other footer links, so users had no hint that the link navigates to the Contact page. |
| Labels      | (none)                                                                |
| Priority    | Low                                                                   |
| State       | **CLOSED** — already resolved via PR #11                             |

## 2. Problem Analysis

In `src/components/Footer.jsx`, the "Privacy Policy", "Terms of Service", and "Cookie Policy" links each render a tooltip `<span>` (absolute-positioned, `opacity-0 group-hover:opacity-100`) that displays "Coming soon" on hover. The "Contact Us" link used the same `group relative` wrapper and background-glow `<div>`, but was missing the tooltip `<span>`, so hovering only showed a subtle glow with no text — matching the screenshot attached to the issue.

Root cause confirmed directly in code, no speculation needed.

## 3. Proposed Solution

Already implemented: add a tooltip `<span>` to the "Contact Us" link matching the markup pattern of the other footer links, with copy appropriate to a live link ("Get in touch with us") rather than "Coming soon" (which applies to the placeholder policy links).

No architectural changes; single-file, mechanical fix consistent with existing pattern.

## 4. Step-by-Step Implementation (as executed)

1. Locate the "Contact Us" `<Link>` in `src/components/Footer.jsx` — identify it lacks the tooltip span present on sibling links.
2. Add `<span className="pointer-events-none absolute bottom-full left-1/2 -translate-x-1/2 mb-2 whitespace-nowrap rounded-md bg-gray-900 px-2 py-1 text-xs text-white opacity-0 shadow-lg group-hover:opacity-100 transition-opacity duration-300">Get in touch with us</span>` inside the link, after the background-glow `<div>`.
3. Verify visually / via lint that markup mirrors existing tooltip pattern.

## 5. Verification Strategy

### Unit Tests
- Not applicable — no test suite covers footer hover states in this repo.

### Integration Tests
- Not applicable.

### Manual Checks
- Hover over "Contact Us" in the footer → tooltip "Get in touch with us" fades in above the link, consistent with other footer link tooltips. **(Confirmed via code inspection at `src/components/Footer.jsx:169-177`.)**

## 6. Files to Modify

| File Path                       | Nature of Change                                  |
| -------------------------------- | -------------------------------------------------- |
| `src/components/Footer.jsx`      | Added tooltip `<span>` to "Contact Us" link (done) |

## 7. New Files to Create

None.

## 8. Existing Utilities to Leverage

| Utility                                   | Benefit                                              |
| ------------------------------------------ | ----------------------------------------------------|
| Existing tooltip markup/pattern in `Footer.jsx` (Privacy Policy, Terms of Service, Cookie Policy links) | Reused directly for visual and behavioral consistency |

## 9. Acceptance Criteria

- [x] Hovering "Contact Us" displays tooltip text
- [x] Tooltip style/animation matches other footer links
- [x] No regressions to other footer links
- [ ] Automated tests added (none exist for this component; not required per repo conventions)

## 10. Out of Scope

- Adding hover tooltips to any other UI element outside the footer
- Introducing a shared `FooterLink` component to deduplicate the repeated tooltip markup (would be a reasonable follow-up refactor, but not required to close this issue)

## Notes

This issue was already resolved by an automated Claude Code run (see PR #11, merged as commit `5872f52`, `fix: add hover tooltip text to footer Contact Us link (#11)`), and is confirmed CLOSED on GitHub. This spec documents the analysis and fix as executed; no further implementation is required.
