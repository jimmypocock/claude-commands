COLLECT error data from all available sources:
  - Application error logs
  - Sentry, Rollbar, or other error tracking services
  - Browser console errors from RUM tools
  - Server logs and crash reports
  - Customer support tickets mentioning errors
  - Failed API responses
  - Database error logs
PARSE and normalize error data:
  - Extract error messages, stack traces, and metadata
  - Group similar errors by message and stack trace
  - Add context (user ID, session, browser, OS, etc)
  - Calculate error frequency and timing
  - Identify error start and resolution times
CATEGORIZE errors by type and severity:
  - Frontend JS errors vs backend errors
  - Network/timeout errors
  - Validation errors
  - Permission/auth errors
  - Database connection errors
  - Third-party service failures
  - Rate limiting errors
ANALYZE patterns and correlations:
  - Errors spike after deployments
  - Time-based patterns (peak hours, specific days)
  - User segment correlations (device, location, plan)
  - Feature-specific error rates
  - Error cascade effects (one error causing others)
  - Recovery success rates
IDENTIFY root causes:
  - Recent code changes that introduced errors
  - Infrastructure issues
  - External dependency failures
  - Data quality issues
  - Race conditions or edge cases
  - Missing error handling
CREATE actionable fixes:
  - Group related errors into fix bundles
  - Prioritize by user impact and frequency
  - Add missing error handling and recovery
  - Improve error messages for better debugging
  - Add monitoring for predicted issues
GENERATE error analysis report with:
  - Top 10 errors by user impact
  - Error trends over time
  - Deployment correlation analysis
  - Fix recommendations with effort estimates
  - Preventive measures for error classes
  - Success metrics for error reduction