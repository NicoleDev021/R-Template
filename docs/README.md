<!--
SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021

SPDX-License-Identifier: CC-BY-4.0
-->

# R Development Template

A secure, professional R development environment template with comprehensive security features and automated setup through renv.

> **Disclaimer:**  
> I am not a lawyer. The information provided in this repository is based on my own personal research and is intended for my own use. Please consult a qualified attorney for legal advice or guidance regarding license compliance.

## 🚀 Quick Start

### Option 1: GitHub Codespaces (Recommended)
1. **Click "Code" → "Codespaces" → "Create codespace"**
2. **Wait 3-5 minutes** for automatic R environment setup
3. **Start coding** - Open terminal and type `R`

### Option 2: Local Development
1. **Clone the repository**
2. **Open in VS Code** with Dev Containers extension
3. **Reopen in Container** when prompted
4. **Start R** - Environment automatically configured via renv

## 📁 Project Structure

```
R-Template/
├── .Rprofile              # R startup configuration with security features
├── renv.lock              # Locked package dependencies with security packages
├── development/           # ← Your R project code goes here
│   ├── R/                 # Main R source code
│   ├── data/              # Data files
│   ├── tests/             # Unit tests  
│   ├── analysis/          # Analysis scripts/notebooks
│   ├── models/            # Statistical models
│   └── outputs/           # Generated outputs
├── docs/                  # Project documentation
│   ├── README.md          # This file - main project documentation
│   └── SECURITY.md        # Security policies and reporting
├── .devcontainer/         # Dev container configuration
│   ├── devcontainer.json  # Container settings
│   ├── setup.sh          # System setup script
│   └── post-create.sh     # renv package restoration
├── .github/               # CI/CD workflows
│   ├── workflows/         # Automated security scanning
│   └── dependabot.yml    # Dependency updates
└── renv/                  # R package environment
    ├── activate.R         # renv activation
    ├── .lintr            # Code quality configuration
    └── ...               # renv internals
```

## 🛡️ Security Features

This template provides enterprise-grade security through renv-managed packages:

### Security Packages (via renv)
- **📦 oysteR**: R package vulnerability scanning
- **🔍 lintr**: Code quality and security linting  
- **📊 cyclocomp**: Code complexity analysis
- **🧪 rcmdcheck**: R package validation

### Built-in Security Features
- ✅ **HTTPS repositories** - Secure package downloads only
- ✅ **Secure downloads** - Verified package integrity  
- ✅ **Function overrides** - Security prompts for package installation
- ✅ **Package auditing** - Vulnerability scanning for dependencies
- ✅ **Temp directory security** - Restricted permissions on temporary files
- ✅ **Environment isolation** - renv for reproducible package management

## 💻 Development Workflow

### Starting Development
```bash
# Start secure R environment (renv auto-activates)
R

# Install and secure new packages
R -e "install.packages('package-name'); renv::snapshot()"
```

### Code Organization
Put your R project code in the `development/` directory:

```bash
# Create your project structure
mkdir -p development/{R,data,tests,analysis,models,outputs}

# Start coding in development/R/
```

### Security Best Practices
1. **No hardcoded secrets** - Use environment variables or config files  
2. **Use renv** - Keep dependencies locked with `renv::snapshot()`
3. **Regular scans** - Security packages available automatically
4. **Version control** - Commit code regularly, ignore sensitive data
5. **Update dependencies** - Monitor for security updates via GitHub Actions

## 🔧 Available Commands

### Security Commands (via renv packages)
```bash
# Manual vulnerability audit
R -e "library(oysteR); oysteR::audit_installed_r_pkgs()"

# Lint your development code  
R -e "library(lintr); lintr::lint_dir('development')"

# Check code complexity
R -e "library(cyclocomp); cyclocomp::cyclocomp_package_dir('development')"
```

### Package Management Commands
```bash
# Update packages and snapshot
R -e "update.packages(ask = FALSE); renv::snapshot()"

# Check for outdated packages
R -e "old.packages()"

# Restore exact environment
R -e "renv::restore()"

# Add new packages
R -e "install.packages('new-package'); renv::snapshot()"
```

## 🚦 Automatic Security Features

When you start R, the environment automatically:
- 🔍 **Loads security packages** via renv
- ️ **Enables secure package installation** with verification prompts
- 🌐 **Sets up HTTPS repositories** for secure downloads
- 📊 **Provides security commands** for vulnerability scanning

## 📖 Documentation

- **[SECURITY.md](SECURITY.md)**: Security policies, vulnerability reporting, and compliance details

## 🛠️ Environment Management

### Automatic Setup (Codespaces/Dev Container)
- **R 4.3+** with essential development packages (devtools, rmarkdown)
- **Security packages**: Automatically installed via renv.lock
- **VS Code integration**: R extensions for syntax highlighting and language support
- **Minimal dependencies**: Focus on core R functionality with security tools

### Local Setup
```bash
# Install R 
sudo apt update && sudo apt install -y r-base r-base-dev

# Clone and enter directory
git clone <your-repo>
cd <your-repo>

# Start R (renv will auto-restore packages)
R
```

## 🤝 Contributing

1. **Code goes in `development/`** - Keep project files organized
2. **Use renv** - All security packages managed through renv.lock
3. **Update `renv.lock`** when adding dependencies  
4. **Follow security guidelines** in [SECURITY.md](SECURITY.md)
5. **Test in dev container** to ensure reproducibility

## ⚖️ License & Compliance

- **Source Code**: [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.html)
- **Documentation**: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

## 🎯 Getting Started

1. **Create a new repository** from this template
2. **Open in Codespaces** or local dev container  
3. **Start R** - Security packages auto-load via renv
4. **Start coding** in the `development/` directory
5. **Commit and push** - CI/CD will automatically scan for security issues

Your secure R development environment is ready! 🚀
