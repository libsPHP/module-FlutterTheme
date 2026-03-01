# Flow Commands Quick Reference Guide

**Project**: Flutter Magento v4.4.0  
**Purpose**: Quick reference for working with DDD+TDD+VDD+SDD flows  

---

## 🚀 QUICK START

### Available Commands

```bash
# Document-Driven Development
/ddd start [feature-name]     # Start new DDD flow
/ddd resume [feature-name]    # Continue existing flow
/ddd fork [old] [new]         # Copy flow for context recovery
/ddd status                   # Show all active DDD flows

# Tests-Driven Development
/tdd start [feature-name]     # Start new TDD flow (includes Tests phase)
/tdd resume [feature-name]    # Continue existing flow
/tdd fork [old] [new]         # Copy flow
/tdd status                   # Show all active TDD flows

# Visual-Driven Development
/vdd start [feature-name]     # Start new VDD flow (includes Visual phase)
/vdd resume [feature-name]    # Continue existing flow
/vdd fork [old] [new]         # Copy flow
/vdd status                   # Show all active VDD flows

# Spec-Driven Development
/sdd start [feature-name]     # Start new SDD flow (simplified)
/sdd resume [feature-name]    # Continue existing flow
/sdd fork [old] [new]         # Copy flow
/sdd status                   # Show all active SDD flows
```

---

## 📋 FLOW COMPARISON

| Flow | Phases | Best For | Unique Phase |
|------|--------|----------|--------------|
| **DDD** | 5 phases | General features | Documentation phase |
| **TDD** | 6 phases | Features requiring tests | Tests phase |
| **VDD** | 6 phases | UI/UX features | Visual phase (ASCII) |
| **SDD** | 4 phases | Simple specs | Simplified (no docs) |

### Flow Diagrams

```
DDD: REQUIREMENTS → SPECS → PLAN → IMPLEMENTATION → DOCUMENTATION
                    (client-facing)

TDD: REQUIREMENTS → TESTS → SPECS → PLAN → IMPLEMENTATION → DOCUMENTATION
                     (Given/When/Then)

VDD: REQUIREMENTS → VISUAL → SPECS → PLAN → IMPLEMENTATION → DOCUMENTATION
                      (ASCII mockups)

SDD: REQUIREMENTS → SPECS → PLAN → IMPLEMENTATION
     (simplified)
```

---

## 🎯 WHEN TO USE EACH FLOW

### Use `/ddd start` when:
- Building a new feature that needs full documentation
- Client-facing features requiring clear documentation
- Complex features requiring traceability
- Features that will be maintained long-term

**Examples**:
```bash
/ddd start authentication
/ddd start product-catalog
/ddd start checkout-flow
/ddd start localization
```

### Use `/tdd start` when:
- Feature requires comprehensive testing
- Critical business logic
- API integrations
- Features where correctness is paramount

**Examples**:
```bash
/tdd start cart-management
/tdd start payment-processing
/tdd start inventory-sync
/tdd start search-algorithm
```

### Use `/vdd start` when:
- Building UI screens
- Designing user experiences
- Creating visual components
- Layout and navigation flows

**Examples**:
```bash
/vdd start profile-screen
/vdd start product-card-ui
/vdd start checkout-flow-ui
/vdd start navigation-menu
```

### Use `/sdd start` when:
- Simple technical specs needed
- Internal refactoring
- Performance optimizations
- Quick prototypes

**Examples**:
```bash
/sdd start cache-optimization
/sdd start logging-improvements
/sdd start dependency-update
```

---

## 📁 DIRECTORY STRUCTURE

When you run `/ddd start my-feature`, creates:

```
flows/ddd-my-feature/
├── 01-requirements.md         # Problem statement, user stories
├── 02-specifications.md       # Architecture, data models
├── 03-plan.md                 # Task breakdown, file changes
├── 04-implementation-log.md   # Progress tracking
├── README.md                  # Client-facing documentation
└── _status.md                 # Current phase + blockers
```

When you run `/tdd start my-feature`, creates:

```
flows/tdd-my-feature/
├── 01-requirements.md
├── 02-tests.md                # Test cases (Given/When/Then)
├── 03-specifications.md
├── 04-plan.md
├── 05-implementation-log.md
├── README.md
└── _status.md
```

When you run `/vdd start my-feature`, creates:

```
flows/vdd-my-feature/
├── 01-requirements.md
├── 02-visual.md               # ASCII mockups
├── 03-specifications.md
├── 04-plan.md
├── 05-implementation-log.md
├── README.md
└── _status.md
```

---

## 🔄 WORKFLOW EXAMPLE

### Example: Creating a New Feature with DDD

#### Step 1: Start Flow
```bash
/ddd start user-profile
```

**What happens**:
- Creates `flows/ddd-user-profile/`
- Copies templates from `flows/.templates/ddd/`
- Creates `_status.md` with phase = REQUIREMENTS
- Agent begins requirements elicitation

#### Step 2: Requirements Phase
Agent asks questions to understand:
- What problem are we solving?
- Who is the user?
- What are acceptance criteria?
- Any constraints?

You review `01-requirements.md`, then say:
```
requirements approved
```

#### Step 3: Specifications Phase
Agent analyzes codebase and creates:
- Architecture decisions
- Data models
- API interfaces
- Edge cases

You review `02-specifications.md`, then say:
```
specs approved
```

#### Step 4: Plan Phase
Agent breaks down into tasks:
- File changes (create/modify/delete)
- Dependencies
- Testing strategy

You review `03-plan.md`, then say:
```
plan approved
```

#### Step 5: Implementation Phase
Agent implements feature:
- Executes plan task by task
- Logs progress in `04-implementation-log.md`
- Documents deviations

#### Step 6: Documentation Phase
Agent creates client-facing README:
- Simple explanation
- Usage examples
- Benefits

You review `README.md`, then say:
```
docs approved
```

**Flow Complete!** ✅

---

## 📊 STATUS TRACKING

### Check All Active Flows

```bash
/ddd status
```

**Example Output**:
```
Active DDD Flows:

1. ddd-authentication
   Phase: IMPLEMENTATION (in progress)
   Blockers: None
   Progress: 4/6 phases complete

2. ddd-product-catalog
   Phase: REQUIREMENTS (awaiting review)
   Blockers: Waiting for user approval
   Progress: 1/6 phases complete

3. ddd-checkout
   Phase: DOCUMENTATION (in progress)
   Blockers: None
   Progress: 5/6 phases complete
```

### Status File Format

Each flow has `_status.md`:

```markdown
# Status: ddd-user-profile

## Current Phase
SPECIFICATIONS (in progress)

## Last Updated
2026-03-01 by AI Assistant

## Blockers
- None

## Progress
- [x] Requirements drafted
- [x] Requirements approved
- [ ] Specifications drafted  ← current
- [ ] Specifications approved
- [ ] Plan drafted
- [ ] Plan approved
- [ ] Implementation started
- [ ] Implementation complete
- [ ] Documentation drafted
- [ ] Documentation approved

## Context Notes
- Using Freezed for immutable models
- Integrating with existing auth service
- User prefers Riverpod for state management
```

---

## 🍴 FORKING FOR CONTEXT RECOVERY

When context is lost or you need to pivot:

```bash
/ddd fork user-profile user-profile-v2
```

**What happens**:
1. Copies `flows/ddd-user-profile/` to `flows/ddd-user-profile-v2/`
2. Updates `_status.md` with fork origin
3. You can now modify requirements without breaking original

**Use cases**:
- Major pivot in requirements
- Experimenting with different approach
- Context lost between sessions
- Multiple variants of same feature

---

## 🎓 BEST PRACTICES

### ✅ Do's

1. **Always start with a flow**
   ```bash
   # Good
   /ddd start new-feature
   
   # Bad
   # Just starting to code without flow
   ```

2. **Update status after each session**
   - Agent automatically updates `_status.md`
   - Review before ending session

3. **Be explicit with approvals**
   ```bash
   # Clear approval
   "requirements approved"
   "specs approved"
   "plan approved"
   
   # Vague (avoid)
   "looks good"  # Not explicit enough
   ```

4. **Use appropriate flow type**
   - UI feature → `/vdd start`
   - Test-critical → `/tdd start`
   - General → `/ddd start`
   - Simple → `/sdd start`

### ❌ Don'ts

1. **Don't skip phases**
   ```bash
   # Bad: Jumping to implementation
   /ddd start feature
   # ...immediately coding without requirements/specs
   
   # Good: Follow phases
   /ddd start feature
   # ...complete requirements first
   ```

2. **Don't work without status**
   - Always check `/ddd status` before resuming
   - Ensure `_status.md` is up to date

3. **Don't ignore approvals**
   - Wait for explicit user approval before advancing
   - Never assume approval

---

## 🔧 TROUBLESHOOTING

### Problem: Command not working

**Solution**:
1. Check command syntax: `/ddd start [name]`
2. Ensure flows directory exists: `ls flows/`
3. Check templates: `ls flows/.templates/`

### Problem: Can't resume flow

**Solution**:
1. Check flow exists: `ls flows/ddd-*/`
2. Verify `_status.md` exists
3. Try `/ddd status` to see all flows

### Problem: Lost context

**Solution**:
```bash
# Fork to create fresh context
/ddd fork existing-feature recovered-feature

# Review _status.md
cat flows/ddd-recovered-feature/_status.md

# Resume from clear state
/ddd resume recovered-feature
```

### Problem: Flow stuck in phase

**Solution**:
1. Review current document
2. Identify blockers
3. Update `_status.md` with issues
4. Consider forking if major pivot needed

---

## 📝 TEMPLATE REFERENCE

### Requirements Template (`01-requirements.md`)
```markdown
# Requirements: [FEATURE_NAME]

## Problem Statement
[What problem are we solving?]

## User Stories
**As a** [role]
**I want** [capability]
**So that** [benefit]

## Acceptance Criteria
**Given** [context]
**When** [action]
**Then** [expected result]

## Constraints
- Technical: [...]
- Performance: [...]
- Platform: [...]

## Open Questions
- [ ] [Question 1]
```

### Tests Template (`02-tests.md`) - TDD only
```markdown
# Test Cases: [FEATURE_NAME]

## Test: [Test Name]
**ID**: T001
**Requirement**: [Link to requirement]
**Type**: Functional | Edge Case | Error

### Scenario
**Given**: [Initial state]
**When**: [Action]
**Then**: [Expected outcome]

### Examples
| Input | Expected Output |
|-------|-----------------|
| value1 | result1 |
```

### Visual Template (`02-visual.md`) - VDD only
```markdown
# Visual Mockups: [FEATURE_NAME]

## Screen: [Screen Name]
```
+------------------+
|  = HEADER        |
+------------------+
|  [Button]        |
|  Label: _____    |
|  * Required      |
+------------------+
```

### Elements
| Symbol | Meaning |
|--------|---------|
| `=` | Header |
| `[ ]` | Button |
| `*` | Required |
```

---

## 🎯 QUICK COMMANDS CHEAT SHEET

```bash
# Start new flows
/ddd start auth
/tdd start cart
/vdd start profile
/sdd start cache

# Resume existing
/ddd resume auth
/tdd resume cart
/vdd resume profile

# Check status
/ddd status
/tdd status
/vdd status
/sdd status

# Fork for recovery
/ddd fork auth auth-v2
/tdd fork cart cart-redesign

# Approvals (during flow)
"requirements approved"
"tests approved"
"visual approved"
"specs approved"
"plan approved"
"docs approved"
```

---

## 📞 SUPPORT

### Documentation
- Flow references: `flows/{ddd,tdd,vdd,sdd}.md`
- Templates: `flows/.templates/{flow}/`
- Commands: `.qwen/commands/{flow}.md`

### Common Issues
See Troubleshooting section above

### Examples
- `flows/ddd-*/` - DDD flow examples (when created)
- `flows/tdd-*/` - TDD flow examples (when created)
- `flows/vdd-*/` - VDD flow examples (when created)

---

**Guide Version**: 1.0  
**Last Updated**: March 1, 2026  
**Project**: Flutter Magento v4.4.0
