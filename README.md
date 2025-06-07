# Claude Commands

A collection of reusable command templates for Claude Code to help automate common development workflows.

## Quick Install

Run this command from your project's root directory:

```bash
curl -sSL https://raw.githubusercontent.com/jimmypocock/claude-commands/main/install.sh | bash
```

## Attribution

Some commands originally came from GrumpyPigeon and apf6 in a conversation found here: https://www.reddit.com/r/ClaudeAI/comments/1l3gouj/share_your_claude_code_commands/ but have been revised.

## Overview

This repository provides a set of markdown files that contain structured instructions for Claude Code to perform various development tasks. Each command file is designed to be placed in your project's `.claude/commands/` directory, where Claude Code can access and execute them.

## Available Commands

### Core Commands
- **prime** - Initial project understanding: reads README, PLANNING.md, and TASK.md files
- **build-planning** - Creates comprehensive project documentation (PLANNING.md and TASK.md)
- **commit-and-push** - Git workflow automation with semantic commit messages
- **coverage** - Code coverage analysis and test generation
- **fix** - Iterative error fixing workflow
- **domain-ideas** - Domain name brainstorming and availability checking

### Developer Workflow
- **debug-performance** - Profile and fix performance issues
- **refactor-safe** - Safely refactor code with tests
- **feature-flag** - Implement feature flags for gradual rollouts
- **changelog-update** - Generate changelog from commits

### Research & Analysis
- **competitor-analysis** - Analyze competitor features and strategies
- **user-feedback-analyze** - Aggregate and analyze user feedback
- **tech-debt-assess** - Evaluate and prioritize technical debt
- **api-usage-stats** - Analyze API endpoint usage patterns
- **error-patterns** - Find and fix common error patterns

### Product Development
- **feature-spec** - Create detailed feature specifications
- **user-story-generate** - Generate user stories with acceptance criteria
- **a-b-test-setup** - Set up A/B tests with tracking
- **metrics-dashboard** - Create metrics tracking and dashboards
- **release-notes** - Generate user-friendly release notes

### Process Efficiency
- **code-review-prep** - Prepare PRs for smooth reviews
- **meeting-notes** - Extract action items from meetings
- **documentation-gap** - Identify missing documentation
- **dependency-audit** - Audit and update dependencies
- **estimate-task** - Estimate development time accurately

### Data & Insights
- **data-extract** - Safely extract and anonymize data
- **usage-report** - Generate usage reports for stakeholders
- **performance-trends** - Track performance over time
- **cost-analysis** - Analyze and optimize costs

## Installation

### Manual Installation

1. Create the Claude commands directory in your project:

   ```bash
   mkdir -p .claude/commands
   ```

2. Copy the command files you want to use:

   ```bash
   cp path/to/claude-commands/*.md .claude/commands/
   ```

## Usage

Once installed, you can use these commands in Claude Code by referencing them. For example:

- To understand a new project: reference the `prime` command
- To set up project documentation: reference the `build-planning` command
- To commit your changes: reference the `commit-and-push` command

## Contributing

Feel free to submit issues and pull requests to improve these commands or add new ones.

## License

MIT License - see LICENSE file for details.