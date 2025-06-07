IDENTIFY the performance issue by asking the user for specifics (slow page load, laggy interactions, memory leaks, etc).
THEN use appropriate profiling tools based on the technology stack:
  - For React: React DevTools Profiler, Chrome DevTools Performance tab
  - For Node.js: node --prof, clinic.js, or built-in profiler
  - For general web: Lighthouse, WebPageTest results
ANALYZE the profiling data to identify bottlenecks:
  - Unnecessary re-renders in React components
  - N+1 database queries
  - Large bundle sizes or unoptimized assets
  - Memory leaks or excessive memory usage
  - Synchronous operations blocking the main thread
IMPLEMENT fixes in order of impact:
  - Add memoization (React.memo, useMemo, useCallback) where beneficial
  - Implement code splitting and lazy loading
  - Optimize database queries and add appropriate indexes
  - Move heavy computations to web workers or background jobs
  - Implement virtualization for long lists
VERIFY improvements by re-running the same profiling tools and comparing metrics.
DOCUMENT the changes and performance gains in a comment or commit message.