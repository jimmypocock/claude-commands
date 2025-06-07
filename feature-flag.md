UNDERSTAND the feature that needs to be behind a flag:
  - Ask the user for the feature name and description
  - Determine if this is a boolean flag or requires multiple variants
  - Identify all code paths affected by this feature
CHOOSE or identify the feature flag system:
  - Check if the project already uses a feature flag service (LaunchDarkly, Split, Unleash, etc)
  - If no system exists, implement a simple configuration-based approach
  - Ensure the system supports the required flag type (boolean, multivariate, percentage rollout)
IMPLEMENT the feature flag:
  - Create the flag in the feature flag system with a descriptive name
  - Wrap the new feature code with flag checks
  - Ensure graceful fallback behavior when the flag is disabled
  - Add flag checks at the appropriate level (UI, API, or both)
ADD cleanup tracking:
  - Add a comment with the flag creation date and intended removal date
  - Create a TODO or ticket for flag removal after full rollout
  - Document the flag in a central location (README or dedicated flags documentation)
TEST both flag states:
  - Verify the feature works correctly when enabled
  - Verify the application works correctly when disabled
  - Test the transition between states if the flag can be toggled at runtime
SET UP monitoring:
  - Add logging for flag evaluation if not already present
  - Set up alerts for flag-related errors if using a feature flag service
  - Track feature usage metrics when the flag is enabled