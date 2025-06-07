#!/bin/bash

# Claude Commands Installation Script
# This script installs Claude command templates to your project

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if we're in a git repository (optional but recommended)
if [ -d .git ]; then
    print_status "Git repository detected"
else
    print_warning "Not in a git repository - proceeding anyway"
fi

# Create the .claude/commands directory
print_status "Creating .claude/commands directory..."
mkdir -p .claude/commands

# GitHub raw content base URL
GITHUB_RAW="https://raw.githubusercontent.com/jimmypocock/claude-commands/main"

# Download command files from their organized folders
print_status "Downloading command files..."

# Core commands
print_status "Downloading core commands..."
for cmd in "prime.md" "build-planning.md" "commit-and-push.md" "coverage.md" "fix.md" "domain-ideas.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/core/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from core"
        exit 1
    fi
done

# Developer workflow commands
print_status "Downloading developer-workflow commands..."
for cmd in "debug-performance.md" "refactor-safe.md" "feature-flag.md" "changelog-update.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/developer-workflow/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from developer-workflow"
        exit 1
    fi
done

# Research analysis commands
print_status "Downloading research-analysis commands..."
for cmd in "competitor-analysis.md" "user-feedback-analyze.md" "tech-debt-assess.md" "api-usage-stats.md" "error-patterns.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/research-analysis/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from research-analysis"
        exit 1
    fi
done

# Product development commands
print_status "Downloading product-development commands..."
for cmd in "feature-spec.md" "user-story-generate.md" "a-b-test-setup.md" "metrics-dashboard.md" "release-notes.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/product-development/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from product-development"
        exit 1
    fi
done

# Process efficiency commands
print_status "Downloading process-efficiency commands..."
for cmd in "code-review-prep.md" "meeting-notes.md" "documentation-gap.md" "dependency-audit.md" "estimate-task.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/process-efficiency/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from process-efficiency"
        exit 1
    fi
done

# Data insights commands
print_status "Downloading data-insights commands..."
for cmd in "data-extract.md" "usage-report.md" "performance-trends.md" "cost-analysis.md"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/commands/data-insights/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd from data-insights"
        exit 1
    fi
done

# Also download CLAUDE.md for reference
print_status "Downloading CLAUDE.md for reference..."
if curl -sSL "$GITHUB_RAW/CLAUDE.md" -o ".claude/CLAUDE.md" 2>/dev/null; then
    print_status "CLAUDE.md downloaded successfully"
else
    print_warning "Failed to download CLAUDE.md (non-critical)"
fi

# Add .claude to .gitignore if it doesn't exist
if [ -f .gitignore ]; then
    if ! grep -q "^\.claude" .gitignore; then
        print_status "Adding .claude to .gitignore..."
        echo -e "\n# Claude Code configuration\n.claude/" >> .gitignore
    else
        print_status ".claude already in .gitignore"
    fi
else
    print_warning "No .gitignore file found - you may want to create one and add .claude/"
fi

print_status "Installation complete!"
echo ""
echo "Claude commands have been installed to .claude/commands/"
echo "You can now use these commands in Claude Code by referencing them."
echo ""
echo "Available commands:"
echo "  core:"
echo "    - prime"
echo "    - build-planning"
echo "    - commit-and-push"
echo "    - coverage"
echo "    - fix"
echo "    - domain-ideas"
echo "  developer-workflow:"
echo "    - debug-performance"
echo "    - refactor-safe"
echo "    - feature-flag"
echo "    - changelog-update"
echo "  research-analysis:"
echo "    - competitor-analysis"
echo "    - user-feedback-analyze"
echo "    - tech-debt-assess"
echo "    - api-usage-stats"
echo "    - error-patterns"
echo "  product-development:"
echo "    - feature-spec"
echo "    - user-story-generate"
echo "    - a-b-test-setup"
echo "    - metrics-dashboard"
echo "    - release-notes"
echo "  process-efficiency:"
echo "    - code-review-prep"
echo "    - meeting-notes"
echo "    - documentation-gap"
echo "    - dependency-audit"
echo "    - estimate-task"
echo "  data-insights:"
echo "    - data-extract"
echo "    - usage-report"
echo "    - performance-trends"
echo "    - cost-analysis"
echo ""
echo "For more information, visit: https://github.com/jimmypocock/claude-commands"