SCAN all project dependencies:
  - Package manager files (package.json, requirements.txt, go.mod, etc)
  - Lock files for exact versions
  - Transitive dependencies
  - Development vs production dependencies
  - Optional and peer dependencies
  - Git submodules or vendored code
CHECK for security vulnerabilities:
  - Run security audit commands (npm audit, pip-audit, etc)
  - Check CVE databases
  - Review security advisories
  - Identify critical vulnerabilities
  - Check for known malicious packages
  - Verify package authenticity
ANALYZE dependency freshness:
  - Identify outdated packages
  - Check time since last update
  - Review changelogs for breaking changes
  - Find deprecated packages
  - Identify unmaintained projects
  - Check for better alternatives
EVALUATE dependency health:
  - Download statistics and trends
  - Maintenance activity (last commit, issues)
  - Number of contributors
  - Test coverage and CI status
  - Documentation quality
  - Community size and activity
REVIEW licensing compliance:
  - Extract all license types
  - Check for incompatible licenses
  - Identify commercial restrictions
  - Find missing license information
  - Verify compliance with company policy
  - Generate license attribution file
ASSESS dependency necessity:
  - Find unused dependencies
  - Identify duplicate functionality
  - Check for built-in alternatives
  - Evaluate bundle size impact
  - Review development-only deps in production
CREATE update strategy:
  - Group updates by risk level
  - Identify breaking changes
  - Plan update sequence
  - Note required code changes
  - Estimate testing effort
  - Schedule update timeline
GENERATE audit report with:
  - Executive summary of risks
  - Critical security vulnerabilities
  - License compliance issues
  - Technical debt from outdated deps
  - Recommended immediate actions
  - Long-term modernization plan
  - Cost/benefit analysis of updates