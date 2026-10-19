# Security and support

[Guide](README.md) · [Русская версия](../ru/security.md)

- Use unique administrator and recovery passwords. Change default credentials.
- Restrict network access; configure HTTPS before remote use.
- Give users and API keys only the permissions they need. Use separate keys for
  separate applications and revoke compromised credentials.
- Keep raw engine ports, updater control APIs and Docker sockets away from
  untrusted users and public networks.
- Treat remote model code, generated code and third-party extensions as code
  execution. Review them before enabling or running them.
- Download weights from sources you trust and review their license and gated
  access conditions. A panel subscription does not replace a model license.
- Back up persistent data and protect backups as carefully as live secrets.

## Reporting a problem

Use [GitHub issues](https://github.com/rjohny55/ai-server-manager/issues) for
non-sensitive problems. Include the image family/version, hardware model and
memory, model/engine, steps to reproduce and sanitized error messages.

**Never publish:** passwords, API/MCP/Hugging Face tokens, license strings,
cookies, authentication headers, `.env`, private documents, signing keys or
unreviewed log archives. Logs may contain initial passwords or user content.
Use the website's contact/support channel for sensitive reports; do not attach
secrets to a public issue.

This repository is not a place to upload application source or private builds.
Public documentation does not make proprietary software open source.
