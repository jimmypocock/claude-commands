IDENTIFY the code to be refactored and understand its current behavior by:
  - Reading the existing implementation thoroughly
  - Finding all usages of the code using grep/search tools
  - Understanding the expected inputs and outputs
ENSURE test coverage exists for the current implementation:
  - Run existing tests to verify they pass
  - If tests don't exist or coverage is insufficient, write tests that capture current behavior
  - Include edge cases and error scenarios in tests
CREATE a refactoring plan that breaks down the work into small, safe steps:
  - Each step should keep all tests passing
  - Common refactoring patterns: Extract Method, Extract Variable, Inline, Move, Rename
  - Plan the order to minimize risk and maintain functionality
IMPLEMENT each refactoring step:
  - Make one small change at a time
  - Run tests after each change to ensure nothing breaks
  - Commit after each successful step with a clear message
OPTIMIZE the refactored code:
  - Remove duplication
  - Improve naming for clarity
  - Simplify complex conditionals
  - Apply SOLID principles where appropriate
VERIFY the refactoring is complete:
  - All tests still pass
  - Code coverage is maintained or improved
  - Performance characteristics haven't degraded
  - The code is more maintainable and easier to understand
UPDATE documentation and comments to reflect the new structure.