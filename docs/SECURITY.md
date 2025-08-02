<!--
SPDX-FileCopyrightText: Copyright (c) 2025 Madison Nicole Goodwin https://github.com/NicoleDev021

SPDX-License-Identifier: CC-BY-4.0
-->

# Security Policy

## Supported Versions

We actively support the following versions with security updates:

| Version | Supported          | R Version | Notes |
| ------- | ------------------ | --------- | ----- |
| 2.0.x   | :white_check_mark: | 4.3.x     | Current stable |

## Security Scanning

This project implements comprehensive automated security scanning:

### Automated Tools
- **GitHub Dependabot**: Automated dependency updates for GitHub Actions
- **Trivy**: Filesystem vulnerability scanning
- **R Static Analysis**: Code quality and security analysis (lintr, cyclocomp, rcmdcheck)
- **oysteR**: R package security auditing for known vulnerabilities
- **renv**: Reproducible R environments with dependency version locking

### Scan Schedule
- **Push/PR**: Immediate security scans triggered on code changes
- **Weekly**: Comprehensive security audit every Monday at 2 AM UTC
- **Dependencies**: Continuous monitoring for new vulnerabilities via Dependabot

### Security Reports
Security scan results are automatically uploaded to the GitHub Security tab, providing:
- Vulnerability severity ratings
- Affected components and versions
- Remediation recommendations
- Compliance tracking

## Reporting a Vulnerability

### For Non-Critical Issues
If you discover a security vulnerability in this project, please help keep the community safe by reporting it.

- **Preferred Method:**  
  Open a new [GitHub Issue](../../issues/new?template=security_report.md) with the label ![security](https://img.shields.io/badge/security-ac1401?style=flat&labelColor=ac1401&color=ac1401). Please provide as much detail as possible while omitting sensitive exploit details from the public issue body. If needed, you can request further private discussion in your issue.

- **Alternative:**  
  If you do not wish to disclose details publicly, please mention in your issue that you'd like to provide more information privately. A project maintainer will reach out to coordinate a private discussion.

### For Critical Security Issues
**DO NOT** create public GitHub issues for critical security vulnerabilities that could be exploited.

For critical issues, use GitHub's private vulnerability reporting:
1. Go to the [Security tab](../../security)
2. Click "Report a vulnerability"
3. Provide detailed information privately

### What to Include in Reports
Please include the following information:
- **Description**: Clear explanation of the vulnerability
- **Steps to Reproduce**: Detailed reproduction steps
- **Impact Assessment**: Potential security impact
- **Environment**: R version, package versions, OS details
- **Suggested Mitigation**: If you have ideas for fixes
- **Contact Information**: How we can reach you for follow-up

## Response Timeline

### Handling of Vulnerabilities
- **Initial Response**: Within 24 hours of report
- **Triage and Assessment**: Within 72 hours
- **Fix Timeline**: Depends on severity
  - **Critical**: 1-7 days
  - **High**: 7-14 days  
  - **Medium**: 14-30 days
  - **Low**: Next scheduled release

- All security issues will be reviewed promptly.
- If a vulnerability is confirmed, we will work to address it as quickly as possible and will communicate updates in the related issue.
- Security fixes will be backported to supported versions when applicable.

## Security Best Practices

### For Contributors
1. **Dependencies**: Use exact versions in `renv.lock` file
2. **Secrets**: Never commit secrets, API keys, or credentials
3. **Code Review**: All changes require security-focused peer review
4. **Testing**: Include security tests for new features
5. **R Environment**: Follow R security best practices

### For Users
1. **Updates**: Keep R packages and dependencies updated
2. **Environment**: Use `renv` for consistent, reproducible environments
3. **Scanning**: Run security scans before deploying to production
4. **Monitoring**: Subscribe to security advisories for this project

## Security Architecture

### R Environment Security
- Reproducible environments with `renv`
- Package version locking and audit trails
- Secure package installation from HTTPS sources
- Regular vulnerability scanning of dependencies

### Dependency Management
- Locked dependency versions via `renv.lock`
- Automated vulnerability scanning
- Audit trail for all package changes

### CI/CD Security
- Signed commits and tags
- Secure secrets management
- Isolated build environments
- Security scanning in all pipelines

## Compliance

This project follows established security frameworks:
- **OWASP Top 10** application security guidelines
- **Supply Chain Security** best practices (SLSA framework)
- **R Package Security** community recommendations

## Security Contacts

- **General Security**: Open a [security issue](../../issues/new?template=security_report.md)
- **Private Reports**: Use GitHub's private vulnerability reporting
- **Project Maintainer**: [@NicoleDev021](https://github.com/NicoleDev021)

## Security Updates

Security updates and advisories will be published:
- In the [GitHub Security tab](../../security)
- As GitHub releases with security tags
- In project documentation updates

## Acknowledgments

We appreciate security researchers and community members who help improve the security of this project. Contributors who report valid security issues may be acknowledged in our security advisories (with permission).

---

Thank you for helping to keep this project and its users safe!

*Last Updated: August 2025*  
*Security Policy Version: 2.1*
