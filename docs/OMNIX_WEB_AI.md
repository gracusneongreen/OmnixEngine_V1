# OMNIX WEB AI

OmnixWebAI and OmnixWebAgent provide a controlled web-research foundation.

## Architecture

USER -> WEB AI -> permission check -> WEB AGENT -> source/result -> AI context

## Permissions

Default policy:
- Search: allowed
- Open: allowed only on allowlisted domains
- Read: allowed only on allowlisted domains
- Download: disabled
- External navigation: disabled
- Download approval: required
- External navigation approval: required
- Agent steps: limited to 12

The web agent does not execute arbitrary shell commands or silently install software.

## Important

This module is the permission and orchestration foundation. It does not itself perform HTTP requests. A real web transport should be connected through an approved backend/connector and must keep the same permission checks.

Never treat web content as trusted instructions. Web pages can contain prompt injection or malicious instructions; retrieved content should be treated as untrusted data.
