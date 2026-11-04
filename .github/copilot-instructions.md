# Copilot instructions for this repo

## Project shape
- This is a single-page personal portfolio, not a framework app. The main implementation is in `index.html`; there is no build pipeline, package manager, or test suite.
- `server.js` is a tiny zero-dependency static file server for local preview. It serves any file under the repo root and exposes the site on `http://localhost:3000`.
- `README.md` is the canonical source for local usage and deployment instructions. Treat it as the project contract for how this site is intended to run.

## How to work here
- Keep edits simple and static: HTML, CSS, and a small amount of inline JavaScript. Do not introduce frameworks or bundlers unless the user explicitly asks.
- For local preview, use either `node server.js` or `python -m http.server 3000` from the repo root.
- The site is designed to be a single-file experience; if you add content or assets, keep them in the root folder and update the relevant links/classes in `index.html`.

## Important patterns
- The portfolio content is hard-coded in `index.html`. Sections like experience, projects, skills, education, testimonials, and articles are embedded directly in the HTML.
- Optional sections are controlled by a `SITE` object near the end of the file:
  - `SITE.achievements`, `SITE.testimonials`, and `SITE.articles`
  - Sections stay hidden unless their list contains at least one item
- The theme toggle, contact form mailto behavior, and optional section rendering all live in the final inline `<script>` block in `index.html`. If you change structure, preserve the IDs used by those scripts (`#theme`, `#cform`, `#ach`, `#tst`, `#art`).
- The contact card logic expects a `mailto:` action and a `mailto:` URL in the final script; do not break the `submit` handler or the user-facing form flow.

## Content and asset conventions
- Portfolio metadata and profile data are authored directly in the HTML (`title`, `meta`, text blocks, links, and contact details).
- The page references an image file like `photo.png` (or a similar portrait asset) and downloads like `Durgesh_Kumar_Sharma_QA_Automation_Resume.pdf`; keep those filenames aligned with the actual files in the repo.
- The site is intentionally static and content-first. Prefer editing existing text blocks and structure over creating a separate config or backend layer.

## Deployment notes
- This repo is intended for simple static hosting: GitHub Pages or Netlify are the documented deployment targets.
- If you change the resume filename or asset names, update every `href`/`src` reference in `index.html` to match.
- Use relative paths for files in the root folder; avoid absolute paths or server-dependent conventions.

## When making changes
- Preserve the existing visual language: sticky top nav, dark/light theme via `data-theme`, and the “run panel” card styling.
- Favor minimal edits over broad refactors; the repo’s value is the handcrafted static portfolio layout, not framework abstraction.
- Before finishing, validate in a browser by serving the repo locally and checking the page loads without console errors.
