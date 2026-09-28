# Omnix Computer Host

Local-only host for OmnixEngine computer use.

Endpoints:
- GET /health
- POST /computer/screenshot
- POST /computer/action
- GET /computer/apps

Default safety policy keeps application installation and shell execution disabled. Enable them only with an explicit host configuration and an allowlist.

Install:
`python -m pip install -r requirements.txt`

Run:
`python host.py`

The service binds to 127.0.0.1:8765 and should not be exposed to the public internet.
