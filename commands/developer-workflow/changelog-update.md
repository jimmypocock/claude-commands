CHECK for existing changelog file (CHANGELOG.md, HISTORY.md, or similar):
  - If no changelog exists, create CHANGELOG.md following Keep a Changelog format
  - Read the existing format and style to maintain consistency
DETERMINE the version number for the next release:
  - Check the current version in package.json, version file, or last changelog entry
  - Decide on version bump type based on changes (major, minor, patch following SemVer)
  - Ask user if uncertain about version bump level
ANALYZE recent commits since the last release:
  - Run git log to see commits since last version tag or changelog entry
  - Group commits by type: Added, Changed, Deprecated, Removed, Fixed, Security
  - Filter out non-user-facing changes (refactoring, tests, docs unless significant)
WRITE the changelog entry:
  - Add the new version as "Unreleased" if not releasing immediately
  - Use clear, user-focused language (not technical commit messages)
  - Include the date if releasing now
  - Format example:
    ## [1.2.0] - 2024-01-07
    ### Added
    - New feature X for better Y
    ### Fixed
    - Bug where Z would happen when...
    ### Changed
    - Improved performance of A by 50%
LINK pull requests or issues when relevant:
  - Include PR/issue numbers for traceability
  - Add contributor attributions for external contributions
REVIEW the entry for:
  - Clarity for end users
  - Completeness of all significant changes
  - Correct categorization of changes
  - Proper markdown formatting