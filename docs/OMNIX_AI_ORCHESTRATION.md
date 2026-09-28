# OMNIX AI ORCHESTRATION

OmnixAICore is the central AI entry point. OmnixAgentOrchestrator routes a goal to specialist systems while sharing one project context.

Flow:

USER GOAL
-> AI CORE
-> TASK
-> ORCHESTRATOR
-> WEB / DRAW / ANIMATION / CHART / SHADER / FX / DEBUG / COMPUTER
-> PROJECT CONTEXT
-> TEST
-> RESULT

The router is intentionally deterministic at this foundation stage. Later, an LLM planner can choose tools using structured tool calls, but every tool must still pass its own validation and permission layer.

The orchestrator does not claim that a specialist completed work merely because it was selected.
