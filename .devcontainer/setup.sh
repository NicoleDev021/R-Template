#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Setup script for R security environment using Rocker R base image
set -e

echo "🔧 Setting up R security development environment..."

# Update system packages
sudo apt-get update && sudo apt-get upgrade -y

# Install minimal system dependencies required by renv packages
sudo apt-get install -y \
    libcurl4-openssl-dev

# Install Trivy for security scanning
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get install -y trivy

# Note: R packages will be installed from renv.lock in post-create.sh

# Clean up
sudo apt-get autoremove -y && sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

echo "✅ R security development environment setup complete"
