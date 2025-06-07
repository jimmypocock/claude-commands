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

# Array of command files to download
COMMANDS=(
    # Original commands
    "prime.md"
    "build-planning.md"
    "commit-and-push.md"
    "coverage.md"
    "fix.md"
    "domain-ideas.md"
    
    # Developer workflow commands
    "debug-performance.md"
    "refactor-safe.md"
    "feature-flag.md"
    "changelog-update.md"
    
    # Research & analysis commands
    "competitor-analysis.md"
    "user-feedback-analyze.md"
    "tech-debt-assess.md"
    "api-usage-stats.md"
    "error-patterns.md"
    
    # Product development commands
    "feature-spec.md"
    "user-story-generate.md"
    "a-b-test-setup.md"
    "metrics-dashboard.md"
    "release-notes.md"
    
    # Process efficiency commands
    "code-review-prep.md"
    "meeting-notes.md"
    "documentation-gap.md"
    "dependency-audit.md"
    "estimate-task.md"
    
    # Data & insights commands
    "data-extract.md"
    "usage-report.md"
    "performance-trends.md"
    "cost-analysis.md"
)

# Download each command file
print_status "Downloading command files..."
for cmd in "${COMMANDS[@]}"; do
    echo -n "  Downloading $cmd... "
    if curl -sSL "$GITHUB_RAW/$cmd" -o ".claude/commands/$cmd" 2>/dev/null; then
        echo "done"
    else
        print_error "Failed to download $cmd"
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
for cmd in "${COMMANDS[@]}"; do
    echo "  - ${cmd%.md}"
done
echo ""
echo "For more information, visit: https://github.com/jimmypocock/claude-commands"