# Technical Specification — Issue #5

## 1. Issue Overview

| Field       | Value                                                                 |
| ----------- | ---------------------------------------------------------------------|
| Title       | Inside the footer, when hover onto the "Privacy Policy" nothing being displayed |
| Description | Hovering over the "Privacy Policy" footer link produced no visible feedback/tooltip. |
| Labels      | (none)                                                                |
| Priority    | Low                                                                   |
| State       | **CLOSED** — already resolved                                        |

## 2. Problem Analysis

At the time this issue was filed, `src/components/Footer.jsx` rendered the "Privacy Policy" link without any hover tooltip or visual feedback, so users saw no response when hovering — matching the attached screenshot.

Root cause confirmed via git history: the fix was landed in commit `64a1902` / `3ba2c2a` (`fix: show tooltip on footer policy links hover (#7)`), which added a `group relative` wrapper, a background-glow `<div>`, and a tooltip `<span>` reading "Coming soon" that fades in via `opacity-0 group-hover:opacity-100`.

## 3. Proposed Solution

Already implemented — no further changes required. Current markup at `src/components/Footer.jsx:143-149`:

```jsx
<a className="group relative cursor-pointer hover:text-white transition-colors duration-300">
  <span className="relative z-10">Privacy Policy</span>
  <div className="absolute inset-0 bg-gradient-to-r from-primary-600/20 to-purple-600/20 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 -inset-2"></div>
  <span className="pointer-events-none absolute bottom-full left-1/2 -translate-x-1/2 mb-2 whitespace-nowrap rounded-md bg-gray-900 px-2 py-1 text-xs text-white opacity-0 shadow-lg group-hover:opacity-100 transition-opacity duration-300">
    Coming soon
  </span>
</a>
```

This same pattern was later reused for Terms of Service, Cookie Policy (issue-related commits `902a285`, `131361d`) and Contact Us (issue #10, commit `5872f52`), giving all footer links consistent hover behavior.

## 4. Step-by-Step Implementation (as executed)

1. Wrap the "Privacy Policy" `<a>` with `group relative` classes to enable Tailwind group-hover targeting.
2. Add a background-glow `<div>` for hover visual feedback.
3. Add a tooltip `<span>`, absolutely positioned above the link, with "Coming soon" text, transitioning opacity on `group-hover`.

## 5. Verification Strategy

### Unit Tests
- Not applicable — no test suite covers footer hover states in this repo.

### Integration Tests
- Not applicable.

### Manual Checks
- Hover over "Privacy Policy" in the footer → background glow appears and "Coming soon" tooltip fades in above the link. **(Confirmed via code inspection at `src/components/Footer.jsx:143-149`.)**

## 6. Files to Modify

| File Path                       | Nature of Change                                  |
| -------------------------------- | -------------------------------------------------- |
| `src/components/Footer.jsx`      | Added hover glow + tooltip to "Privacy Policy" link (done) |

## 7. New Files to Create

None.

## 8. Existing Utilities to Leverage

| Utility                                   | Benefit                                              |
| ------------------------------------------ | ----------------------------------------------------|
| Tailwind `group` / `group-hover` pattern    | Reused consistently across all footer policy/contact links |

## 9. Acceptance Criteria

- [x] Hovering "Privacy Policy" displays visible feedback (glow + tooltip)
- [x] Tooltip style/animation consistent with other footer links
- [x] No regressions to other footer links
- [ ] Automated tests added (none exist for this component; not required per repo conventions)

## 10. Out of Scope

- Building an actual Privacy Policy page (tooltip explicitly says "Coming soon", indicating the page itself is intentionally not yet built)
- Deduplicating repeated tooltip markup into a shared `FooterLink` component (reasonable future refactor, not required to close this issue)

## Notes

This issue is already resolved and closed. Fixed by commit `64a1902` (local) / merged as `3ba2c2a` (`fix: show tooltip on footer policy links hover (#7)`). Verified the fix is present in the current codebase. No further implementation is required.
