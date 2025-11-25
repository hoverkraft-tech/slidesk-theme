# @hoverkraft/slidesk-theme

Official Hoverkraft theme for SliDesk presentations.

---

[![License](https://img.shields.io/badge/License-MIT-blue)](#license)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## Overview

`@hoverkraft/slidesk-theme` delivers a production-ready Hoverkraft-branded experience for every SliDesk presentation. The theme enforces consistent styling based on the official [Hoverkraft Branding Guidelines](https://hoverkraft.cloud/en/brand-guidelines/).

## Feature Highlights

- **Enforced branding**: Colors, typography, spacing, and component styling sourced from the Hoverkraft design system.
- **Accessibility-first**: Built with high contrast ratios and readable fonts.
- **Responsive layout**: Works across different screen sizes and aspect ratios.
- **Multiple layouts**: Split views, title slides, dark slides, and more.
- **Step animations**: Progressive content reveal support.
- **Print-friendly**: Optimized print styles for handouts.

## Documentation

- Theme source lives in `packages/theme`.
- Example presentation lives in `packages/slides`.
- Generated static output is emitted to `packages/slides/build` during CI and local builds.

## Packages

| Package           | Description                                                              |
| ----------------- | ------------------------------------------------------------------------ |
| `packages/theme`  | Source for the published `@hoverkraft/slidesk-theme` package.           |
| `packages/slides` | Example SliDesk presentation showcasing the theme, used for QA and docs. |

## Installation

```bash
npm install @hoverkraft/slidesk-theme
```

Reference the theme in your SliDesk presentation:

```
/::
custom_css: node_modules/@hoverkraft/slidesk-theme/hoverkraft.css
::/

# My Presentation .[title-slide]

## Your content here...
```

## Available Slide Classes

| Class          | Description                                |
| -------------- | ------------------------------------------ |
| `.title-slide` | Gradient background for title/intro slides |
| `.dark-slide`  | Dark navy background for emphasis          |
| `.accent-slide`| Teal gradient for call-to-action slides    |
| `.split`       | Two-column layout                          |
| `.title-top`   | Title positioned at top                    |
| `.text-left`   | Left-aligned text content                  |
| `.steps`       | Progressive content reveal                 |

## Color Palette

| Color          | Hex       | Usage                |
| -------------- | --------- | -------------------- |
| Primary        | `#0066CC` | Headlines, links     |
| Primary Dark   | `#004499` | Subheadings          |
| Accent         | `#00CC99` | Highlights, CTAs     |
| Background     | `#F5F7FA` | Slide backgrounds    |
| Dark           | `#1A1A2E` | Dark slide mode      |
| Text           | `#333333` | Body text            |

## Development

Use npm workspaces to manage both packages in the monorepo:

```bash
npm install                                                    # Install workspace dependencies
npm run start --workspace=@hoverkraft/slidesk-theme-slides     # Launch example presentation
npm run build --workspaces                                     # Build all packages
```

### Local Development

1. Clone the repository
2. Run `npm install`
3. Run `npm run start` to launch the example presentation
4. Edit files in `packages/theme` to modify the theme
5. Changes will be reflected in the example presentation

### Using DevContainer

This repository includes a DevContainer configuration for VS Code / GitHub Codespaces:

1. Open in VS Code with the Remote Containers extension
2. Reopen in Container when prompted
3. Run `npm install && npm run start`

## Testing

```bash
npm run lint --workspaces    # Run linters
npm run build --workspaces   # Build all packages
npm run test --workspaces    # Run tests
```

- The example presentation can be smoke-tested locally with `npm run start`.
- Visual testing can be done by viewing the presentation in a browser.

## Releasing

1. Update semantic versioning in `packages/theme/package.json`.
2. Build the packages with `npm run build --workspaces`.
3. Validate the example presentation locally.
4. Publish the theme package via your preferred workflow.

## Contributing

Please review [`CONTRIBUTING.md`](CONTRIBUTING.md) for guidelines, review expectations, and code of conduct.

## Support

Questions or issues? Open an issue in the [GitHub repository](https://github.com/hoverkraft-tech/slidesk-theme) or start a discussion.

## License

MIT License — see [LICENSE](LICENSE) for details.
