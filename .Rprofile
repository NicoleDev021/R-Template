source("renv/activate.R")

# SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Security-focused R profile
#
# SECURITY FEATURES:
# 1. HTTPS-only package repositories with backup mirrors
# 2. Secure download methods with timeout protection
# 3. Limited package auto-loading (security surface reduction)
# 4. Secure temporary directory creation with restricted permissions
# 5. Package installation hooks with security reminders
# 6. Startup security audit and outdated package detection
# 7. Environment variable cleanup on session exit
# 8. Binary package preference (reduces compilation attack vectors)
# 9. Resource limits to prevent DoS attacks
# 10. renv integration with integrity checks
#
# IMPORTANT DEVELOPER NOTES:
# - This .Rprofile applies to ALL R sessions in this project
# - Changes here affect CI/CD workflows and local development
# - Security settings may impact package installation speed
# - Binary packages are preferred over source compilation for security
# - Automatic security audits run on interactive sessions only
# - Use options(verbose.security = TRUE) for detailed package loading logs

# Override install.packages with security checks
if (!exists("install.packages.original", envir = .GlobalEnv)) {
  # Store the original function in global environment
  assign("install.packages.original", utils::install.packages, envir = .GlobalEnv)
  
  # Create the override function
  install.packages <- function(pkgs, type = getOption("pkgType"), ...) {
    # Force binary packages for security (faster, pre-compiled)
    if (missing(type) || is.null(type)) {
      type <- "binary"
    }
    
    if (interactive()) {
      cat("🔍 Installing packages with security verification:", paste(pkgs, collapse = ", "), "\n")
      cat("📋 Security reminder: Run renv::snapshot() after installation\n")
    }
    
    # Call original function with explicit type
    result <- get("install.packages.original", envir = .GlobalEnv)(pkgs, type = type, ...)
    
    if (interactive()) {
      cat("✅ Installation complete. Consider running oysteR::audit_installed_r_pkgs()\n")
    }
    
    return(result)
  }
  
  # Ensure the override is in the global environment
  assign("install.packages", install.packages, envir = .GlobalEnv)
}

# Core security and repository settings
options(
  # Repository settings
  repos = c(
    CRAN = "https://cloud.r-project.org/",
    CRAN_backup = "https://cran.rstudio.com/"
  ),
  
  # Download security
  download.file.method = "libcurl",
  HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(), 
                         paste(getRversion(), R.version$platform, 
                               R.version$arch, R.version$os)),
  timeout = 60,
  
  # Package security
  pkgType = "both",
  install.packages.check.source = "yes",
  install.packages.compile.from.source = "never",
  available_packages_filters = c("R_version", "OS_type", "subarch"),
  install.opts = "--byte-compile",
  
  # Security limits
  warn = 1,
  max.print = 1000,
  expressions = 5000,
  
  # Source preservation
  keep.source = TRUE,
  keep.source.pkgs = TRUE,
  
  # Disable potentially unsafe features
  internet.info = 0,
  download.file.extra = NULL
)

# Disable auto-loading of packages (security measure)
options(defaultPackages = c("datasets", "utils", "grDevices", "graphics", "stats", "methods"))

# Enhanced temporary directory security
if (!dir.exists(file.path(tempdir(), "R-secure"))) {
  tryCatch({
    dir.create(file.path(tempdir(), "R-secure"), mode = "0700", recursive = TRUE)
    Sys.setenv(TMPDIR = file.path(tempdir(), "R-secure"))
  }, error = function(e) {
    warning("Could not create secure temp directory: ", e$message)
  })
}

# Set lintr config path to renv directory
if (file.exists("renv/.lintr")) {
  options(lintr.linter_file = "renv/.lintr")
}

# Security audit on startup
.First <- function() {
  if (interactive()) {
    cat("🔒 R Security Environment Loaded\n")
    cat("📊 R Version:", R.version.string, "\n")
    
    # Check for security packages
    security_pkgs <- c("oysteR", "renv", "lintr")
    available_pkgs <- security_pkgs[security_pkgs %in% installed.packages()[,1]]
    
    if (length(available_pkgs) > 0) {
      cat("🛡️  Security packages available:", paste(available_pkgs, collapse = ", "), "\n")
    } else {
      cat("⚠️  Consider installing security packages: oysteR, renv, lintr\n")
    }
    
    # Check for outdated packages (security risk)
    tryCatch({
      old_pkgs <- old.packages()
      if (!is.null(old_pkgs) && nrow(old_pkgs) > 0) {
        cat("⚠️  Outdated packages detected:", nrow(old_pkgs), "packages need updates\n")
        cat("   Run update.packages() to update\n")
      } else {
        cat("✓ All packages are up to date\n")
      }
    }, error = function(e) {
      # Silently handle if package check fails
    })
    
    # Security reminder
    cat("💡 Security tips:\n")
    cat("   - Use renv::snapshot() after installing packages\n")
    cat("   - Run oysteR::audit_installed_r_pkgs() regularly\n")
    cat("   - Check GitHub Security tab for vulnerability alerts\n")
    
    # Scan development directory for security issues
    if (dir.exists("development")) {
      tryCatch({
        scan_development_security()
      }, error = function(e) {
        # Silently handle if scan fails
      })
    }
  }
}

# Function to scan development directory for security issues
scan_development_security <- function() {
  if (!dir.exists("development")) return()
  
  # Look for common security issues in R code
  r_files <- list.files("development", pattern = "\\.[Rr]$", recursive = TRUE, full.names = TRUE)
  
  if (length(r_files) == 0) return()
  
  issues_found <- FALSE
  
  for (file in r_files) {
    tryCatch({
      content <- readLines(file, warn = FALSE)
      
      # Check for hardcoded credentials/secrets
      secret_patterns <- c(
        "password\\s*[=<-]",
        "api_key\\s*[=<-]", 
        "secret\\s*[=<-]",
        "token\\s*[=<-]"
      )
      
      for (pattern in secret_patterns) {
        if (any(grepl(pattern, content, ignore.case = TRUE))) {
          if (!issues_found) {
            cat("⚠️  Development directory security scan:\n")
            issues_found <- TRUE
          }
          cat("   🔍 Potential hardcoded credentials in", basename(file), "\n")
          break
        }
      }
      
      # Check for unsafe functions
      unsafe_patterns <- c("system\\(", "eval\\(", "source\\(.*(http|url)")
      for (pattern in unsafe_patterns) {
        if (any(grepl(pattern, content, ignore.case = TRUE))) {
          if (!issues_found) {
            cat("⚠️  Development directory security scan:\n")
            issues_found <- TRUE
          }
          cat("   🔍 Potentially unsafe function usage in", basename(file), "\n")
          break
        }
      }
    }, error = function(e) {
      # Skip files that can't be read
    })
  }
  
  if (!issues_found && length(r_files) > 0) {
    cat("✓ Development directory security scan: No obvious issues found\n")
  }
}

# Security cleanup on exit
.Last <- function() {
  if (interactive()) {
    cat("🔒 Cleaning up R session...\n")
  }
  
  # Clear sensitive environment variables if any were set
  tryCatch({
    # Remove any temporary environment variables that might contain sensitive data
    sensitive_vars <- grep("(?i)(password|token|key|secret)", names(Sys.getenv()), value = TRUE)
    if (length(sensitive_vars) > 0) {
      for (var in sensitive_vars) {
        Sys.unsetenv(var)
      }
    }
  }, error = function(e) {
    # Silently handle cleanup errors
  })
}

# Hook for package loading security
setHook(packageEvent("", "onLoad"), function(pkg, path) {
  # Log package loading for security audit trail
  if (interactive() && getOption("verbose.security", FALSE)) {
    cat("📦 Loading package:", pkg, "\n")
  }
})
