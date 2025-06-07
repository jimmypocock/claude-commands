# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains a collection of command templates for Claude Code. Each markdown file represents a specific command or workflow that can be executed by Claude Code to perform common development tasks.

## Available Commands

The repository includes the following command templates:

- **prime.md**: Initial project setup and understanding - reads README, PLANNING.md, and TASK.md files to understand project context
- **build-planning.md**: Creates PLANNING.md and TASK.md documentation for project structure and task tracking
- **commit-and-push.md**: Git workflow for staging, committing with semantic notation, and pushing changes
- **coverage.md**: Analyzes code coverage and adds unit tests to achieve 100% coverage
- **fix.md**: Debugging workflow that reads terminal errors and fixes them iteratively
- **domain-ideas.md**: Domain name brainstorming and availability checking using whois

## Command Usage

Each command file contains step-by-step instructions that should be executed in sequence. The commands are designed to:
1. Read and understand the specific context needed
2. Perform the requested actions
3. Update relevant documentation as needed

## Important Notes

- When using the prime.md command, avoid reading files in any `external/` directory
- The build-planning.md command creates two key documentation files (PLANNING.md and TASK.md) for project context
- Always update TASK.md when making changes to track progress across sessions
- Commands assume semantic commit notation for git operations