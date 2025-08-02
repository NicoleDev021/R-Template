#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Post-create script for R security environment
set -e

echo "🔒 Initializing R security environment..."

# Initialize renv and restore packages
if [ -f "renv.lock" ]; then
    echo "📦 Restoring R packages from renv.lock..."
    R --slave -e "renv::restore()"
else
    echo "⚠️  No renv.lock found, initializing new renv environment..."
    R --slave -e "renv::init()"
fi

# Set up git configuration if not already configured
if ! git config --get user.name >/dev/null 2>&1; then
    echo "🔧 Setting up default git configuration..."
    git config --global user.name "NicoleDev021"
    git config --global user.email "217474974+NicoleDev021@users.noreply.github.com"
    git config --global init.defaultBranch main
fi

echo "✅ R security environment ready for development"
