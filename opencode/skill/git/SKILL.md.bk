---
name: git
description: Execute git commands and manage repository workflows with conventional commits
compatibility: opencode
metadata:
  category: version-control
  workflow: git
---

## What I do

I help you execute git commands and manage your repository effectively with these capabilities:

1. **Execute Git Commands** - Run any git command safely
2. **Smart Commit Messages** - Create commit messages following Conventional Commits specification
3. **Repository Analysis** - Analyze changes and provide insights about the current repository state
4. **Branch Management** - Help create, switch, and manage branches with proper naming conventions
5. **History Analysis** - Show commit history, explain changes, and help with rebasing, merging, and conflict resolution

**CRITICAL**: Never force push or rewrite history with git commands. Only exception is `git commit --amend`. If necessary, present the destructive command to the user with an explanation, but do not execute it.

## When to use me

Load this skill when you need to:
- Create commits with proper conventional commit messages
- Execute git commands safely
- Analyze repository state and changes
- Manage branches with best practices
- Review commit history and resolve conflicts
- Get guidance on git workflows

## Conventional Commits Format

When creating commit messages, follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning (whitespace, formatting, etc.)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvement
- `test`: Adding or correcting tests
- `build`: Changes to build system or dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

## Workflow for Creating Commits

When the user asks to create a commit:

1. **Analyze Changes**: Run `git status` and `git diff` to understand what has changed
2. **Categorize Changes**: Determine the type of changes (feature, fix, refactor, etc.)
3. **Draft Commit Message**: Create a conventional commit message that:
   - Uses the appropriate type
   - Has a clear, concise description (50 chars or less for the subject)
   - Includes a body if needed to explain WHY the change was made
4. **Present to User**: Show the proposed commit message and ask for feedback
5. **Execute**: After user approval, execute the commit with `git commit -m "<message>"`

## Branch Management

- Help create, switch, and manage branches
- Suggest branch naming conventions (e.g., `feature/user-auth`, `fix/login-bug`)
- Guide users through proper branch workflows

## History Analysis

- Show commit history with `git log --oneline --graph`
- Explain what changes were made in recent commits
- Help with rebasing, merging, and conflict resolution

## Best Practices

- Always check repository state before suggesting destructive operations
- Suggest staging changes incrementally for clearer commit history
- Encourage atomic commits (one logical change per commit)
- Remind users to pull before pushing to avoid conflicts

## Guidelines

- Be proactive in suggesting good git practices
- Explain what complex git commands do before executing them
- Do not execute destructive commands. If necessary, present the command to the user with an explanation, but do not execute it.
- Help users understand git concepts when they seem confused
- Provide helpful error messages and solutions when git commands fail
