# NeoPMx

Interactive Quarto Reveal.js presentations, workflow diagrams, and worked examples for future-looking pharmacometrics with AI agentic workflows.

## Project Structure

```text
neopmx/
├── neopmx.Rproj                 # RStudio project file
├── rproject.toml                # Declarative R package config (rv)
├── rv.lock                      # Reproducible package lockfile (rv)
├── _quarto.yml                  # Website config + shared build settings
├── index.qmd                    # Landing page (auto-lists all talks)
├── assets/
│   └── custom.scss              # Shared Reveal.js theme
├── R/
│   └── helpers.R                # Shared ggplot2 theme & PK helper functions
└── talks/
    └── 01-agentic-pmx/
        └── 01-agentic-pmx.qmd   # Starter interactive presentation
```

## Quick Start

### 1. Sync R packages with `rv`
```bash
rv sync
```
Add new packages anytime (e.g., `mrgsolve`, `rxode2`, `plotly`):
```bash
rv add mrgsolve plotly
```

### 2. Preview or render slides
If `quarto` is not already on your `PATH`, you can use RStudio's bundled Quarto binary:

```bash
export PATH="/Applications/RStudio.app/Contents/Resources/app/quarto/bin:$PATH"
```

### Preview locally
```bash
quarto preview
```

### Render the full site
```bash
quarto render
```

### Add a new presentation
1. Copy `talks/01-agentic-pmx/` to `talks/02-your-topic/` and rename the `.qmd` file to match (e.g., `02-your-topic.qmd`).
2. Update the YAML frontmatter (`title`, `subtitle`, `date`, `categories`) and slides.
3. `index.qmd` at the repo root automatically picks up the new deck.

### Publish to GitHub Pages
```bash
quarto publish gh-pages
```
