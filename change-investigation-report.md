# 🔎 Change Investigation Report

**Target**: `src/components/Footer.jsx:155-178`
**Investigation Date**: 2026-07-10
**Repository**: https://github.com/ckarthikengr/job-portal-ui.git
**Branch**: skills

---

## 📋 Investigation Summary

| Detail                  | Value                                                              |
| ------------------------ | ------------------------------------------------------------------ |
| File(s) Analyzed         | `src/components/Footer.jsx`                                        |
| Lines Investigated       | 155–178 (Terms of Service tooltip → Cookie Policy tooltip → Contact Us link, closing `</div>`) |
| Total Commits on File    | 5                                                                   |
| Unique Authors (identities) | 2 (`ckarthikengr` and `Karthik Chinnadurai` — same person, different git identities: local commits vs. GitHub squash-merges) |
| File Age (First Commit)  | 2026-07-06 (Initial commit)                                        |
| Last Modified            | 2026-07-08 by Karthik Chinnadurai (commit `5872f52`)                |

---

## 👥 Author Breakdown

| # | Author | Email | Commits | Lines Owned (full file) | First Contribution | Last Contribution |
|---|--------|-------|---------|--------------------------|---------------------|---------------------|
| 1 | ckarthikengr | ckarthikengr@gmail.com | 2 | 178 (91.8%) | 2026-07-06 | 2026-07-07 |
| 2 | Karthik Chinnadurai | 31803948+ckarthikengr@users.noreply.github.com | 3 | 16 (8.2%) | 2026-07-07 | 2026-07-08 |

**Primary Owner**: ckarthikengr (91.8% of current lines — mostly the original static markup from the initial commit).
**Most Recent Contributor**: Karthik Chinnadurai on 2026-07-08 (commit `5872f52`).
**CODEOWNERS**: Not configured.

> Note: both identities belong to the same GitHub user (`ckarthikengr` / `31803948+ckarthikengr`). The split reflects direct local commits vs. commits merged through GitHub (PR squash-merge, committer `GitHub`), not two different developers.

---

## 📅 Change Timeline

### `5872f52` — 2026-07-08 22:51:03 +0800

- **Author**: Karthik Chinnadurai <31803948+ckarthikengr@users.noreply.github.com>
- **Message**: fix: add hover tooltip text to footer Contact Us link (#11)
- **Body**: "The other footer bottom links (Privacy Policy, Terms of Service, Cookie Policy) show a tooltip on hover, but Contact Us was missing one, so hovering showed no text." Co-authored-by: claude[bot]
- **Ticket References**: #11 (PR), relates to issue #10
- **Lines Changed**: +3 / -0 (in this file)
- **What Changed**: Added a tooltip `<span>` ("Get in touch with us") to the "Contact Us" link — lines 174-176 in the current file — bringing it in line with the tooltip pattern already used by Privacy Policy, Terms of Service, and Cookie Policy.

### `131361d` — 2026-07-07 23:32:59 +0800

- **Author**: Karthik Chinnadurai <31803948+ckarthikengr@users.noreply.github.com>
- **Message**: fix: add tooltip to Terms of Service footer link (#8)
- **Body**: "Anchor had no title/href, so hovering showed no tooltip and looked unresponsive." Co-authored-by: Claude Sonnet 5
- **Ticket References**: #8 (PR)
- **Lines Changed**: +4 / -1
- **What Changed**: Follow-up fix targeting the Terms of Service link specifically (separate PR from #7, landed 8 seconds later — likely a duplicate/companion fix for the same underlying issue).

### `3ba2c2a` — 2026-07-07 23:32:51 +0800

- **Author**: Karthik Chinnadurai <31803948+ckarthikengr@users.noreply.github.com>
- **Message**: fix: show tooltip on footer policy links hover (#7)
- **Body**: "Privacy Policy, Terms of Service, and Cookie Policy links have no destination yet, so hovering appeared to do nothing (issue #5). Add a 'Coming soon' tooltip to give users feedback on hover."
- **Ticket References**: #7 (PR), fixes issue #5
- **Lines Changed**: +9 / -0
- **What Changed**: Introduced the tooltip `<span>` pattern (`pointer-events-none absolute ... group-hover:opacity-100`, text "Coming soon") for Privacy Policy, Terms of Service, and Cookie Policy — this is the origin of the pattern later reused for Contact Us in `5872f52`. Directly produced lines 154-159 and 161-166 in the current file (within the requested range).

### `5af6bf1` — 2026-07-07 08:03:05 +0800

- **Author**: ckarthikengr <ckarthikengr@gmail.com>
- **Message**: fix: show pointer cursor on footer policy links hover
- **Body**: "Anchor tags for Privacy Policy, Terms of Service, and Cookie Policy had no href, so browsers rendered the default cursor on hover instead of a pointer, making them appear unresponsive/broken." Co-Authored-By: Claude Sonnet 5
- **Ticket References**: None found
- **Lines Changed**: +3 / -3
- **What Changed**: Added `cursor-pointer` class to the policy link anchors (precursor fix, one day before the tooltip fixes above addressed the same "looks broken on hover" complaint more completely).

### `29b8643` — 2026-07-06 23:09:47 +0800

- **Author**: ckarthikengr <ckarthikengr@gmail.com>
- **Message**: Initial commit: Job Portal UI React app
- **Body**: —
- **Ticket References**: None found
- **Lines Changed**: N/A (initial add of file)
- **What Changed**: Original scaffold of `Footer.jsx`, including the base markup for all footer links (Terms of Service, Cookie Policy, Contact Us structure) without hover tooltips — this is what the later fixes patched.

---

## 🔬 Line-by-Line Blame (Current State, lines 155-178)

| Line(s) | Code (truncated) | Author | Date | Commit |
|---------|-------------------|--------|------|--------|
| 155 | `<span className="relative z-10">Terms of Service</span>` | ckarthikengr | 2026-07-06 | Initial commit |
| 156 | `<div className="absolute inset-0 ...">` | ckarthikengr | 2026-07-06 | Initial commit |
| 157-159 | tooltip `<span>` "Coming soon" (Terms of Service) | Karthik Chinnadurai | 2026-07-07 | `3ba2c2a` (#7) |
| 160 | `</a>` | ckarthikengr | 2026-07-06 | Initial commit |
| 161 | `<a className="group relative cursor-pointer ...">` | ckarthikengr | 2026-07-07 | `5af6bf1` |
| 162 | `<span className="relative z-10">Cookie Policy</span>` | ckarthikengr | 2026-07-06 | Initial commit |
| 163 | `<div className="absolute inset-0 ...">` | ckarthikengr | 2026-07-06 | Initial commit |
| 164-166 | tooltip `<span>` "Coming soon" (Cookie Policy) | Karthik Chinnadurai | 2026-07-07 | `3ba2c2a` (#7) |
| 167 | `</a>` | ckarthikengr | 2026-07-06 | Initial commit |
| 168-173 | `<Link to="/contact">` ... `<span>Contact Us</span>` + glow `<div>` | ckarthikengr | 2026-07-06 | Initial commit |
| 174-176 | tooltip `<span>` "Get in touch with us" (Contact Us) | Karthik Chinnadurai | 2026-07-08 | `5872f52` (#11) |
| 177 | `</Link>` | ckarthikengr | 2026-07-06 | Initial commit |
| 178 | `</div>` | ckarthikengr | 2026-07-06 | Initial commit |

Blame block summary: the requested range is the tail end of the footer's bottom-link row (Terms of Service → Cookie Policy → Contact Us). Base structure is from the initial commit; every tooltip `<span>` in this range was added later, one link at a time, across three separate hardening commits.

---

## 🎫 Linked Tickets & References

| Ticket ID | Commit | Author | Date | Commit Subject |
|-----------|--------|--------|------|-----------------|
| #5 (issue) | `3ba2c2a` | Karthik Chinnadurai | 2026-07-07 | fix: show tooltip on footer policy links hover (#7) |
| #7 (PR) | `3ba2c2a` | Karthik Chinnadurai | 2026-07-07 | fix: show tooltip on footer policy links hover (#7) |
| #8 (PR) | `131361d` | Karthik Chinnadurai | 2026-07-07 | fix: add tooltip to Terms of Service footer link (#8) |
| #10 (issue, implied) | `5872f52` | Karthik Chinnadurai | 2026-07-08 | fix: add hover tooltip text to footer Contact Us link (#11) |
| #11 (PR) | `5872f52` | Karthik Chinnadurai | 2026-07-08 | fix: add hover tooltip text to footer Contact Us link (#11) |

`5af6bf1` (pointer-cursor fix) has no ticket reference — likely an ad-hoc fix made in the same debugging session as issue #5, one day before the formal tooltip fix landed.

---

## 💡 Insights

- **Churn Assessment**: High recent churn for a single UI element — 4 of the file's 5 commits (80%) touched this exact footer-links region within a 2-day window (2026-07-07 to 2026-07-08). This reflects an incremental, link-by-link fix pattern rather than one comprehensive change: cursor fix → policy tooltips → Terms of Service tooltip (duplicate/companion PR) → Contact Us tooltip.
- **Bus Factor**: Effectively 1 (both git identities are the same person/repo owner). No CODEOWNERS or second reviewer visible in history — low bus factor risk in practice since it's a single-maintainer project, but worth noting for future collaborators.
- **Stale Code Risk**: None — this region was actively touched as recently as 2026-07-08 (2 days before this investigation).
- **Review Gaps**: Commits `3ba2c2a` (#7) and `131361d` (#8) both target the "Terms of Service" tooltip within 8 seconds of each other, suggesting a duplicate/parallel PR was merged for the same fix — worth checking whether `#8` was redundant or fixed something `#7` missed. The pointer-cursor commit (`5af6bf1`) has no issue/PR reference at all, unlike the other four commits.

---

## Notes on Interpretation

The requested range `155-178` targets the tail of the footer's link list — Terms of Service tooltip, Cookie Policy tooltip, and the Contact Us link block. This is the same region investigated in prior sessions for GitHub issues #5 (Privacy Policy tooltip missing) and #10 (Contact Us tooltip missing); this report confirms via git history that both were fixed and shows the full incremental fix sequence that built up the current tooltip pattern across all four footer links.
