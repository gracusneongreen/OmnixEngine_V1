# Omnix Windows 11 Agent Environment V1

A host-side setup package for running Omnix Computer Use inside a dedicated Windows 11 VM.

## Design

- Windows 11 runs in a dedicated VM.
- The Omnix Computer Host runs inside the VM on 127.0.0.1:8765.
- The Omnix engine connects to the VM through a configurable host endpoint.
- The setup scripts do not download Windows ISOs or bypass Windows licensing.
- VM creation is separated from Windows installation because hypervisors differ.

## Quick start

1. Create a Windows 11 VM using your preferred hypervisor and a legitimate Windows 11 ISO/license.
2. Boot Windows 11 and install Python.
3. Copy this directory into the VM.
4. Run PowerShell as Administrator: Set-ExecutionPolicy -Scope Process Bypass, then ./setup-agent.ps1
5. Start the host with ./start-agent.ps1
6. From Omnix, set the Computer Host endpoint to http://<VM-IP>:8765.

## Safety defaults

Shell and application installation are disabled by default in the Computer Host. Keep the VM dedicated to agent work, use a separate workspace, and require approval for destructive or external actions.
