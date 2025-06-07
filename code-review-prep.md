RUN pre-review checks:
  - Execute all tests and ensure they pass
  - Run linting and fix any issues
  - Check code coverage hasn't decreased
  - Verify build succeeds
  - Run security scanning if available
  - Check for console.log or debug statements
REVIEW your own changes:
  - Re-read all modified files
  - Ensure code follows project conventions
  - Check for obvious bugs or typos
  - Verify edge cases are handled
  - Confirm error handling is appropriate
  - Look for performance issues
ADD helpful context for reviewers:
  - Write clear PR title and description
  - Explain the why, not just the what
  - Link to relevant tickets or issues
  - Describe testing approach
  - Note any areas needing special attention
  - Include screenshots for UI changes
ANNOTATE complex changes:
  - Add PR comments explaining tricky logic
  - Point out potential concerns
  - Suggest areas for reviewer focus
  - Explain architectural decisions
  - Note any temporary solutions
CREATE review checklist:
  - [ ] Tests added/updated
  - [ ] Documentation updated
  - [ ] No sensitive data exposed
  - [ ] Follows coding standards
  - [ ] Performance impact considered
  - [ ] Accessibility checked (if UI)
  - [ ] Error handling implemented
  - [ ] Database migrations tested (if applicable)
OPTIMIZE PR size:
  - Split large PRs if possible
  - Group related changes logically
  - Separate refactoring from features
  - Keep PRs under 400 lines when feasible
PREPARE for feedback:
  - List any known limitations
  - Suggest follow-up improvements
  - Ask specific questions for reviewers
  - Be ready with alternative approaches
  - Document decisions made
UPDATE PR description with:
  - Summary of changes
  - Testing instructions
  - Deploy/rollback plan
  - Performance impact
  - Security considerations
  - Breaking changes
  - Dependencies updated