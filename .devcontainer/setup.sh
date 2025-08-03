#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Simplified setup script for R security environment
set -e

echo "🔧 Setting up R security development environment..."

# Update system packages
apt-get update && apt-get upgrade -y

# Install minimal system dependencies required by renv packages
apt-get install -y \
    libcurl4-openssl-dev

# Install Trivy for security scanning
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb generic main" | tee -a /etc/apt/sources.list
apt-get update && apt-get install -y trivy

# Clean up
apt-get autoremove -y && apt-get clean
rm -rf /var/lib/apt/lists/*

echo "✅ R security development environment setup complete"

#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Setup script for R security environment using Rocker R base image
set -e

echo "🔧 Setting up R security development environment..."

# Update system packages
apt-get update && apt-get upgrade -y
